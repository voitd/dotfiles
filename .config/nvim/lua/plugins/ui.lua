local cmd, g = vim.cmd, vim.g

local hiLinks = require "settings.utils".hiLinks
local apply_globals = require "settings.utils".apply_globals
local highlights = require "settings.utils".highlights

cmd "syntax sync fromstart"
cmd "syntax enable"
cmd "set termguicolors"

-- vim.cmd "colorscheme paper"

-- vim.cmd "set background=light"
vim.cmd "hi! link MatchWord Underlined"
