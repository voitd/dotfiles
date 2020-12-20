local g = vim.g
local cmd = vim.api.nvim_command

vim.cmd("filetype plugin indent on")
vim.cmd('let test#strategy = "floaterm"')
vim.cmd('let test#elixir#exunit#executable = "MIX_ENV=test mix test"')
vim.cmd('let test#javascript#jest#options = "--color=always"')
-- cmd('')
-- cmd('let g:vsnip_filetypes.typescriptreact = ['typescript']')
-- cmd('let g:vsnip_filetypes.javascriptreact = ['javascript']')

cmd('let g:vsnip_filetypes = {}')

vim.g.vsnip_filetypes = {}
g.vsnip_filetypes.javascriptreact = {"javascript"}
g.vsnip_filetypes.typescriptreact = {"typescript"}

g.lengthmatters_highlight_one_column = 1

g.gitblame_enabled = 0
g.gitblame_message_template = "     <author> • <summary> • <date>"

-- g.ultest_virtual_text = 1
-- g.ultest_icons = 1

-- g.rooter_patterns = {'.git/', 'package.json', 'composer.json'}
-- g.rooter_silent_chdir  = 1
-- g.rooter_change_directory_for_non_project_files= 'current'


local apply_options = function(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd("set " .. k)
    elseif v == false then
      cmd(string.format("set no%s", k))
    else
      cmd(string.format("set %s=%s", k, v))
    end
  end
end

local options = {
  -- Boolean value
  compatible = false,
  ttyfast = true,
  showcmd = false,
  wildmenu = true,
  cindent = true,
  formatoptions = "qrn1co",
  undofile = true,
  undodir = "/tmp/",
  autoindent = true,                          -- enable autoindent
  backup = false,                             -- disable backup
  cursorline = true,                          -- enable cursorline
  expandtab = true,                           -- use spaces instead of tabs
  autowrite = true,                           -- autowrite buffer when it's not focused
  hidden = true,                              -- keep hidden buffers
  hlsearch = false,                           -- don't highlight matching search
  ignorecase = true,                          -- case insensitive on search
  lazyredraw = true,                          -- lazyredraw to make macro faster
  list = false,                               -- display listchars
  number = true,                              -- enable number
  relativenumber = true,                      -- enable relativenumber
  showmode = false,                           -- don't show mode
  smartcase = true,                           -- improve searching using '/'
  smartindent = true,                         -- smarter indentation
  smarttab = true,                            -- make tab behaviour smarter
  splitbelow = true,                          -- split below instead of above
  splitright = true,                          -- split right instead of left
  startofline = false,                        -- don't go to the start of the line when moving to another file
  swapfile = false,                           -- disable swapfile
  termguicolors = true,                       -- truecolours for better experience
  wrap = false,                               -- dont wrap lines
  writebackup = false,                        -- disable backup

  -- String value
  completeopt = "menuone,noinsert,noselect",  -- better completion
  encoding = "UTF-8",                         -- set encoding
  fillchars = "vert:│,eob:\\ ",               -- make vertical split sign better
  foldmethod = "marker",                      -- foldmethod using marker
  inccommand = "split",                       -- incrementally show result of command
  listchars = "eol:↲,tab:»\\ ",               -- set listchars
  mouse = "nv",                               -- enable mouse support
  shortmess = "filnxtToOFIc",                 -- disable some stuff on shortmess
  signcolumn = "yes",                         -- enable sign column all the time, 4 column
  clipboard = "unnamedplus",                  -- use system clipboard
  shell = "fish",                             -- fish as shell
  syntax = "on",                              -- syntax enable

  -- Number value
  -- colorcolumn = 120,                       -- 120 chars color column
  laststatus = 2,                             -- always enable statusline
  pumheight = 20,                             -- limit completion items
  re = 0,                                     -- set regexp engine to auto
  shiftwidth = 2,                             -- set indentation width
  scrolloff = 8,                              -- make scrolling better
  sidescroll = 2,                             -- make scrolling better
  sidescrolloff = 15,                         -- make scrolling better
  synmaxcol = 300,                            -- set limit for syntax highlighting in a single line
  tabstop = 2,                                -- tabsize
  timeoutlen = 400,                           -- faster timeout wait time
  updatetime = 100,                           -- set faster update time
  ttimeoutlen = 0,
  softtabstop = 2,
  textwidth = 140,
  numberwidth = 1,
}

apply_options(options)
