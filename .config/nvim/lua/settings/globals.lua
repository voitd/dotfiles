local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"

-- cmd('')
-- cmd('let g:vsnip_filetypes = {}')
-- cmd('let g:vsnip_filetypes.javascriptreact = ["javascript"]')

apply_globals(
  {
    ultest_icons = 1,
    dict = '/Users/void/.config/word10k.txt',
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
    tagalong_additional_filetypes = {"javascript"},
    closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact",
    closetag_regions = {
      ["typescript.tsx"] = "jsxRegion,tsxRegion",
      ["javascript.jsx"] = "jsxRegion"
    },
    user_emmet_install_global = 0,
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
    user_emmet_settings = {
      javascript = {
        extends = "jsx"
      }
    },
    vsnip_filetypes = {
      javascriptreact = {'javascript'},
      typescriptreact = {'typescript'},
      ['javascript.jsx'] = {'javascript'},
      ['typescript.jsx'] = {'typescript'}
    },
    chad_settings = {  
      keymap = {
        new = "a",
        tertiary = "o",
        open_sys = "O"
      }

    },
    -- Completion.nvim
    -- completion_confirm_key = "",
    -- completion_trigger_character = {".", "::"},
    -- completion_auto_change_source = 1,
    -- completion_enable_auto_paren = 1,
    -- completion_enable_auto_signature = 1,
    -- completion_enable_auto_hover = 1,
    -- completion_enable_snippet = "vim-vsnip",
    -- completion_sorting = "none",
    -- -- completion_timer_cycle = 200,
    -- completion_customize_lsp_label = {
    --   Function = " [function]",
    --   Method = " [method]",
    --   Reference = " [refrence]",
    --   Enum = " [enum]",
    --   Field = "ﰠ [field]",
    --   Keyword = " [key]",
    --   Variable = " [variable]",
    --   Folder = " [folder]",
    --   Operator = " [operator]",
    --   Module = " [module]",
    --   Text = "ﮜ [text]",
    --   Class = " [class]",
    --   Interface = " [interface]",
    --   File = " [file]",
    --   Value = "\u{f89f} [value]",
    --   Constant = "\u{f8fe} [constant]",
    --   Struct = "\u{fb44} [struct]",
    --   EnumMember = "\u{f02b} [enum member]",
    --   Color = "\u{e22b} [color]",
    --   Property = "\u{e624} [property]",
    --   Unit = "\u{f475} [unit]",
    --   Event = "\u{facd} [event]",
    --   TypeParameter = "\u{f728} [type param]",
    --   Default = "\u{f29c} [default]",
    --   Buffers = " [buffers]",
    --   Snippet = " [snippet]",
    --   ["vim-vsnip"] = " [snippet]"
    -- },
    -- vim-test
    ["test#strategy"] = "floaterm",
    ["test#elixir#exunit#executable"] = "MIX_ENV=test mix test",
    ["test#javascript#runner"] = "jest",
    ["test#javascript#jest#executable"] = "CI=true yarn test",
    ["test#javascript#jest#options"] = "--color=always",
    ["test#javascript#jest#file_pattern"] = [[\v(__tests__/.*|(spec|test))\.(js|jsx|ts|tsx)$]],
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
    loaded_netrwFileHandlers = 1
  }
)
