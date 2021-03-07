" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["codi.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf-checkout.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/fzf-checkout.vim"
  },
  ["fzf-lsp.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/fzf-lsp.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["github-light.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/github-light.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/void/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["paper.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/paper.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rigel = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/rigel"
  },
  ["rooter.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/rooter.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/undotree"
  },
  vim = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-efm-langserver-settings"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-efm-langserver-settings"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-import-js"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-import-js"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-javascript"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-lengthmatters"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-lengthmatters"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  },
  ["vue-vscode-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vue-vscode-snippets"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
