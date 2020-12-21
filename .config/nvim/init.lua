local u = require('utils')
local D = os.getenv('DOTFILES') or os.getenv('HOME')..'/.dotfiles'
local o = vim.o

u.disable_distribution_plugins()
-- This is a magic line that will take your pain away.
o.rtp = string.format('%s/nvim,%s', D, o.rtp)

-- Vanilla Config
require 'plugins'
require 'settings'
require 'autocmd'
require 'keybinds'
require 'opts'

-- Plugins Config
require 'plugins/_colorizer'
require 'plugins/_devicons'
require 'plugins/_floaterm'
require 'plugins/_formatter'
require 'plugins/_sign'
require 'plugins/_startify'
require 'plugins/_theme'
require 'plugins/_st'
require 'plugins/_fzf'
require 'plugins/_coc'

