local U = require "utils"
local g = vim.g


-- vim.cmd("colorscheme rigel")
-- g.rigel_italic = 1
-- g.rigel_bold = 1

-- vim.cmd("colorscheme gruvbox")
-- g.gruvbox_background = "hard"
-- g.gruvbox_sign_column_background = "none"


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

-- These colors are used in fzf markers
-- And should be called after colorscheme command
-- U.highlights({
--     MyWhite = { fg = "#ffffff" },
--     MyBlack = { fg = "#1c1c1c" }
-- })
