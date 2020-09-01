## Dotfiles

Mac-Specific dotfiles. Run `link.sh` to run & sync.


### Notes on Keyboard Modification

Uses karabiner elements for keyboard modification. Open karabiner elements, go to `Complet modifications` and click `Add rule` at bottom left. Select all from `Command/Control`, these are defined in the .json file in this repo. The end result is that control and command (alt on normal keyboard) are swapped except for in iTerm. Then some functionality is manually changed in iTerm only for consistency, such as alt+arrow keys for window changing and alt+enter for spotlight.

IMPORTANT: make sure the `swap control-q and command-q...` rule is before the `swap left control and left command` rule. 

I know that I can get the same control command swap execpt for iTerm behavior by using `System Preferences -> ... Modifier Keys` and swapping the modifier keys back in iTerm's preferences. However, due to ordering I guess, these changes aren't picked up by Karabiner, so the iTerm-specific Karabiner rules don't get applied. So, we do everything as a Karabiner complex modification for specificity and to control the ordering. 

