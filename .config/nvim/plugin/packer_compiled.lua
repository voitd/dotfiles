-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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
  ["alternate-toggler"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/alternate-toggler"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["commented.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/commented.nvim"
  },
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["focus.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/focus.nvim"
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
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["mark-radar.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/mark-radar.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
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
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-window.git"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/nvim-window.git"
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/undotree"
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
  ["vim-jsx"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-jsx"
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
  ["vim-test"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  },
  ["vscode-vue-snippets"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/vscode-vue-snippets"
  },
  ["wind-colors"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/wind-colors"
  },
  ["windline.nvim"] = {
    loaded = true,
    path = "/Users/void/.local/share/nvim/site/pack/packer/start/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
