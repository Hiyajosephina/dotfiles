local opt = vim.opt

-- line numbering
opt.relativenumber = true
opt.number = true

-- indent/tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- wrapping
opt.wrap = false

-- searching
opt.ignorecase = true
opt.smartcase = true
-- cursorline
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- window management
opt.splitright = true
opt.splitbelow = true

-- hyphenated words are one word
opt.iskeyword:append("-")

-- show spaces and eol
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append("eol:↴")
