local map = require "settings.utils".map
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local exec = vim.api.nvim_exec

g.coc_global_extensions = {
  "coc-json",
  "coc-lua",
  "coc-snippets",
  "coc-snippets",
  "coc-explorer",
  "coc-emmet",
  "coc-style-helper",
  "coc-prettier",
  "coc-tsserver",
  "coc-react-refactor",
}

-- 'coc-inline-jest',
-- "coc-eslint",
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

map("i", "<CR>", 'pumvisible() ? coc#_select_confirm() : "<C-G>u<CR><C-R>=coc#on_enter()<CR>"', {expr = true})

function show_docs()
  local cw = fn.expand("<cword>")
  if fn.index({"vim", "help"}, vim.bo.filetype) >= 0 then
    cmd("h " .. cw)
  elseif vim.api.nvim_eval("coc#rpc#ready()") then
    fn.CocActionAsync("doHover")
  else
    cmd("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

map("n", "gh", "<CMD>lua show_docs()<CR>")

map("n", "<leader>cx", ":CocRestart<CR>", {silent = true})
map("n", "<Esc>", "coc#float#close_all()", {silent = true})

map("n", "<leader>e", "<cmd>CocCommand explorer<CR>", {})
map("n", "<leader><leader>", "<cmd>CocCommand explorer --position floating<CR>", {})

map("n", "<Leader>jv", ":call CocActionAsync('jumpDefinition','vsplit')<CR>", {})
map("n", "<Leader>jh", ":call CocActionAsync('jumpDefinition','split')<CR>", {})
map("n", "<Leader>jk", ":call CocActionAsync('jumpDefinition','silent !kitty @ launch --copy-env --cwd=current nvim')<CR>", {})

-- Use `[e` and `]e` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[e", "<Plug>(coc-diagnostic-prev)", {noremap = false})
map("n", "]e", "<Plug>(coc-diagnostic-next)", {noremap = false})

-- Multiple Cursors support
map("n", "gw", "<Plug>(coc-cursors-word)", {noremap = false})

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
-- map("v", "<leader>f", "<Plug>(coc-format-selected)", {noremap = false})

-- Applying codeAction to the selected region.
-- Example: `<leader>caap` for current paragraph
map("x", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})
map("n", "<leader>ac", "<Plug>(coc-codeaction-selected)", {noremap = false})

-- Remap keys for applying codeAction to the current buffer.
map("n", "<leader>ca", "<Plug>(coc-codeaction)", {noremap = false})

map("n", "<leader>cq", "<Plug>(coc-fix-current)", {noremap = false})

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
-- map("n", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})
-- map("x", "<C-S>", "<Plug>(coc-range-select)", {noremap = false})

-- Mappings for CoCList
-- Show all diagnostics.
map("n", "<leader>cd", ":CocFzfList diagnostics<CR>", {})
-- Show commands.
map("n", "<leader>cc", ":CocFzfList commands<CR>", {})
-- Show extensions.
map("n", "<leader>ce", ":CocFzfList extensions<CR>", {})
-- Find symbol of current document.
map("n", "<leader>co", ":CocFzfList outline<CR>", {})
-- Search workspace symbols.
map("n", "<leader>cs", ":CocFzfList -I symbols<CR>")
-- Open settings
map("n", "<leader>c.", ":CocConfig<CR>", {})

exec([[
    augroup mygroup
      autocmd!
      autocmd FileType javascript,javascriptreact,javascript.jsx,json setl formatexpr=CocActionAsync('formatSelected')
    augroup end

    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    command! -nargs=0 CocFormat :call CocActionAsync('format')
    
    command! -nargs=0 Jest :call CocActionAsync('runCommand', 'jest.projectTest')
    
    command! -nargs=0 JestCurrent :call CocActionAsync('runCommand', 'jest.fileTest', ['%'])
    
    command! -nargs=0 JestNearest :call CocActionAsync('runCommand', 'jest.singleTest')<CR>
    
    command! JestInit :call CocActionAsync('runCommand', 'jest.init')

]],
  ""
)

