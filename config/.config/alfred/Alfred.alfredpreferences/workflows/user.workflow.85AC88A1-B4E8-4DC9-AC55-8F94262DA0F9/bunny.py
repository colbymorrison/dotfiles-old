from __future__ import absolute_import, print_function
import errno
import json
import os
import os.path as path
import plistlib
import sys
import traceback
from xml.etree import ElementTree

MAX_RESULTS = 9

user = path.expanduser('~/Library/')
FALLBACKS_PLIST_FILE = user + 'Application Support/Alfred 3/Alfred.alfredpreferences/preferences/features/defaultresults/prefs.plist'
BUNNY_FALLBACK_ADDED_FILE = user + 'Application Support/Alfred 3/Alfred.alfredpreferences/preferences/features/defaultresults/bunny_added'
BUNNY_COMMANDS_FILE = user + 'Caches/com.runningwithcrayons.Alfred-3/Workflow Data/com.facebook.bunny/commands.json'
BUNNY_FALLBACK_COMMANDS_FILE = 'fallback_commands.json'

# How old in seconds the command file should be before we try to update it.
BUNNY_FETCH_AGE = 432000


def main():
    fetch_commands()
    maybe_insert_fallback_search()
    commands = load_commands()

    if len(sys.argv) != 2:
        print('Usage: python bunny.py QUERY')
        sys.exit(1)

    query = sys.argv[1].strip().split(' ', 1)
    if len(query) == 2:
        input_command, input_arg = query
    else:
        input_command, input_arg = query[0], None
    input_command = input_command.lower()

    matches = []
    for command, description in commands.iteritems():
        description = '[%s] %s' % (command, description or '')
        index = description.lower().find(input_command)
        if index >= 0:
            if index == 1 and input_command == command:
                matches.append((-1, command, description))
            else:
                matches.append((index, command, description))

    matches = sorted(matches)[:MAX_RESULTS]
    print(xml(matches, input_arg))


def fetch_commands():
    import time

    if (path.exists(BUNNY_COMMANDS_FILE) and
        time.time() - path.getmtime(BUNNY_COMMANDS_FILE) < BUNNY_FETCH_AGE):
        return

    pid = os.fork()
    if pid > 0:
        # We're the parent
        return

    # We're the child
    import urllib
    import urllib2

    command_update = plistlib.readPlist('config.plist')['command_update']
    url = command_update['url']

    del command_update['url']
    data = urllib.urlencode(command_update)
    try:
        content = urllib2.urlopen(url=url, data=data)
    except urllib2.URLError:
        sys.exit(1)

    make_directories_if_necessary(os.path.dirname(BUNNY_COMMANDS_FILE))

    with open(BUNNY_COMMANDS_FILE, 'w') as f:
        f.write(content.read())

    sys.exit()


def load_commands():
    try:
        return json.load(open(BUNNY_COMMANDS_FILE))
    except Exception:
        return json.load(open(BUNNY_FALLBACK_COMMANDS_FILE))


def make_directories_if_necessary(dir):
    try:
        os.makedirs(dir)
    except OSError as e:
        if e.errno == errno.EEXIST and path.isdir(dir):  # Dir exists
            pass
        else:
            raise


def maybe_insert_fallback_search():
    # If we've done this before, don't do it again.
    if path.exists(BUNNY_FALLBACK_ADDED_FILE):
        return

    try:
        prefs = plistlib.readPlist(FALLBACKS_PLIST_FILE)
    except IOError as e:
        if e.errno == errno.ENOENT:  # File not found
            # The plist file won't exist if nothing has been customized yet.
            prefs = {}
        else:
            raise

    # If fallback searches have never been customized, 'fallbacks' won't be in
    # the plist yet. Let's use the defaults from the current version of Alfred.
    if 'fallbacks' not in prefs:
        prefs['fallbacks'] = [
            'features.websearch.google.fallback',
            'features.websearch.amazon.fallback',
            'features.websearch.wiki.fallback',
        ]

    bunny_fallback_uid = plistlib.readPlist('config.plist')['fallbackuid']
    if bunny_fallback_uid not in prefs['fallbacks']:
        prefs['fallbacks'].insert(0, bunny_fallback_uid)

    make_directories_if_necessary(path.dirname(FALLBACKS_PLIST_FILE))
    plistlib.writePlist(prefs, FALLBACKS_PLIST_FILE)

    # Create the file so we don't do this again.
    open(BUNNY_FALLBACK_ADDED_FILE, 'a').close()


def xml(items, arg):
    root = ElementTree.Element('items')
    for item in items:
        root.append(xml_item(item, arg))
    return ElementTree.tostring(root, encoding='utf-8')


exact_match = False


def xml_item((score, command, description), arg):
    global exact_match
    if score == -1:
        exact_match = True
    attributes = {
        'arg': command + (' ' + arg if arg else ''),
        'autocomplete': command,
    }
    # Only add the UIDs if we don't have an exact match. This keeps Alfred from
    # defaulting to a previously-used command instead of the exact match.
    if not exact_match:
        attributes.update({
            'uid': 'com.facebook.bunny-' + command,
        })
    item = ElementTree.Element('item', attrib=attributes)
    ElementTree.SubElement(item, 'title').text = command
    ElementTree.SubElement(item, 'subtitle').text = description.split(' ', 1)[1]
    ElementTree.SubElement(item, 'icon').text = 'icon.png'
    return item


if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        # Display the error in Alfred
        exc_type, exc_value, exc_traceback = sys.exc_info()
        command = ' / '.join(traceback.format_exception_only(exc_type,
                                                             exc_value))
        description = traceback.format_tb(exc_traceback)[-1]
        print(xml([(0, command, description)], ''))
