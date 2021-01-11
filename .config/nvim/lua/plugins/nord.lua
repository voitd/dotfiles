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
-- g.nord_underline = 1

local my_nord = {
  jsxTagName = "jsxComponentName",
  jsObjectKey = "StorageClass",
  jsVariableDef = "Number",
  jsStorageClass = "rustAttribute",
  jsFuncBlock = "rustPanic",
  jsThis = "typescriptDecorator",
  jsExport = "typescriptBOMWindowMethod",
  jsNull = "typescriptDecorator",
  jsBooleanTrue = "typescriptDecorator",
  jsBooleanFalse = "typescriptDecorator",
  jsForAwait = "typescriptDecorator",
  jsSuper = "typescriptDecorator",
  jsObjectValue = "Function",
  jsTernaryIfOperator = "SpecialChar",
  BufferInactiveMod = "typescriptDecorator",
  BufferCurrentMod = "typescriptDecorator",
  BufferVisibleMod = "typescriptDecorator",
  BufferCurrent = "typescriptBOMWindowMethod",
  BufferVisible = "rustAttribute",
  BufferInactive = "rustAttribute",
  BufferTabpages = "Normal",
  BufferTabpageFill = "Normal",
  StartifyHeader = "Number",
  StartifyFile = "Directory",
  StartifyPath = "rustAttribute",
  StartifySlash = "StartifyPath",
  StartifyBracket = "StartifyPath",
  StartifyNumber = "Number",
  elixirAtom = "Number",
  elixirFunctionDeclaration = "rustAttribute",
  elixirDefine = "typescriptBOMWindowMethod",
  elixirModuleDefine = "typescriptBOMWindowMethod",
  elixirBlockDefinition = "typescriptBOMWindowMethod",
  elixirAlias = "SpecialChar",
  elixirModuleDeclaration = "typescriptDecorator",
  elixirInclude = "rustEnum",
  elixirId = "Type",
  cssIndetifier = "SpecialChar",
}
hiLinks(my_nord)

local my_nord_colors = {
  jsGlobalObjects = {fg = "#eda48d", gui="Italic"}
}
highlights(my_nord_colors)

cmd 'autocmd ColorScheme * hi jsGlobalObjects guifg=#eda48d'

-- let s:nord1_gui = "#3B4252"
-- let s:nord0_gui = "#2E3440"
-- let s:nord2_gui = "#434C5E"
-- let s:nord3_gui = "#4C566A"
-- let s:nord3_gui_bright = "#616E88"
-- let s:nord4_gui = "#D8DEE9"
-- let s:nord5_gui = "#E5E9F0"
-- let s:nord6_gui = "#ECEFF4"
-- let s:nord7_gui = "#8FBCBB"
-- let s:nord8_gui = "#88C0D0" Function
-- let s:nord9_gui = "#81A1C1"
-- let s:nord10_gui = "#5E81AC"
-- let s:nord11_gui = "#BF616A"
-- let s:nord12_gui = "#D08770"
-- let s:nord13_gui = "#EBCB8B"
-- let s:nord14_gui = "#A3BE8C"
-- let s:nord15_gui = "#B48EAD"

