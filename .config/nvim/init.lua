local U = require('utils')
-- local D = os.getenv('DOTFILES') or os.getenv('HOME')..'/.dotfiles'
local D = os.getenv('HOME')..'/.config'
local o = vim.o

U.disable_distribution_plugins()
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
require "plugins/_devicons"
require 'plugins/_floaterm'
require "plugins/_formatter"
require 'plugins/_fzf'
require "plugins/_sign"
require "plugins/_startify"
require "plugins/_st"
require "plugins/_coc"
require "plugins/_rooter"
require 'plugins/_nord'
require 'plugins/_sneak'
-- require "plugins/_rigel"
require "plugins/_lsp"
-- require 'plugins/_tree'
-- require "plugins/_completions"
require "plugins/_diagnostics"
-- require 'plugins/_tsitter'
-- require "plugins/_"

