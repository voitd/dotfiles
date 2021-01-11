local apply_options = require("settings.utils").apply_options

apply_options(
  {
    -- Boolean value
    compatible = false,
    ttyfast = true,
    wildmenu = true,
    cindent = true,
    undofile = true,
    showcmd = false, -- disable mode display since lightline display
    showmatch = true, -- highlight matching [{()}]
    autoindent = true, -- enable autoindent
    backup = false, -- disable backup
    cursorline = true, -- enable cursorline
    expandtab = true, -- use spaces instead of tabs
    autowrite = true, -- autowrite buffer when it's not focused
    hidden = true, -- keep hidden buffers
    hlsearch = true, -- highlight matching search
    ignorecase = true, -- case insensitive on search
    lazyredraw = true, -- lazyredraw to make macro faster
    list = false, -- display listchars
    number = true, -- enable number
    relativenumber = true, -- enable relativenumber
    showmode = false, -- don't show mode
    smartcase = true, -- improve searching using '/'
    smartindent = true, -- smarter indentation
    smarttab = true, -- make tab behaviour smarter
    splitbelow = true, -- split below instead of above
    splitright = true, -- split right instead of left
    startofline = false, -- don't go to the start of the line when moving to another file
    swapfile = false, -- disable swapfile
    termguicolors = true, -- truecolours for better experience
    wrap = false, -- dont wrap lines
    writebackup = false, -- disable backup
    wildignorecase = true,
    -- String value
    cpoptions = "x", -- stay at seach item when <esc>
    matchpairs = "(:),{:},[:],<:>", -- highlight match pairs
    completeopt = "menuone,noinsert,noselect", -- better completion
    formatoptions = "qrn1co", -- improve editor formatting
    encoding = "UTF-8", -- set encoding
    fillchars = "vert:│,eob:\\ ", -- make vertical split sign better
    foldmethod = "marker", -- foldmethod using marker
    inccommand = "split", -- incrementally show result of command
    listchars = "eol:↲,tab:∘\\ ", -- set listchars
    mouse = "nv", -- enable mouse support
    shortmess = "filnxtToOFIWc", -- disable some stuff on shortmess
    signcolumn = "yes", -- enable sign column all the time, 4 column
    clipboard = "unnamedplus", -- use system clipboard
    shell = "fish", -- fish as shell
    syntax = "on", -- syntax enable
    undodir = "/tmp/",
    wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    -- wildcharm='<C-s>',

    -- Number value
    -- colorcolumn = 120,                       -- 120 chars color column
    laststatus = 2, -- always enable statusline
    pumheight = 20, -- limit completion items
    re = 0, -- set regexp engine to auto
    shiftwidth = 2, -- set indentation width
    scrolloff = 8, -- make scrolling better
    sidescroll = 2, -- make scrolling better
    sidescrolloff = 15, -- make scrolling better
    synmaxcol = 300, -- set limit for syntax highlighting in a single line
    tabstop = 2, -- tabsize
    timeoutlen = 400, -- faster timeout wait time
    updatetime = 100, -- set faster update time
    ttimeoutlen = 0,
    softtabstop = 2,
    textwidth = 140,
    numberwidth = 1
  }
)
