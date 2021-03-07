local map = require "settings.utils".map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

-- Map <leader> to space
map("n", "<Space>", "<Nop>")
-- Mapleader
g.mapleader = " "

-- remove annoying exmode
map("n", "Q", "<Nop>", {noremap = true})
map("n", "q:", "<Nop>", {noremap = true})

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

-- Zero should go to the first non-blank character not to the first column (which could be blank)
map("n", "0", "^")
-- when going to the end of the line in visual mode ignore whitespace characters
map("v", "$", "g_")
map("n", "$", "g_")

-- map("n", "yy", "^yg_")
-- map("n", "dd", "^dg_")

--[[ map("i", '"', '""<left>', {})
map("i", "'", "''<left>", {})
 ]]
map("n", "<leader><leader>", ":FloatermNew ranger<cr>", {})
map("t", "<leader><leader>", [[<C-\><C-n>:FloatermKill]], {})

-- Moves for colemak
map("n", "j", "h", {})
map("n", "k", "j", {})
map("n", "h", "k", {})

map("v", "j", "h", {})
map("v", "k", "j", {})
map("v", "h", "k", {})

map("x", "j", "h", {})
map("x", "k", "j", {})
map("x", "h", "k", {})

map("o", "j", "h", {})
map("o", "k", "j", {})
map("o", "h", "k", {})
-- Easier Moving between splits

map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-K>", "<C-W><C-K>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})

-- Sizing window
map("n", "<A-Right>", "<C-W>5<", {})
map("n", "<A-Left>", "<C-W>5>", {})
map("n", "<A-Up>", "<C-W>+5", {})
map("n", "<A-Down>", "<C-W>-5", {})

-- map('v', '<leader>s', ':s//gcI<Left><Left><Left><Left>')
-- map('n', '<leader>s', ':%s//gcI<Left><Left><Left><Left>')

map("n", "<leader>.", ":e $MYVIMRC<CR>", {})
map("n", "<leader>,", ":Startify<CR>", {})
map("n", "<leader>bd", ":bp<BAR>bd#<CR>", {})
map("n", "<leader>bo", ":w<BAR>%bd<BAR>e#<BAR>bd#<CR>", {})

map("n", "<BS>", "<C-^>", {})
map("n", "\\", "<cmd>BufferLinePick<CR>", {})
-- map("n", "\\", "<cmd>BufferPick<CR>", {})

map("n", "[t", ":tabprevious<CR>", {})
map("n", "]t", ":tabnext<CR>", {})
map("n", "[b", ":bprevious<CR>", {})
map("n", "]b", ":bnext<CR>", {})
map("n", "[w", "<C-w>w", {})
map("n", "]w", "<C-w>W", {})

map("v", "K", ":m '>+1<CR>gv=gv", {})
map("v", "H", ":m '<-2<CR>gv=gv", {})

cmd [[xnoremap <expr> p 'pgv"' . v:register . 'y`]']]

map("n", "<F3>", [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '>'<cr>]], {})

map("v", ".", ":normal .<CR>")
map("x", "@", ":normal @<CR>")
map("n", "@", ":normal @<CR>")

map("n", "U", "~<Left>")
map("n", "<C-s>", ":noa w<CR>")

cmd "set wildcharm=<C-s>"
map("n", "<Tab><Tab>", ":buffer <C-s><S-Tab>", {})

map("n", "<leader>r", ":luafile %<CR>", {})
map("n", "<leader>x", ":lua reload()<CR>", {})

-- Copy to system clipboard
map("v", "<C-c>", '"+y')
-- Paste from system clipboard with Ctrl + v
map("i", "<C-v>", '<Esc>"+p')
-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "A", ":<C-U>normal! ggVG<CR>")
-- Disable ex mode mapping

