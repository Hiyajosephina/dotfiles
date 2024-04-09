local keymap = vim.keymap
-- leader
vim.g.mapleader = " "

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
