local U = require "utils"
local g = vim.g


-- vim.cmd("colorscheme rigel")
-- g.rigel_italic = 1
-- g.rigel_bold = 1

-- vim.cmd("colorscheme gruvbox")
-- g.gruvbox_background = "hard"
-- g.gruvbox_sign_column_background = "none"

-- vim.cmd("colorscheme gruvbox-material")
-- g.gruvbox_material_background = "hard"
-- g.gruvbox_material_palette = "material"
-- g.gruvbox_material_sign_column_background = "none"
-- g.gruvbox_material_better_performance = 1
-- g.gruvbox_material_enable_bold = 1
-- g.gruvbox_material_enable_italic = 1


-- vim.cmd("colorscheme paper")
-- vim.cmd("colorscheme github-light")
-- vim.cmd("set background=light")
vim.cmd("colorscheme nord")

g.nord_uniform_status_lines = 0
g.nord_uniform_diff_background = 1
g.nord_bold = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1


-- vim.cmd("colorscheme oceanicnext")
-- g.oceanic_for_polyglot = 1
-- g.oceanic_gutter_like_bg = 1
-- g.oceanic_bold = 1 
-- g.oceanic_italic_comments = 1

-- These colors are used in fzf markers
-- And should be called after colorscheme command
-- U.highlights({
--     MyWhite = { fg = "#ffffff" },
--     MyBlack = { fg = "#1c1c1c" }
-- })
-- U.hiLink('htmlTag' 'htmlTagName')
-- U.hiLink('htmlEndTag' 'htmlTagName')