map("n", "gJ", ":SplitjoinJoin<CR>", {})
map("n", "gj", ":SplitjoinSplit<CR>", {})
map("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]], {})

-- Jump to definition in vertical split
map("n", "<Leader>js", "<C-W>v<C-]>")

-- Taken from https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20
for _, char in ipairs({"_", ".", ":", ",", ";", "<bar>", "/", "<bslash>", "*", "+", "-", "#"}) do
  map("x", "i" .. char, ":<C-u>normal! T" .. char .. "vt" .. char .. "<CR>")
  map("o", "i" .. char, ":normal vi" .. char .. "<CR>")
  map("x", "a" .. char, ":<C-u>normal! F" .. char .. "vf" .. char .. "<CR>")
  map("o", "a" .. char, ":normal va" .. char .. "<CR>")
end

map("n", "<Leader>ap", "<Plug>(JsConsoleLog)", {noremap = false})
cmd [[nnoremap <silent><Plug>(JsConsoleLog) :lua console_log()<CR>]]

-- Git
map("n", "<Leader>gg", ":Gstatus<CR>", {})
map("n", "<Leader>gb", ":GBranches<CR>", {})
map("n", "<Leader>go", ":GBrowse<CR>", {})

-- vim-import-js
map("n", "<Leader>if", ":ImportJSFix<CR>", {})
map("n", "<Leader>ii", ":ImportJSWord<CR>", {})
map("n", "<Leader>iw", ":ImportJSWord<CR>", {})

-- Searches
-- when using * # ignore smart case
_G["*"] = function()
  vim.o.ignorecase = false
  vim.o.smartcase = false
  cmd("/" .. fn.expand("<cword>"))
  vim.o.ignorecase = true
  vim.o.smartcase = true
end
_G["#"] = function()
  vim.o.ignorecase = false
  vim.o.smartcase = false
  cmd("?" .. fn.expand("<cword>"))
  vim.o.ignorecase = true
  vim.o.smartcase = true
end
-- case-sensative search for * and #
vim.cmd "au cursorhold * set nohlsearch"
map("n", "*", ":lua _G['*']()<cr>")
map("n", "#", ":lua _G['#']()<cr>")
map("n", "n", ":set hlsearch <cr>n")
map("n", "N", ":set hlsearch <cr>N")
map("n", "/", ":set hlsearch <cr>/")
map("n", "?", ":set hlsearch <cr>?")

-- map("n", "<leader>st", ":Rg!<CR>", {})
-- map("n", "<leader>sw", ":Rg" .. fn.expand("<cword>" .. ""), {})
--[[ map("n", "<leader>sb", ":BLines<CR>", {})
map("n", "<leader>bs", ":BLines<CR>", {}) ]]
-- map("n", "<leader>ss", [[:%s/\<<C-r>=expand("<cword>")<CR>\>/]])
-- map("n", "<leader>sr", [[:s/\<<C-r>=expand("<cword>")<CR>\>/]])
-- map("v", "<leader>ss", [["zy:%s/<C-r><C-o>"/]])

-- Test
map("n", "<leader>tf", "<cmd>TestFile<CR>", {})
map("n", "<leader>tv", "<cmd>TestVisit<CR>", {})
map("n", "<leader>jr", "<cmd>Jest<CR>", {})
map("n", "<leader>jj", "<cmd>JestCurrent<CR>", {})
map("n", "<leader>ut", "<Plug>(ultest-run-file)", {noremap = false})

-- Terminal
map("n", "<leader>tt", "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<leader>tv", "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- Togglers
map("n", "<leader>tg", ":GitBlameToggle<CR>", {})
map("n", "<leader>tc", ":HexokinaseToggle<CR>", {})
map("n", "<leader>u", ":UndotreeToggle<CR>", {})
map("n", "<leader>tr", ":Codi<CR>", {})
map("n", "<leader>tR", ":Codi!<CR>", {})
map("n", "<leader>tm", ":MatchTagToggleBoth<CR>", {})
map("n", "<leader>tM", ":MatchTagToggle<CR>", {})

--open a new file in the same directory
map("n", "<Leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})
map("n", "<Leader>of", ":lua open_file_or_create_new()", {silent = false})
-- Kitty
map("n", "<leader>kv", ":silent !kitty @ launch --copy-env --cwd=current nvim % <CR>", {})

map("n", "<leader>cc", ":normal gcc<CR>", {})

map("n", "za", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]], {})
map("n", "zO", [[zCzO]], {})

map("n", "%", "<Plug>(matchup-%)", {})
map("x", "%", "<Plug>(matchup-%)", {})
map("o", "%", "<Plug>(matchup-%)", {})
