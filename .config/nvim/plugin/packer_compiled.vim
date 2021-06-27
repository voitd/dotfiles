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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/void/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AbbrevMan.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/AbbrevMan.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/fzf"
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
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
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
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/quick-scope"
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/undotree"
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
  ["vim-javascript"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-javascript"
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
  ["vscode-vue-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vscode-vue-snippets"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
