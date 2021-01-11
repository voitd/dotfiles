local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"

-- cmd('')

apply_globals(
  {
    ultest_icons = 1,
    gitblame_enabled = 0,
    gitblame_message_template = "     <author> • <summary> • <date>",
    lengthmatters_highlight_one_column = 1,
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
    javascript_plugin_jsdoc = 1,
    bufferline = {
      animation = false,
      maximum_padding = 0,
      icon_separator_active = "",
      icon_separator_inactive = ""
    },
    Hexokinase_highlighters = {"foregroundfull"},
    lineletters_settings = {
      prefix_chars = {"t", "n"}
    },
    completion_confirm_key = "",
    completion_trigger_character = {".", "::"},
    completion_auto_change_source = 1,
    completion_enable_auto_paren = 1,
    completion_enable_auto_signature = 1,
    completion_enable_auto_hover = 1,
    completion_enable_snippet = "vim-vsnip",
    completion_sorting = "none",
    completion_customize_lsp_label = {
      Function = " [function]",
      Method = " [method]",
      Reference = " [refrence]",
      Enum = " [enum]",
      Field = "ﰠ [field]",
      Keyword = " [key]",
      Variable = " [variable]",
      Folder = " [folder]",
      Snippet = " [snippet]",
      Operator = " [operator]",
      Module = " [module]",
      Text = "ﮜ [text]",
      Class = " [class]",
      Interface = " [interface]",
      File = " [file]"
    },
    ["test#strategy"] = "kitty",
    ["test#elixir#exunit#executable"] = "MIX_ENV=test mix test",
    ["test#javascript#runner"] = "jest",
    ["test#javascript#jest#executable"] = "CI=true yarn test",
    ["test#javascript#jest#options"] = "--color=always",
    ["test#javascript#jest#file_pattern"] = [[\v(__tests__/.*|(spec|test))\.(js|jsx|ts|tsx)$]]
  }
)
