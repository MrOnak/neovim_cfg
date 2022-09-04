# NeoVim Cheatsheet

every command starts with a mode character,
indicating in which mode the command is active:

| mode name          | indicator |
| ------------------ | --------- |
| normal mode        | n |
| insert mode        | i |
| visual mode        | v |
| visual block mode  | x |
| terminal mode      | t |
| command mode       | c |

the `<leader>` key is the space character

my whole NeoVim config is on github: https://github.com/MrOnak/neovim_cfg

## Text Editing
### fast movement
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | h         | move one character left |
| n    | j         | move one line down |
| n    | k         | move one line up |
| n    | l         | move one character right |
|      |           | |
| n    | w         | move one word to the right (moves across lines) |
| n    | b         | move one word to the left (moves acros lines) |
|      |           | |
| n    | Ctrl-f    | page one screen down  |
| n    | Ctrl-d    | scroll down one half-screen |
| n    | Ctrl-b    | page one screen up  |
| n    | Ctrl-u    | scroll up one half-screen |
|      |           | |
| n    | {         | go up to next paragraph |
| n    | }         | go down to previous paragraph |
|      |           | |
| n    | gg        | move to top of document |
| n    | G         | move to bottom of document |
|      |           | |
| n    | :[n]      | absolute movement: go to line [n] |
| n    | [n]j      | relative movement: go down [n] lines |
| n    | [n]k      | relative movement: go up [n] lines |
|      |           | |
| n    | %         | matching movement: go to brace matching the one under cursor |

### in-line movements
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | `<cr>`    | moves to the first character in the next line down |
| n    | 0         | move to beginning of line |
| n    | ^         | move to first non-whitespace character in line |
| n    | $         | move to end of line |
| n    | I         | move to first non-whitespace character and enter insert mode |
| n    | A         | move to end-of-line and enter insert mode |
|      |           | |
| n    | fx / Fx   | jump on top of first x to the right / left of cursor |
| n    | tx / Tx   | jump before first x to the right / left of cursor |
|      | ;         | after f/F or t/T: jump to next instance of character |
|      | ,         | after f/F or t/T: jump to previous instance of character |

### undo / redo
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | u         | undo |
| n    | Ctrl-r    | redo |

### selecting
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | viw       | selects word under cursor (expand selection with b/w) |

### search and replace
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | *         | do a forward-search for word under cursor |
| n    | #         | do a backward-search for word under cursor |
| n    | ciw       | quickly replace word under cursor |
| n    | /         | start searching for phrase (after `<cr>`) |
| n    | n         | find next occurance |
| n    | Shift-n   | find previous occurance |

### copy & paste
| mode | key seq. | description |
| ---- | --------- | ----------- |
| n    | i         | enter insert mode to the left of the cursor |
| n    | yy        | copy current line |
| n    | [n]yy     | copies [n] lines down from and including the current line |
| n    | dd        | cut current line |
| n    | [n]dd     | cuts [n] lines down from and including the current line |
| n    | p         | paste at cursor position |
| n    | p         | paste clipboard below current line |
| n    | P         | paste clipboard above current line |
|      |           | |
| n    | y         | copy part that was marked in visual mode |
| n    | yw        | copy portion of word to the right of the cursor |
| n    | yb        | copy portion of word to the left of the cursor |
| n    | yj        | copy current line and one below |
| n    | yk        | copy current line and one above |
| n    | y[tTfF]   | combine copy with jump-to to copy up to next character |
| n    | c         | cut part that was marked in visual mode and enter insert mode |
| n    | C         | cut part of the line behind the cursor and enter insert mode |
| n    | d         | cut part that was marked in visual mode |
| n    | D         | cut part of the line behind the cursor |
| n    | dw        | cut portion of word to the right of the cursor |
| n    | db        | cut portion of word to the left of the cursor |
| n    | dj        | cut current line and one below |
| n    | dk        | cut current line and one above |
| n    | d[tTfF]   | combine delete with jump-to to delete up to next character |

### navigating and creating windows
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | `<C-w>`s  | split current window horizontally |
| n    | `<C-w>`v  | split current window vertically |
| n    | `<C-w>`o  | closes all but current split |
| n    | `<C-w>`=  | equally resize all splits |
| n    | `<C-w>`r  | rotate splits |
| n    | `<C-w>`H  | change from vertical to horizontal split |

(commands below are customized in .config/nvim/after/plugin/remap.lua) |
| mode | key seq.    | description |
| ---- | ----------- | ----------- |
| n    | Ctrl-h      | move to window to the left |
| n    | Ctrl-l      | move to window to the right |
| n    | Ctrl-j      | move to window that is below current |
| n    | Ctrl-k      | move to window that is above current |
| n    | `<C-Left>`  | Ctrl-Cursor left makes current window more narrow |
| n    | `<C-Right>` | makes current window wider |
| n    | `<C-Up>`    | makes current window taller |
| n    | `<C-Down>`  | makes current window less tall |

## Inserting and Editing
| mode | key seq.  | description |
| ---- | --------- | ----------- |
| n    | a         | enter insert mode to the right of the cursor |
| n    | o         | add empty line below cursor row and enter insert mode |
| n    | O         | add empty line above cursor row and enter insert mode |
| n    | x         | delete character under cursor |
| n    | s         | substitute character under cursor, enter insert mode |
| n    | cw        | quickly replace word part to the right of cursor |
| n    | ciw       | quickly replace word under cursor |
| n    | cc        | replace current line with an empty one, enter insert mode |
| n    | S         | replace current line with empty one, enter indented insert mode |

## Moving between files
| mode | key seq.    | description |
| ---- | ----------- | ----------- |
| n    | Shift-l     | display next buffer |
| n    | Shift-h     | display previous buffer |
| n    | Ctrl-^      | toggles to last buffer |
| n    | Ctrl-o      | jump to last change in history |
| n    | Ctrl-i      | jump to next change in history |

## File Explorer (nvim-tree plugin)
normal movement keys 'hjkl' do work in nvim-tree (as per custom config)

| mode | key seq.    | description |
| ---- | ----------- | ----------- |
| n    | `<leader>`e | toggle tree explorer on the left side (as per config) |
| n    | h           | closes an opened directory |
| n    | l           | opens a closed directory |
| n    | c           | puts file/folder on current line in the clipboard |
| n    | p           | pasts clipboard at current position in the file structure |
| n    | a           | create a new file. append / to create a folder |
| n    | d           | delete file/folder on current line |

