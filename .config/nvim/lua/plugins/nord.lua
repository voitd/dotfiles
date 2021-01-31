local cmd, g = vim.cmd, vim.g
local hiLinks = require "settings.utils".hiLinks
local highlights = require "settings.utils".highlights

-- vim.cmd("colorscheme paper")
-- vim.cmd("colorscheme github-light")
-- vim.cmd("set background=light")

cmd "colorscheme nord"
cmd "set termguicolors"
g.nord_uniform_status_lines = 0
-- g.nord_uniform_diff_background = 1
g.nord_bold = 1
g.nord_italic = 1
g.nord_italic_comments = 1
g.nord_underline = 1

local colors = {
  nord1 = "#3B4252",
  nord0 = "#2E3440",
  nord2 = "#434C5E",
  nord3 = "#4C566A",
  nord3_bright = "#616E88",
  nord4 = "#D8DEE9",
  nord5 = "#E5E9F0",
  nord6 = "#ECEFF4",
  nord7 = "#8FBCBB",
  nord8 = "#88C0D0",
  nord9 = "#81A1C1",
  nord10 = "#5E81AC",
  nord11 = "#BF616A",
  nord12 = "#D08770",
  nord13 = "#EBCB8B",
  nord14 = "#A3BE8C",
  nord15 = "#B48EAD",
}

hiLinks(
  {
    jsxTagName = "jsxComponentName",
    jsObjectKey = "StorageClass",
    jsVariableDef = "Number",
    jsStorageClass = "rustAttribute",
    jsFuncBlock = "rustPanic",
    jsExport = "typescriptBOMWindowMethod",
    jsImport = "typescriptBOMWindowMethod",
    jsNull = "typescriptDecorator",
    jsBooleanTrue = "typescriptDecorator",
    jsBooleanFalse = "typescriptDecorator",
    jsObjectValue = "Function",
    BufferInactiveMod = "typescriptDecorator",
    BufferCurrentMod = "typescriptDecorator",
    BufferVisibleMod = "typescriptDecorator",
    BufferCurrent = "typescriptBOMWindowMethod",
    BufferVisible = "rustAttribute",
    BufferInactive = "rustAttribute",
    BufferTabpages = "Normal",
    BufferTabpageFill = "Normal",
    elixirAtom = "Number",
    elixirFunctionDeclaration = "rustAttribute",
    elixirDefine = "typescriptBOMWindowMethod",
    elixirModuleDefine = "typescriptBOMWindowMethod",
    elixirBlockDefinition = "typescriptBOMWindowMethod",
    elixirAlias = "SpecialChar",
    elixirModuleDeclaration = "typescriptDecorator",
    elixirInclude = "rustEnum",
    elixirId = "Type",
    LspDiagnosticsVirtualTextError = "LspDiagnosticsError",
    LspDiagnosticsVirtualTextWarning = "LspDiagnosticsWarning",
    LspDiagnosticsVirtualTextInformation = "LspDiagnosticsInformation",
    LspDiagnosticsVirtualTextHint = "LspDiagnosticsHint"
  }
)

highlights(
  {
    cssTagName= {fg = colors.nord13, gui = "italic"},
    cssClassName= {fg = "#eda48d", gui = "italic"},
    jsGlobalObjects = {fg = "#eda48d", gui = "italic"},
    cssIndetifier = {fg = "#eda48d", gui = "italic"},
    jsReturn = {fg = colors.nord11, gui = "bold"},
    jsSuper = {fg = colors.nord11},
    jsThis = {fg = colors.nord13},
    jsForAwait = {fg = colors.nord11},
    jsTernaryIfOperator = {fg = colors.nord11},
    StartifyHeader = {fg = colors.nord11, gui = "bold"},
    StartifyNumber = {fg = colors.nord15},
    StartifyPath = {fg = colors.nord10},
    StartifySlash = {fg = colors.nord10},
    StartifyBracket = {fg = colors.nord10},
    StartifyFile = {fg = colors.nord8},
    TelescopeBorder = {fg = colors.nord15},
    TelescopePromptBorder = {fg = colors.nord15},
    TelescopeResultsBorder = {fg = colors.nord15},
    TelescopePreviewBorder = {fg = colors.nord15},
    TelescopeSelection = {fg = colors.nord12},
    TelescopeMatching = {fg = colors.nord11},
    TelescopeNormal = {fg = colors.nord9},
    FloatermBorder = {fg = colors.nord15},
    LspDiagnosticsUnderlineError = { gui='underline' },
    LspDiagnosticsUnderlineWarning = { gui='underline' },
    LspDiagnosticsUnderlineInformation = { gui='underline' },
    LspDiagnosticsUnderlineHint = { gui='underline' },
  }
)

-- cmd 'autocmd ColorScheme * hi jsGlobalObjects guifg=#eda48d'

