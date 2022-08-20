# NeoVim Cheatsheet

every command starts with a mode character, 
indicating in which mode the command is active:
  normal mode         n
  insert mode         i
  visual mode         v
  visual block mode   x 
  terminal mode       t 
  command mode        c 

the <leader> key is the space character

my whole NeoVim config is on github: https://github.com/MrOnak/neovim_cfg

## Text Editing
### fast movement
n     h           move one character left
n     j           move one line down
n     k           move one line up
n     l           move one character right

n     w           move one word to the right (moves across lines)
n     b           move one word to the left (moves acros lines)

n     <cr>        moves to the first character in the next line down
n     0           move to beginning of line
n     ^           move to first non-whitespace character in line
n     $           move to end of line
n     I           move to first non-whitespace character and enter insert mode
n     A           move to end-of-line and enter insert mode
n     <C-F>       page one screen down 
n     <C-D>       scroll down one half-screen
n     <C-B>       page one screen up 
n     <C-U>       scroll up one half-screen

### undo / redo
n     u           undo
n     <C-r>       redo

### selecting
n     viw         selects word under cursor (expand selection with b/w)

### search and replace
n     *          do a forward-search for word under cursor
n     #          do a backward-search for word under cursor
n     ciw        quickly replace word under cursor

### copy & paste
n     yy          copy current line
n     [n]yy       copies [n] lines down from and including the current line
n     dd          cut current line
n     [n]dd       cuts [n] lines down from and including the current line
n     p           paste clipboard below current line
n     P           paste clipboard above current line

n     y           copy part that was marked in visual mode
n     d           cut part that was marked in visual mode
n     p           paste at cursor position

### navigating and creating windows
n     <C-w>s      split current window horitontally
n     <C-w>v      split current window vertically

(commands below are customized in .config/nvim/after/plugin/remap.lua)
n     <C-h>       move to window to the left
n     <C-l>       move to window to the right
n     <C-j>       move to window that is below current
n     <C-k>       move to window that is above current
n     <C-Left>    Ctrl-Cursor left makes current window more narrow
n     <C-Right>   makes current window wider
n     <C-Up>      makes current window taller
n     <C-Down>    makes current window less tall

## Inserting and Editing
n     i           enter insert mode to the left of the cursor
n     a           enter insert mode to the right of the cursor
n     o           add empty line below cursor row and enter insert mode
n     O           add empty line above cursor row and enter insert mode
n     s           substitute character under cursor, enter insert mode
n     ciw         quickly replace word under cursor
n     cc          replace current line with an empty one, enter insert mode

## File Explorer (nvim-tree plugin)
normal movement keys 'hjkl' do work in nvim-tree (as per custom config)

n     <leader>e   toggle tree explorer on the left side (as per config)
n     h           closes an opened directory
n     l           opens a closed directory
n     c           puts file/folder on current line in the clipboard
n     p           pasts clipboard at current position in the file structure
n     a           create a new file. append / to create a folder
n     d           delete file/folder on current line

above
 ssl
below














