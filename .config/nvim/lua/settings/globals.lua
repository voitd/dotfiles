local g = vim.g
local cmd = vim.cmd
local apply_globals = require "settings.utils".apply_globals

cmd "filetype plugin indent on"
-- cmd "syntax enable"
-- cmd('')

apply_globals(
  {
    ultest_icons = 1,
    dap_virtual_text = true,
    dict = "/Users/void/.config/word10k.txt",
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
    tagalong_additional_filetypes = {"javascript", "vue"},
    -- matchtag
    vim_matchtag_enable_by_default = 0,
    vim_matchtag_both = 0,
    vim_matchtag_files = "*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp",
    -- closetag
    closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact,vue",
    closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx,*.vue",
    closetag_emptyTags_caseSensitive = 1,
    closetag_shortcut = ">",
    closetag_regions = {
      ["typescript.tsx"] = "jsxRegion,tsxRegion",
      ["javascript.jsx"] = "jsxRegion"
    },
    -- emmet
    user_emmet_mode = "i",
    user_emmet_leader_key = ",",
    user_emmet_expandabbr_key = "<C-a><C-a>",
    user_emmet_install_global = 0,
    user_emmet_install_command = 0,
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
    -- snippets
    vsnip_filetypes = {
      javascriptreact = {"javascript", "html"},
      typescriptreact = {"typescript", "html"},
      vue = {"vue", "javascript", "html"}
    },
    --[[ vsnip_filetypes = {},
    ["vsnip_filetypes.javascriptreact"] = {"javascript"},
    ["vsnip_filetypes.vue"] = {"vue", "javascript", "typescript"},
    ["vsnip_filetypes.typescriptreact"] = {"typescript"}, ]]
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
