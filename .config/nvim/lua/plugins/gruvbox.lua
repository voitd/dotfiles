local cmd = vim.cmd

-- local hiLinks = require "settings.utils".hiLinks
local apply_globals = require "settings.utils".apply_globals
-- local highlights = require "settings.utils".highlights

--  cmd "syntax sync fromstart"
--  cmd "syntax enable"
--  cmd "set termguicolors"

-- inactive statuslines as thin splitlines

cmd "au VimEnter * hi! StatusLineNC gui=underline guibg=NONE guifg='#101010'"
-- gruvbox
--  cmd "colorscheme gruvbox-material"
-- cmd "colorscheme gruvbox-flat"
cmd "colorscheme gruvbox"

apply_globals(
  {
    gruvbox_bold = 1,
    gruvbox_italic = 1,
    gruvbox_contrast = "hard"
  }
)

-- g:gruvbox_material_palette = {
--           \ 'bg0':              ['#101010',   '234'],
--           \ 'bg1':              ['#262727',   '235'],
--           \ 'bg2':              ['#282828',   '235'],
--           \ 'bg3':              ['#3c3836',   '237'],
--           \ 'bg4':              ['#3c3836',   '237'],
--           \ 'bg5':              ['#504945',   '239'],
