-- Options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line Wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Backspace
opt.backspace = "indent,eol,start"

-- Mouse
opt.mouse = "a"

-- Time for updates
opt.updatetime = 250
opt.timeoutlen = 300

-- Swapfile
opt.swapfile = false

-- Scrolloff
opt.scrolloff = 8 -- Keep 8 lines above/below cursor
