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

--- nvim-tree toggle for the same purpose as above
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- resize with cursor keys
-- for this to work over PuTTY, two PuTTY settings are required:
--   Terminal > Keyboard > Shift/Ctrl/Alt with the arrow keys: xterm-style bitmap
--   Terminal > Features > Disable application cursor keys mode: must be checked
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- telescope fuzzy finder
keymap("n", "<leader>t", ":Telescope<CR>", opts)
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>tl", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>tm", ":Telescope media_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope git_status<CR>", opts)
keymap("n", "<leader>tts", ":Telescope treesitter<CR>", opts)

-- telekasten
keymap("n", "<leader>z", ":Telekasten panel<CR>", opts)
keymap("n", "<leader>zf", ":Telekasten find_notes<CR>", opts)
keymap("n", "<leader>zn", ":Telekasten new_note<CR>", opts)
keymap("n", "<leader>zln", ":Telekasten insert_link<CR>", opts)
keymap("n", "<leader>zlf", ":Telekasten follow_link<CR>", opts)
keymap("n", "<leader>zls", ":Telekasten show_backlinks<CR>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

---- TERMINAL MODE
-- get out of interactive mode on German keyboard (C-\ doesn't exist)
keymap("t", "<C-q>", "<C-\\><C-N>", term_opts)

