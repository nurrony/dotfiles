local opt = vim.opt -- for conciseness

opt.encoding = 'UTF-8'

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.cmdheight = 1 -- commonad bar height in nvim
opt.completeopt = 'menuone,noinsert,noselect' -- how the completion menu behave

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.scrolloff = 10 -- scrolloff limit


-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.swapfile = false -- turn off swapfile
opt.backup = false -- disable backup
opt.hidden = true -- change buffer without saving
opt.errorbells = false -- turn of the error bells

opt.autochdir = false -- do not auto change the directory
opt.iskeyword:append('-') -- treat hyphen as keyword

-- mouse
opt.mouse = "a"

-- history
opt.history = 1000
