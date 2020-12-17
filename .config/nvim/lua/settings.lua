local map = require "utils".map
local g = vim.g
local go = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local exec = vim.api.nvim_exec

cmd("syntax on")
cmd("filetype plugin indent on")
cmd('let &fcs="eob: "')
cmd('let test#strategy = "floaterm"')
cmd('let test#elixir#exunit#executable = "MIX_ENV=test mix test"')
cmd('let test#javascript#jest#options = "--color=always"')
-- cmd('')

g.gitblame_enabled  = 0
g.gitblame_message_template = '<summary>  • <author> • <date>'

g.ultest_virtual_text = 1
g.ultest_icons = 1

g.rooter_patterns = {'.git/', 'package.json', 'composer.json'}
g.rooter_silent_chdir  = 1
g.rooter_change_directory_for_non_project_files= 'current'

go.shell="fish"
go.mouse = "a"
go.compatible = false
go.encoding = 'UTF-8'
go.termguicolors = true
go.background = 'dark'
go.showmode = false
go.hidden = true
go.timeoutlen = 300
go.ttimeoutlen = 0
go.updatetime = 300
go.ttyfast = true
go.scrolloff = 8
     
go.showcmd = true
go.wildmenu = true
   
wo.number = true
wo.numberwidth = 1
wo.relativenumber = true
wo.signcolumn = "yes"
wo.cursorline = true

go.expandtab = true
go.smarttab = true
go.tabstop = 2
go.cindent = true
go.shiftwidth = 2
go.softtabstop = 2
go.autoindent = true
go.clipboard = "unnamedplus"

wo.wrap = true
bo.textwidth = 100
bo.formatoptions = "qrn1"

go.hlsearch = true
go.ignorecase = true
go.smartcase = true

go.splitbelow = true
go.splitright = true

go.swapfile = false
go.backup = false
go.writebackup = false
go.undofile = true
go.backupdir = "/tmp/"
go.directory = "/tmp/"
go.undodir = "/tmp/"

-- Map <leader> to space
map("n", "<SPACE>", "<Nop>")
g.mapleader = " "


-- For highlighting yanked region
-- cmd('au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = "HighlightedyankRegion", timeout = 120 })')
