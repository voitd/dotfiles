local U = require "utils"
local g = vim.g

-- g.gruvbox_material_background = "hard"
-- g.gruvbox_material_sign_column_background = "none"
-- g.gruvbox_material_transparent_background = 1
-- g.gruvbox_material_better_performance = 1

vim.cmd("syntax on")
vim.cmd("set termguicolors")
-- vim.cmd("colorscheme rigel")
-- vim.cmd("colorscheme paper")
-- vim.cmd("colorscheme github-light")
-- vim.cmd("set background=light")
-- vim.cmd("colorscheme gruvbox-material")
vim.cmd("colorscheme nord")

g.nord_uniform_status_lines = 1
g.nord_uniform_diff_background = 1
g.nord_bold = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1

-- These colors are used in fzf markers
-- And should be called after colorscheme command
U.highlights({
    MyWhite = { fg = "#ffffff" },
    MyBlack = { fg = "#1c1c1c" }
})
