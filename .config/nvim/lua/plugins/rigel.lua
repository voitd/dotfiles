local cmd, g = vim.cmd, vim.g

local hiLinks = require "settings.utils".hiLinks
local apply_globals = require "settings.utils".apply_globals
local highlights = require "settings.utils".highlights

cmd "syntax sync fromstart"
cmd "syntax enable"
cmd "set termguicolors"

-- rigel
cmd "colorscheme rigel"
apply_globals(
  {
    rigel_italic = 1,
    rigel_bold = 1
  }
)
hiLinks(
  {
    -- diagnostic
    LspDiagnosticsVirtualTextError = "Boolean",
    LspDiagnosticsVirtualTextWarning = "WarningMsg",
    LspDiagnosticsVirtualTextInformation = "Statement",
    LspDiagnosticsVirtualTextHint = "VestSplit",
    -- html
    htmlTagN = "htmlTagName",
    htmlEndTag = "htmlTag",
    -- startify
    StartifyHeader = "WarningMsg",
    StartifyNumber = "Boolean",
    StartifyPath = "LineNr",
    StartifySlash = "StartifyPath",
    StartifyBracket = "StartifyPath",
    StartifyFile = "Include",
    -- git
    GitGutterAdd = "String",
    GitGutterChange = "Constant",
    GitGutterDelete = "Boolean"
  }
)

highlights(
  {
    htmlArg = {fg = "#f08e48", gui = "italic"},
    -- htmlArg = {fg = "#f15c67", gui = "italic"},
    htmlString = {fg = "#9cf087"},
    htmlTagName = {fg = "#7eb2dd", gui = "bold"},
    htmlTag = {fg = "#1c8db2", gui = "bold"},
    MatchParen = {bg = "#002635", fg = "#fb94ff"}
  }
)

-- let g:terminal_color_foreground = "#e6e6dc"
-- let g:terminal_color_background = "#002635"
-- let g:terminal_color_0 = "#00384d"
-- let g:terminal_color_1 = "#c43060"
-- let g:terminal_color_2 = "#7fc06e"
-- let g:terminal_color_3 = "#f08e48"
-- let g:terminal_color_4 = "#1c8db2"
-- let g:terminal_color_5 = "#c694ff"
-- let g:terminal_color_6 = "#00cccc"
-- let g:terminal_color_7 = "#77929e"
-- let g:terminal_color_8 = "#517f8d"
-- let g:terminal_color_9 = "#ff5a67"
-- let g:terminal_color_10 = "#9cf087"
-- let g:terminal_color_11 = "#ffcc1b"
-- let g:terminal_color_12 = "#7eb2dd"
-- let g:terminal_color_13 = "#fb94ff"
-- let g:terminal_color_14 = "#00ffff"
-- let g:terminal_color_15 = "#b7cff9"
