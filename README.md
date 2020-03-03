just a simple tmux conf + ssh auto-color setup. prefix is bound to `C-t` for tmux.

run `./install` if you want the *luxury* experience.

to set up ssh to auto-color tmux panes, make sure `tmux-color-ssh.sh` in in your `$PATH` and edit your `~/.ssh/config` to resemble this:

```
PermitLocalCommand=yes
LocalCommand=tmux-color

Host more.dums.*
PermitLocalCommand=yes
LocalCommand=tmux-color
```
