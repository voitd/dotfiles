local cmp = require "cmp"
local types = require "cmp.types"
--  require("cmp_nvim_lsp").setup {}
local compare = require("cmp.config.compare")
local fn = vim.fn

local function check_back_space()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  -- local col = fn.col(".") - 1
  -- return col == 0 or fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.exact,
      compare.offset,
      compare.score,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order
    }
  },
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.InsertEnter,
      types.cmp.TriggerEvent.TextChanged
    },
    completeopt = "menuone,noselect"
  },
  documentation = {
    border = "rounded",
    winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder"
  },
  sources = {
    {name = "nvim_lsp"},
    {name = "vsnip"},
    {name = "path"},
    {
      name = "buffer",
      opts = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    }
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ["<Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
      elseif vim.fn["vsnip#available"]() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
      elseif check_back_space() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
      elseif vim.fn["vsnip#available"]() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
      else
        fallback()
      end
    end
  },
  formatting = {
    format = function(entry, vim_item)
      local menu = {
        nvim_lsp = " ",
        vsnip = " ",
        path = " ",
        buffer = " "
      }
      local kind = {
        Text = "ﮜ [text] ",
        Method = " [method] ",
        Function = " [function] ",
        Constructor = " [constructor] ",
        Field = "ﰠ [field] ",
        Variable = " [variable] ",
        Class = " [class] ",
        Interface = " [interface] ",
        Module = " [module] ",
        Property = " [property] ",
        Unit = " [unit] ",
        Value = " [value] ",
        Enum = " [enum] ",
        Keyword = " [key] ",
        Snippet = " [snippet] ",
        Color = " [color] ",
        File = " [file] ",
        Reference = " [reference] ",
        Folder = " [folder] ",
        EnumMember = " [enum member] ",
        Constant = " [constant] ",
        Struct = " [struct] ",
        Event = "⌘ [event] ",
        Operator = " [operator] ",
        TypeParameter = "⌂ [type] "
      }

      vim_item.menu = menu[entry.source.name]
      vim_item.kind = kind[vim_item.kind]
      return vim_item
    end
  }
}
vim.cmd(
  [[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]]
)
