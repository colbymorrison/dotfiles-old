#! /bin/python
import asyncio
from i3ipc.aio import Connection

# Don't accidentally CMD-Q from w/in VM
async def protecc():
    app_focused = False

    i3 = await Connection().connect()
    tree = await i3.get_tree()

    app_open = tree.find_classed('Qemu-system-x86_64')
    focused = tree.find_focused().workspace().name 

    for app in app_open:
        if app.workspace().name == focused:
            app_focused = True

    if not app_focused:
        await i3.command('kill')
    

if __name__ == "__main__":
    asyncio.run(protecc())
