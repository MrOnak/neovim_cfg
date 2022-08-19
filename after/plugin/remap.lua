local opts = {noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten the actual function name
local keymap = vim.api.nvim_set_keymap

--[[
Modes:
  normal mode       = n
  insert mode       = i
  visual mode       = v
  visual block mode = x
  term mode         = t
  command mode      = c
--]]

print("loading keymaps")

---- NORMAL MODE
-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- Ctrl-h: move to the window to the left
keymap("n", "<C-j>", "<C-w>j", opts) -- Ctrl-j: down
keymap("n", "<C-k>", "<C-w>k", opts) -- Ctrl-k: up
keymap("n", "<C-l>", "<C-w>l", opts) -- Ctrl-l: right 

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- toggle (!) explorer on the left side with width 30
-- loaded file will open in the original window where the command was issued
--keymap("n", "<leader>e", ":Lex 30<CR>", opts)
-- nvim-tree toggle for the same purpose as above
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- resize with cursor keys
-- for this to work over PuTTY, two PuTTY settings are required:
--   Terminal > Keyboard > Shift/Ctrl/Alt with the arrow keys: xterm-style bitmap
--   Terminal > Features > Disable application cursor keys mode: must be checked
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h", ":bprevious<CR>", opts)

---- TERMINAL MODE
-- get out of interactive mode on German keyboard (C-\ doesn't exist)
keymap("t", "<C-q>", "<C-\\><C-N>", term_opts)

