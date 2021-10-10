local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"
-- cmd('')

apply_globals(
  {
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy"
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste"
      },
      cache_enabled = 0
    },
    python_host_prog = "/usr/bin/python",
    python3_host_prog = "/usr/local/bin/python3",
    Hexokinase_highlighters = {"foregroundfull"},
    -- lengthmatters_highlight_one_column = 1,
    vsnip_filetypes = {
      javascriptreact = {"javascript", "html"},
      typescriptreact = {"typescript", "html"},
      vue = {"vue", "javascript", "html"}
    },
    -- vim-test
    ultest_use_pty = 1,
    --  ["test#strategy"] = "neovim",
    --  ["test#neovim#term_position"] = "vert botright 80",
    ["test#strategy"] = "kitty",
    --  ["test#elixir#exunit#executable"] = "MIX_ENV=test mix test",
    ["test#javascript#runner"] = "jest",
    ["test#javascript#jest#executable"] = "CI=true yarn test",
    ["test#javascript#jest#options"] = "--color=always --watch",
    ["test#javascript#jest#file_pattern"] = [[\v(__tests__/.*|(spec|test))\.(js|jsx|ts|tsx)$]],
    -- matchup
    matchup_matchparen_timeout = 100,
    matchup_matchparen_deferred = 1,
    matchup_matchparen_deferred_show_delay = 150,
    matchup_matchparen_deferred_hide_delay = 700,
    matchup_matchparen_hi_surround_always = 1,
    --  matchup_matchparen_offscreen = {method = "popup", highlight = "Visual"},
    matchup_delim_start_plaintext = 0,
    matchup_motion_override_Npercent = 0,
    matchup_motion_cursor_end = 0,
    matchup_mappings_enabled = 0
    --gruvbox
    --  gruvbox_material_palette = "material",
    --  gruvbox_material_sign_column_background = "none",
    --  gruvbox_material_sign_column_background = "bg0",
    --  gruvbox_material_background = "medium",
    --  gruvbox_material_enable_italic = 1,
    --  gruvbox_material_enable_bold = 1,
    --  gruvbox_material_diagnostic_line_highlight = 0,
    --  gruvbox_material_diagnostic_text_highlight = 1,
    --  gruvbox_material_diagnostic_virtual_text = "colored",
    --  gruvbox_material_current_word = "bold",
    --  gruvbox_material_better_performance = 1
  }
)

local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
