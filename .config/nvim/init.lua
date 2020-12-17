local D = os.getenv('DOTFILES') or os.getenv('HOME')..'/.dotfiles'
local o = vim.o

-- This is a magic line that will take your pain away.
o.rtp = string.format('%s/neovim,%s', D, o.rtp)

-- Vanilla Config
require 'plugins'
require 'settings'
require 'autocmd'
require 'keybinds'

-- Plugins Config
require 'plugins/_colorizer'
require "plugins/_completions"
require "plugins/_devicons"
require "plugins/_diagnostics"
require 'plugins/_floaterm'
require "plugins/_formatter"
require 'plugins/_fzf'
require "plugins/_lsp"
require "plugins/_sign"
require "plugins/_st"
require "plugins/_startify"
require 'plugins/_theme'
-- require "plugins/_"
