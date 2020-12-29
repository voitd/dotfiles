local U = require "utils"
local map = require "utils".map
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

g.coc_global_extensions = {
  "coc-json",
  "coc-snippets",
  "coc-tsserver",
  "coc-eslint",
  "coc-snippets",
  "coc-explorer",
  "coc-emmet",
  "coc-style-helper",
  "coc-prettier"
  -- 'coc-inline-jest',
}

function _G.check_back_space()
  local col = fn.col(".") - 1
  if col == 0 or fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

map("i", "<TAB>", 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {expr = true})
map("i", "<S-TAB>", 'pumvisible() ? "<C-P>" : "<C-H>"', {expr = true})

function show_docs()
  local cw = fn.expand("<cword>")
  if fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
    cmd("h " .. cw)
  elseif api.nvim_eval("coc#rpc#ready()") then
    fn.CocActionAsync("doHover")
  else
    cmd("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

map("n", "gh", "<CMD>lua show_docs()<CR>")

map("n", "<leader>cx", ":CocRestart<CR>", {silent = true})

map("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', {expr = true})

-- Use `[e` and `]e` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[e", "<Plug>(coc-diagnostic-prev)", {noremap = false})
map("n", "]e", "<Plug>(coc-diagnostic-next)", {noremap = false})

-- Multiple Cursors support
map("n", "gb", "<Plug>(coc-cursors-word)", {noremap = false})

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)", {noremap = false})
map("n", "gy", "<Plug>(coc-type-definition)", {noremap = false})
map("n", "gi", "<Plug>(coc-implementation)", {noremap = false})
map("n", "gr", "<Plug>(coc-references)", {noremap = false})

-- Symbol renaming.
map("n", "<F2>", "<Plug>(coc-rename)", {noremap = false})

-- Formatting selected code.
map("x", "<leader>fs", "<Plug>(coc-format-selected)", {noremap = false})
map("n", "<leader>fs", "<Plug>(coc-format-selected)", {noremap = false})

-- Applying codeAction to the selected region.
-- Example: `<leader>caap` for current paragraph
map("x", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})
map("n", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})

-- Remap keys for applying codeAction to the current buffer.
map("n", "<leader>ca", "<Plug>(coc-codeaction)", {noremap = false})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map("x", "if", "<Plug>(coc-funcobj-i)", {noremap = false})
map("o", "if", "<Plug>(coc-funcobj-i)", {noremap = false})
map("x", "af", "<Plug>(coc-funcobj-a)", {noremap = false})
map("o", "af", "<Plug>(coc-funcobj-a)", {noremap = false})

map("x", "ic", "<Plug>(coc-classobj-i)", {noremap = false})
map("o", "ic", "<Plug>(coc-classobj-i)", {noremap = false})
map("x", "ac", "<Plug>(coc-classobj-a)", {noremap = false})
map("o", "ac", "<Plug>(coc-classobj-a)", {noremap = false})

-- Remap <C-F> and <C-B> for scroll float windows/popups.
map("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {expr = true})
map("i", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<Right>"', {expr = true})
map("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {expr = true})
map("i", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<Left>"', {expr = true})

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
map("n", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})
map("x", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})

-- Mappings for CoCList
-- Show all diagnostics.
map("n", "<leader>cd", ":CocList diagnostics<CR>")
-- Show commands.
map("n", "<leader>cc", ":CocList commands<CR>")
-- Find symbol of current document.
map("n", "<leader>co", ":CocList outline<CR>")
-- Search workspace symbols.
map("n", "<leader>cs", ":CocList -I symbols<CR>")

api.nvim_exec(
  [[
    augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    command! -nargs=0 Jest :call CocAction('runCommand', 'jest.projectTest')
    
    command! -nargs=0 JestCurrent :call CocAction('runCommand', 'jest.fileTest', ['%'])
    
    command! -nargs=0 JestNearest :call CocAction('runCommand', 'jest.singleTest')<CR>
    
    command! JestInit :call CocAction('runCommand', 'jest.init')
]],
  ""
)
