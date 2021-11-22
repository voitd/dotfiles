local windline = require("windline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")
local hl_list = {
  Black = {"white", "black"},
  White = {"black", "white"},
  Inactive = {"blue", "bg_dark"},
  Active = {"blue", "NormalBg"}
}
local basic = {}

local breakpoint_width = 90
basic.divider = {b_components.divider, ""}
basic.bg = {" ", "NormalBg"}

local colors_mode = {
  Insert = {"red", "NormalBg"},
  Normal = {"green", "NormalBg"},
  Visual = {"cyan", "NormalBg"},
  Replace = {"blue_light", "NormalBg"},
  Command = {"magenta", "NormalBg"}
}

basic.vi_mode = {
  name = "vi_mode",
  hl_colors = colors_mode,
  text = function()
    return {{"   ", state.mode[2]}}
  end
}

basic.lsp_diagnos = {
  name = "diagnostic",
  hl_colors = {
    red = {"red", "NormalBg"},
    yellow = {"yellow", "NormalBg"},
    blue = {"blue", "NormalBg"}
  },
  width = breakpoint_width,
  text = function(bufnr)
    if lsp_comps.check_lsp(bufnr) then
      return {
        {lsp_comps.lsp_error({format = "  %s", show_zero = false}), "red"},
        {lsp_comps.lsp_warning({format = "  %s", show_zero = false}), "yellow"},
        {lsp_comps.lsp_info({format = "  %s", show_zero = false}), "blue"}
      }
    end
    return ""
  end
}
local icon_comp = b_components.cache_file_icon({default = "", hl_colors = {"white", "NormalBg"}})

basic.file = {
  name = "file",
  hl_colors = {
    default = hl_list.NormalBg,
    white = {"white", "NormalBg"},
    magenta = {"magenta", "NormalBg"},
    magenta_light = {"magenta_light", "NormalBg"},
    red_light = {"red_light", "NormalBg"}
  },
  text = function(bufnr)
    return {
      icon_comp(bufnr),
      {" ", ""},
      {vim.fn.expand("%F"), "magenta_light"},
      {" ", ""},
      {b_components.file_modified(" "), "red_light"}
    }
  end
}
basic.git = {
  name = "git",
  hl_colors = {
    default = hl_list.NormalBg,
    green = {"green_light", "NormalBg"},
    red = {"red_light", "NormalBg"},
    blue = {"blue_light", "NormalBg"}
  },
  width = breakpoint_width,
  text = function(bufnr)
    if git_comps.is_git(bufnr) then
      return {
        {git_comps.diff_added({format = " %s ", show_zero = false}), "green"},
        {git_comps.diff_removed({format = " %s ", show_zero = false}), "red"},
        {git_comps.diff_changed({format = "柳%s ", show_zero = false}), "blue"}
      }
    end
    return ""
  end
}

local quickfix = {
  filetypes = {"qf", "Trouble"},
  active = {
    {"🚦 Quickfix ", {"white", "black"}},
    {helper.separators.slant_right, {"black", "black_light"}},
    {
      function()
        return vim.fn.getqflist({title = 0}).title
      end,
      {"cyan", "black_light"}
    },
    {" Total : %L ", {"cyan", "black_light"}},
    {helper.separators.slant_right, {"black_light", "InactiveBg"}},
    {" ", {"InactiveFg", "InactiveBg"}},
    basic.divider,
    {helper.separators.slant_right, {"InactiveBg", "black"}},
    {"🧛 ", {"white", "black"}}
  },
  always_active = true,
  show_last_status = true
}

local explorer = {
  filetypes = {"fern", "NvimTree", "lir"},
  active = {
    {"  ", {"black", "blue"}},
    {helper.separators.slant_right, {"blue", "NormalBg"}},
    {b_components.divider, ""},
    {b_components.file_name(""), {"white", "NormalBg"}}
  },
  always_active = true,
  show_last_status = true
}

local default = {
  filetypes = {"default"},
  active = {
    basic.vi_mode,
    basic.file,
    basic.lsp_diagnos,
    basic.divider,
    basic.git,
    {git_comps.git_branch(), {"magenta", "NormalBg"}, breakpoint_width},
    {" ", hl_list.NormalBg}
  },
  inactive = {
    {" ", ""},
    {b_components.full_file_name, {"white", "NormalBg"}},
    {" ", ""}
    --  basic.divider
  }
}

windline.setup(
  {
    colors_name = function(colors)
      --  print(vim.inspect(colors))
      -- ADD MORE COLOR HERE ----
      colors.bg_dark = "#001a25"
      return colors
    end,
    statuslines = {
      default,
      quickfix,
      explorer
    }
  }
)
require("wlfloatline").setup()
--  {
--  ActiveBg = "#262626",
--  ActiveFg = "#928b95",
--  InactiveBg = "#0c0b1b",
--  InactiveFg = "#928b95",
--  NormalBg = "#002635",
--  NormalFg = "#e6e6dc",
--  black = "#262626",
--  black_light = "#0c0b1b",
--  blue = "#1c8db2",
--  blue_light = "#517f8d",
--  cyan = "#00cccc",
--  cyan_light = "#00ffff",
--  green = "#b8bb26",
--  green_light = "#7eca9c",
--  magenta = "#f08e48",
--  magenta_light = "#c694ff",
--  red = "#c43060",
--  red_light = "#ff5a67",
--  white = "#d0d0d0",
--  white_light = "#928b95",
--  yellow = "#ffcc1b",
--  yellow_light = "#fabd2f"
--  }
--
--  local wind = {
--  bg2         = "#001a25",
--  fg          = "#e6e6dc",
--  fg_light    = "#b8b8b4",
--  bg          = "#002635",
--  bg_tab      = '#004763',
--  bg_dark     = "#040a31",
--  bg_light    = "#194b5e",
--  term_bg     = "#002635",
--  term_fg     = "#e6e6dc",
--  black       = '#00384d',
--  black_bold  = "#073d52",
--  black_light = "#77929e",
--  black_gruv  = "#282828",
--  white       = "#928b95",
--  -- blue        = "#1c8db2",
--  -- blue        = "#0B978C",
--  blue        = "#12ade0",
--  blue_dark   = "#7eb2dd",
--  blue_gruv   = "#8ec07c",
--  blue_light  = "#b3e5fc",
--  cyan        = "#00cccc",
--  cyan_light  = "#00ffff",
--  green       = '#7fc06e',
--  green_gruv  = "#b8bb26",
--  green_light = "#7eca9c",
--  grey        = "#517f8d",
--  grey_light  = "#b7cff9",
--  orange      = '#f08e48',
--  pink        = "#c694ff",
--  pink_light  = "#fb94ff",
--  red         = "#ff5a67",
--  red_gruv    = "#fb4934",
--  red_light   = '#c43060',
--  yellow      = "#ffcc1b",
--  yellow_gruv = "#fabd2f",

--  bg = "NONE",
--  fg = "#81A1C1",
--  line_bg = "NONE",
--  lbg = "NONE",
--  fg_green = "#8FBCBB",
--  yellow = "#EBCB8B",
--  cyan = "#A3BE8C",
--  darkblue = "#81A1C1",
--  green = "#8FBCBB",
--  orange = "#D08770",
--  purple = "#B48EAD",
--  magenta = "#BF616A",
--  gray = "#616E88",
--  blue = "#5E81AC",
--  red = "#BF616A",
--  indigo = "#BF616A"
--  }
