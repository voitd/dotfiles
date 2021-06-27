local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"
-- cmd('')

apply_globals(
  {
    dict = "/Users/void/.config/word10k.txt",
    gtblame_enabled = 0,
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
    jsx_ext_required = 1,
    javascript_plugin_flow = 1,
    Hexokinase_highlighters = {"foregroundfull"},
    lengthmatters_highlight_one_column = 1,
    vsnip_filetypes = {
      javascriptreact = {"javascript", "html"},
      typescriptreact = {"typescript", "html"},
      vue = {"vue", "javascript", "html"}
    },
    -- vim-test
    -- ["test#strategy"] = "floaterm",
    -- ["test#elixir#exunit#executable"] = "MIX_ENV=test mix test",
    -- ["test#javascript#runner"] = "jest",
    -- ["test#javascript#jest#executable"] = "CI=true yarn test",
    -- ["test#javascript#jest#options"] = "--color=always",
    -- ["test#javascript#jest#file_pattern"] = [[\v(__tests__/.*|(spec|test))\.(js|jsx|ts|tsx)$]],
    -- Improve startup
    loaded_gzip = 1,
    loaded_tar = 1,
    loaded_tarPlugin = 1,
    loaded_zip = 1,
    loaded_zipPlugin = 1,
    loaded_getscript = 1,
    loaded_getscriptPlugin = 1,
    loaded_vimball = 1,
    loaded_vimballPlugin = 1,
    loaded_matchit = 1,
    -- loaded_matchparen = 1,
    loaded_2html_plugin = 1,
    loaded_logiPat = 1,
    loaded_rrhelper = 1,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    loaded_netrwSettings = 1,
    loaded_netrwFileHandlers = 1,
    -- matchup
    matchup_matchparen_timeout = 100,
    matchup_matchparen_deferred = 1,
    matchup_matchparen_deferred_show_delay = 150,
    matchup_matchparen_deferred_hide_delay = 700,
    matchup_matchparen_hi_surround_always = 1,
    matchup_matchparen_offscreen = {method = "popup", highlight = "CurrentWord"},
    matchup_delim_start_plaintext = 0,
    matchup_motion_override_Npercent = 0,
    matchup_motion_cursor_end = 0,
    matchup_mappings_enabled = 0,
    --gruvbox
    gruvbox_material_palette = "material",
    gruvbox_material_sign_column_background = "none",
    -- gruvbox_material_sign_column_background = "bg0",
    gruvbox_material_background = "medium",
    gruvbox_material_enable_italic = 1,
    gruvbox_material_enable_bold = 1,
    gruvbox_material_diagnostic_line_highlight = 0,
    gruvbox_material_diagnostic_text_highlight = 1,
    gruvbox_material_diagnostic_virtual_text = "colored",
    gruvbox_material_current_word = "bold",
    -- gruvbox_material_better_performance = 1,
    -- rigel
    rigel_italic = 1,
    rigel_bold = 1,
    tokyonight_style = "storm",
    tokyonight_italic_functions = true,
    tokyonight_italic_comments = true,
    tokyonight_sidebars = {"quickfix", "terminal", "floaterm"}
    -- indent_blankline_char = '▏',
    -- indent_blankline_show_first_indent_level = false,
    -- indent_blankline_filetype_exclude = {
    --     'help',
    --     'markdown',
    --     'gitcommit',
    --     'packer',
    -- },
    -- indent_blankline_buftype_exclude = { 'terminal', 'nofile' },
    -- indent_blankline_use_treesitter = true,
    -- indent_blankline_show_current_context = true
    -- indent_blankline_context_patterns =
    --     {
    --         'class', 'function', 'method', '^if', '^while', '^for', '^object',
    --         '^table', 'block', 'arguments'
    --     }
  }
)
