local M = {}

function M.setup()
  local cmp = require "cmp"
  local WIDE_HEIGHT = 40

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  cmp.setup {
    mapping = {
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<Esc>"] = cmp.mapping(
      {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close()
      }
      ),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
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
      {"i", "s", "c"}
    ),
    ["<S-Tab>"] = cmp.mapping(
      function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end,
      {"i", "s", "c"}
    )
    },
    snippet = {
        expand = function(args)
          fn["vsnip#anonymous"](args.body)
        end
    ,
    sources = {
      { name = "nvim_lsp", max_item_count = 10 },
      { name = "vsnip", max_item_count = 10 },
      { name = "buffer", max_item_count = 5 },
      { name = "path" },
    },
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    experimental = { native_menu = false, ghost_text = false },
    documentation = {
        winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
        maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
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

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path", max_item_count = 5 },
    }, {
      { name = "cmdline", max_item_count = 8 },
    }),
  })

  -- lsp_document_symbols
  cmp.setup.cmdline("/", {
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol", max_item_count = 8, keyword_length = 3 },
    }, {
      { name = "buffer", max_item_count = 5, keyword_length = 5 },
    }),
  })

end

return M
