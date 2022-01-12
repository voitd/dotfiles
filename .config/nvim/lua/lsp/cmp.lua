local cmp = require "cmp"
local types = require "cmp.types"
local fn = vim.fn

local WIDE_HEIGHT = 40

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
  experimental = {
    ghost_text = true,
    native_menu = false
  },
  snippet = {
    expand = function(args)
      fn["vsnip#anonymous"](args.body)
    end
  },
  sorting = {
    priority_weight = 2
  },
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.InsertEnter,
      types.cmp.TriggerEvent.TextChanged
    },
    completeopt = "menu,menuone,noselect"
  },
  preselect = types.cmp.PreselectMode.Item,
  documentation = {
    winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
    maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
    maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
  },
  sources = {
    {name = "path"},
    {name = "nvim_lsp"},
    {name = "vsnip"},
    {name = "buffer"}
  },
  mapping = {
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "s"}),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "s"}),
    ["<Esc>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
    ),
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end,
      {"i", "s"}
    ),
    ["<S-Tab>"] = cmp.mapping(
      function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end,
      {"i", "s"}
    )
  },
  formatting = {
    deprecated = true,
    fields = {"kind", "abbr", "menu"},
    format = function(entry, vim_item)
      local menu = {
        nvim_lsp = " ",
        vsnip = " ",
        path = " ",
        buffer = " "
      }
      local kind = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = " ",
        Field = "ﰠ",
        Variable = " ",
        Class = " ",
        Interface = "",
        Module = " ",
        Property = "",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "<>"
      }
      vim_item.menu = menu[entry.source.name]
      vim_item.kind = kind[vim_item.kind]
      return vim_item
    end
  }
}

-- Use buffer source for `/`.
cmp.setup.cmdline(
  "/",
  {
    sources = cmp.config.sources(
      {
        {name = "fuzzy_buffer"}
      },
      {
        {name = "nvim_lsp_document_symbol"}
      }
    )
  }
)

cmp.setup.cmdline(
  "?",
  {
    sources = {
      {name = "buffer"}
    }
  }
)

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline", keyword_length = 2}
      }
    )
  }
)

vim.cmd(
  [[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]]
)

vim.cmd "au VimEnter * hi! CmpItemAbbrMatch guifg=#AA82E0 guibg=NONE"
vim.cmd "au VimEnter * hi! CmpItemAbbrMatchFzzy guifg=Purple guibg=NONE"
vim.cmd "au VimEnter * hi! CmpItemKind guifg=#AA82E0 guibg=NONE"
vim.cmd "au VimEnter * hi! CmpItemMenu guifg=#82E0AA guibg=NONE"
