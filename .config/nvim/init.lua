-- inspired by  https://github.com/alpha2phi/dotfiles
vim.g.mapleader = " "
vim.g.maplocalleader = ","
  
local fn = vim.fn
local execute = vim.api.nvim_command

local function packer_init()
  local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  end
  vim.cmd [[packadd! packer.nvim]]
  vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
end

local function sys_init()
  require "impatient"
end

-- sys_init()

require "packer_compiled"

packer_init()

require("defaults").setup()

require("settings").setup()

require("keymappings").setup()

vim.defer_fn(function()
  require("plugins").setup()
end, 0)
