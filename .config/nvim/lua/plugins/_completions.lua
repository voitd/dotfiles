local map = require "utils".map
local o = vim.o
local g = vim.g

-- o.completeopt = "menuone,noinsert,noselect"
-- o.shortmess = vim.o.shortmess .. "c"
o.omnifunc = "lua.vim.lsp.omnifunc"
-- g.completion_confirm_key = ""
g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
g.completion_trigger_character = {".", "::"}
g.completion_trigger_keyword_length = 2
g.completion_auto_change_source = 1
g.completion_enable_auto_paren = 1
g.completion_enable_auto_signature = 1
g.completion_enable_auto_hover = 1
g.completion_enable_snippet = 'vim-vsnip'
-- g.completion_enable_snippet = 'UltiSnips'
-- g.completion_sorting = 'none'
-- g.max_items = 15
-- g.completion_enable_fuzzy_match = 1

-- g.completion_customize_lsp_label = {
--     Function = " [function]",
--     Method = " [method]",
--     Reference = " [refrence]",
--     Enum = " [enum]",
--     Field = "ﰠ [field]",
--     Keyword = " [key]",
--     Variable = " [variable]",
--     Folder = " [folder]",
--     Snippet = " [snippet]",
--     Operator = " [operator]",
--     Module = " [module]",
--     Text = "ﮜ[text]",
--     Class = " [class]",
--     Interface = " [interface]",
--     File = " [file]"
-- }

-- g.completion_items_priority = {
--     Field = 5,
--     Function = 7,
--     Module = 7,
--     Variables = 7,
--     Method = 10,
--     Interfaces = 5,
--     Constant = 5,
--     Class = 5,
--     Keyword = 4,
--     UltiSnips = 1,
--     ["vim-vsnip"] = 5,
--     Buffers = 1,
--     TabNine = 0,
--     File = 0
-- }
g.chain_complete_list = {
  default = {
    {complete_items = {"lsp", "snippet"}},
    {complete_items = {"path"}, triggered_only = {"./", "/"}},
    {complete_items = {"buffers"}},
    -- {complete_items = {"ts"}},
    {mode = "<c-j>"},
    {mode = "<c-k>"},
    {mode = "dict"},
  },
  -- string = {
  --   {complete_items = {"path"}, triggered_only = {"./", "/"}},
  --   {complete_items = {"buffers"}}
  -- },
  -- comment = {
  --   {complete_items = {"buffers"}}
  -- }
}


