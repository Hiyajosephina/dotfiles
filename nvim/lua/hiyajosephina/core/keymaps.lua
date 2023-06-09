vim.g.mapleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-------------
-- Plugins --
-------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree 
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- toggle term
keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
keymap.set("t", "<leader>tt", "<C-\\><C-n>:ToggleTerm<CR>")
keymap.set("t", "<esc>", "<C-\\><C-n>:ToggleTerm<CR>")
keymap.set("t", "<C-w>", "<C-\\><C-n>:ToggleTerm<CR>")
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- peek
keymap.set("n", "<leader>po", ":PeekOpen<CR>")
keymap.set("n", "<leader>pc", ":PeekClose<CR>")
keymap.set("n", "<leader>pt", ":PeekToggle<CR>")

-- todo-comments
keymap.set("n", "<leader>td", ":TodoTelescope<CR>")

-- disable arrow keys in normal mode
keymap.set("n", "<up>", "<nop>")
keymap.set("n", "<down>", "<nop>")
keymap.set("n", "<left>", "<nop>")
keymap.set("n", "<right>", "<nop>")
-- disable arrow keys in insert mode
keymap.set("i", "<up>", "<nop>")
keymap.set("i", "<down>", "<nop>")
keymap.set("i", "<left>", "<nop>")
keymap.set("i", "<right>", "<nop>")
-- disable arrow keys in visual mode
keymap.set("v", "<up>", "<nop>")
keymap.set("v", "<down>", "<nop>")
keymap.set("v", "<left>", "<nop>")
keymap.set("v", "<right>", "<nop>")
