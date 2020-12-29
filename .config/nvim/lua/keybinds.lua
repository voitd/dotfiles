local map = require "utils".map
local U = require "utils"
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn

-- Mapleader
-- Map <leader> to space
map("n", "<Space>", "<Nop>")
g.mapleader = " "

-- map("i", "<Tab>", [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], {expr = true})

-- Better indenting
map("v", "<", "<gv", {})
map("n", "<", "<<", {})
map("n", ">", ">>", {})
map("v", ">", ">gv", {})

-- clear all the highlighted text from the previous search
map("n", "<Esc><Esc>", ":noh<CR>", {silent = true})

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

map("n", "<A-a>", ":ColorrangeIncrement<CR>")
map("n", "<A-x>", ":ColorrangeDecrement<CR>")

map("n", "<leader>e", "<cmd>CocCommand explorer<CR>", {})
map("n", "<leader><leader>", "<cmd>CocCommand explorer --position floating<CR>", {})

map("n", "<Leader>jv", ":call CocAction('jumpDefinition','vsplit')<CR>", {})
map("n", "<Leader>jh", ":call CocAction('jumpDefinition','split')<CR>", {})

-- map('v', '<leader>s', ':s//gcI<Left><Left><Left><Left>')
-- map('n', '<leader>s', ':%s//gcI<Left><Left><Left><Left>')
-- map("n", "<leader>sd", ":DocumentSymbols:<CR>", {})
-- map("n", "<leader>ca", ":CodeActions<CR>", {})
-- map("n", "<leader>cd", ":Diagnostics<CR>", {})
map("n", "<leader>sd", ":DocumentSymbols<CR>", {})
map("n", "<leader>ca", ":CodeActions<CR>", {})
map("n", "<leader>c.", ":CocConfig<CR>", {})
map("n", "<leader>cd", ":CocList diagnostic<CR>", {})

map("n", "<leader>sb", ":BLines<CR>", {})
map("n", "<leader>bs", ":BLines<CR>", {})
map("n", "<leader>st",     ":Rg!<CR>", {})
map("n", "<leader>.",  ":e $MYVIMRC<CR>", {})
map("n", "<leader>,",  ":Startify<CR>", {})
map("n", "<leader>tg", ":GitBlameToggle<CR>", {})
map("n", "<leader>tc", ":ColorizerToggle<CR>", {})
map("n", "<leader>bd", ":bp<BAR>bd#<CR><CR>", {})
map("n", "<leader>bo", ":w<BAR>%bd<BAR>e#<BAR>bd#<CR>", {})

map("n", "<BS>", "<C-^>", {})
map("n", "\\", "<cmd>BufferPick<CR>", {})

map("n", "[t", ":tabprevious<CR>", {})
map("n", "]t", ":tabnext<CR>", {})
map("n", "[b", ":bprevious<CR>", {})
map("n", "]b", ":bnext<CR>", {})
map("n", "[w", "<C-w>w", {})
map("n", "]w", "<C-w>W", {})

map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

cmd [[xnoremap <expr> p 'pgv"' . v:register . 'y`]']]

map("n", "<F3>", [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '>'<cr>]], {})

map("n", "<leader>tf", "<cmd>TestFile<CR>", {})
map("n", "<leader>tv", "<cmd>TestVisit<CR>", {})
map("n", "<leader>jr", "<cmd>Jest<CR>", {})
map("n", "<leader>jj", "<cmd>JestCurrent<CR>", {})

map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", {})

map("n", "<F12>", "<cmd>FloatermToggle<CR>", {})
map("t", "<Esc><Esc>", "<cmd>FloatermToggle<CR>", {})
map("n", "<F10>", "<cmd>FloatermClose<CR>", {})
map("n", "<C-j>", "<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>", {})
map("n", "<C-j>v", "<cmd>FloatermNew --width=0.4 --wintype=normal --position=right<CR>", {})

-- map("x", 'gcc',  ':Commentary<CR>', { noremap = false })
-- map("n", 'gcc', ':Commentary<CR>', { noremap = false })
-- map('n', '<Leader>c', 'gcc', { noremap = false })
-- map('x', '<Leader>c', 'gc', { noremap = false })

map("v", ".", ":normal .<CR>")
map("x", "Q", ":normal @@<CR>")
map("n", "Q", ":normal @@<CR>")

cmd "set wildcharm=<C-s>"
map("n", "<Tab><Tab>", ":buffer <C-s><S-Tab>", {})

map("n", "<leader>r", ":luafile %<CR>", {})
map("n", "<leader>x",    ':lua require"plenary.reload".reload_modules("init")', {})

-- map("n", "<leader>x", ":luafile $MYVIMRC<CR>", {})
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
-- map("c", "Q", "<Nop>", {noremap = false})
-- map("c", "q", "<Nop>", {noremap = false})


-- Jump to definition in vertical split
-- map('n', '<Leader>]', '<C-W>v<C-]>')

-- Taken from https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20
for _, char in ipairs({"_", ".", ":", ",", ";", "<bar>", "/", "<bslash>", "*", "+", "-", "#"}) do
  map("x", "i" .. char, ":<C-u>normal! T" .. char .. "vt" .. char .. "<CR>")
  map("o", "i" .. char, ":normal vi" .. char .. "<CR>")
  map("x", "a" .. char, ":<C-u>normal! F" .. char .. "vf" .. char .. "<CR>")
  map("o", "a" .. char, ":normal va" .. char .. "<CR>")
end

map("n", "<Leader>ap", "<Plug>(JsConsoleLog)", {noremap = false})
cmd [[nnoremap <silent><Plug>(JsConsoleLog) :lua return require'utils'.console_log()<CR>]]
-- map("n", '<Leader>sw', '<Plug>(RgWord)', { noremap = false })
-- cmd [[nnoremap <silent><Plug>(RgWord) :lua require'utils'.rg_word()<CR>]]


-- Git
map("n", "<Leader>gs", ":Gstatus<CR>", {})
map("n", "<Leader>gb", ":Gbranches<CR>", {})
