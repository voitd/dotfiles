-- local D = os.getenv("HOME") .. "/.config"
-- local o = vim.o

-- This is a magic line that will take your pain away.
-- o.rtp = string.format("%s/nvim,%s", D, o.rtp)

-- Vanilla Config
require "settings"

-- Plugins Config
require "plugins"

-- LSP
require "lsp"
-- require "coc"


-- if vim.fn.exists('g:coc') == 1 then
--   require"coc"
--   return
-- end

