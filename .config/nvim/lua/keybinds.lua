local map = require "utils".map
local cmd = vim.cmd

-- Mapleader
-- Map <leader> to space
map("n", "<Space>", "<Nop>")
vim.g.mapleader = " "

map("i", "<Tab>", [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], {expr = true})

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
-- map("n", "<leader>e", ":LuaTreeToggle<CR>", {})

-- LSP
-- map("n", "gd",             ":Definitions<CR>", {})
-- map("n", "gU",             ":Declarations<CR>", {})
-- map("n", "gt",             ":TypeDefinitions<CR>", {})
-- map("n", "gi",             ":Implementations<CR>", {})
-- map("n", "gr",             ":References<CR>", {})
map("n", "<leader>sd",     ":DocumentSymbols:<CR>", {})
map("n", "<leader>ca",     ":CodeActions<CR>", {})
map("n", "<leader>cd",     ":Diagnostics<CR>", {})
map("n", "<leader>sb",     ":BLines<CR>", {})
map("n", "<leader>bs",     ":BLines<CR>", {})
map("n", "<leader>st",     ":Rg!<CR>", {})
map("n", "<leader>r",      ":luafile %<CR>", {})
map("n", "<leader>x",      ":luafile $MYVIMRC<CR>", {})
map("n", "<leader>.",      ":e $MYVIMRC<CR>", {})
map("n", "<leader>,",      ":Startify", {})
map("n", "<leader>tg",     ":GitBlameToggle<CR>", {})
map("n", "<leader>tc",     ":ColorizerToggle<CR>", {})
map("n", "<leader>bd",     ":bp<BAR>bd#<CR><CR>", {})
map("n", "<leader>bo",     ":w<BAR>%bd<BAR>e#<BAR>bd#<CR>", {})
map("n", "rn",             "<cmd>lua vim.lsp.buf.rename()<CR>", {})
map("n", "<CR>",           "<cmd>lua vim.lsp.buf.hover()<CR>", {})
map("n", "<leader>h",      "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
map(
    "n",
    "[e",
    "<cmd>lua vim.lsp.diagnostic.goto_prev({ popup_opts = { show_header = false } })<CR>",
    {}
  )
map(
    "n",
    "]e",
    "<cmd>lua vim.lsp.diagnostic.goto_next({ popup_opts = { show_header = false } })<CR>",
    {}
  )

map("n", "<BS>",           "<C-^>", {})
map("n", "[t",             ":tabprevious<CR>", {})
map("n", "]t",             ":tabnext<CR>", {})
map("n", "[b",             ":bprevious<CR>", {})
map("n", "]b",             ":bnext<CR>", {})
map("n", "[w",             "<C-w>w", {})
map("n", "]w",             "<C-w>W", {})

map("v", "J",            ":m '>+1<CR>gv=gv", {})
map("v", "K",            ":m '<-2<CR>gv=gv", {})

cmd [[xnoremap <expr> p 'pgv"' . v:register . 'y`]']]

map("n",'<leader>tf',   '<cmd>TestFile<CR>', {})
map("n",'<leader>tv',   '<cmd>TestVisit<CR>', {})
map("n",'<leader>tj',   '<cmd>Jest<CR>', {})
map("n",'<leader>tjf',  '<cmd>JestFile<CR>', {})
map("n",'<leader>u',    '<cmd>UndotreeToggle<CR>', {})
map("n",'\\',           '<cmd>BufferPick<CR>', {})
map("n",'<F12>',        '<cmd>FloatermToggle<CR>', {})
map("t",'<Esc><Esc>',   '<cmd>FloatermToggle<CR>', {})
map("n",'<F10>',        '<cmd>FloatermClose<CR>', {})
map("n",'<C-j>',        '<cmd>FloatermNew --height=0.3 --wintype=normal --position=bottom<CR>', {})

cmd('cabbrev qa qa!')
cmd('cabbrev q!! qwa!')
cmd('cabbrev q q!')
cmd('cabbrev Q q!')
cmd('cabbrev w w!')
cmd('cabbrev W w!')
cmd('cabbrev W! w!')
cmd('cabbrev wq wq!')
cmd('cabbrev wQ! wq!')
cmd('cabbrev Wq! wq!')
cmd('cabbrev Wa! wa!')
cmd('cabbrev wA! wa!')
-- cmd('')
