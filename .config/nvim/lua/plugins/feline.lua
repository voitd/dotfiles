local f = vim.fn
local cmd = vim.cmd

cmd "set termguicolors"
cmd "syntax enable"
cmd "syntax sync fromstart"

local icons = {
  diagnostic = {
    error = "  ",
    warn = "  ",
    hint = "  ",
    info = "   "
  },
  diff = {
    added = " ",
    changed = "柳",
    removed = " "
  },
  main = "   "
}

local colors = {
  bg = "NONE",
  fg = "#81A1C1",
  line_bg = "NONE",
  lbg = "NONE",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A",
  indigo = "#BF616A"
}

local vi_mode_colors = {
  n = colors.magenta,
  i = colors.green,
  v = colors.blue,
  [""] = colors.blue,
  V = colors.blue,
  c = colors.red,
  no = colors.magenta,
  s = colors.orange,
  S = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.purple,
  Rv = colors.purple,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.red
}

local vi_mode_utils = require("feline.providers.vi_mode")
local lsp = require("feline.providers.lsp")
local git = require("feline.providers.git")
local devicons = require("nvim-web-devicons")

local comps = {
  vi_mode = {
    provider = function()
      return icons.main
    end,
    hl = function()
      return {
        fg = vi_mode_utils.get_mode_color(),
        bg = colors.bg
      }
    end,
    right_sep = " "
  },
  file = {
    name = {
      provider = function()
        return f.expand("%:t")
      end,
      hl = function()
        local _, cc = devicons.get_icon_color(f.expand("%:t"))
        return {
          style = "bold",
          fg = cc
        }
      end,
      left_sep = " ",
      right_sep = " "
    },
    icon = {
      provider = function()
        local icon, _ = devicons.get_icon(f.expand("%:t"))
        return icon or ""
      end,
      hl = function()
        local _, cc = devicons.get_icon_color(f.expand("%:t"))
        return {
          fg = cc
        }
      end
    },
    fullpath = {
      provider = function()
        return f.expand("%:F")
      end,
      hl = function()
        local _, cc = devicons.get_icon_color(f.expand("%:F"))
        return {
          style = "bold",
          fg = cc
        }
      end,
      left_sep = " ",
      right_sep = " "
    }
  },
  diag = {
    error = {
      provider = "diagnostic_errors",
      icon = icons.diagnostic.error,
      enabled = function()
        return lsp.diagnostics_exist("Error")
      end,
      hl = {
        fg = colors.red
      },
      left_sep = " "
    },
    warn = {
      provider = "diagnostic_warnings",
      icon = icons.diagnostic.warn,
      enabled = function()
        return lsp.diagnostics_exist("Warning")
      end,
      hl = {
        fg = colors.yellow
      },
      left_sep = " "
    },
    hint = {
      provider = "diagnostic_hints",
      icon = icons.diagnostic.hint,
      enabled = function()
        return lsp.diagnostics_exist("Hint")
      end,
      hl = {
        fg = colors.gray
      },
      left_sep = " "
    },
    info = {
      provider = "diagnostic_info",
      icon = icons.diagnostic.info,
      enabled = function()
        return lsp.diagnostics_exist("Information")
      end,
      hl = {
        fg = colors.blue
      },
      left_sep = " "
    }
  },
  lsp = {
    servers = {
      provider = "lsp_client_names",
      icon = "  ",
      hl = {
        fg = colors.emerald
      }
    }
  },
  git = {
    branch = {
      provider = function()
        local head, icon = git.git_branch(0)
        return icon .. head
      end,
      enabled = function()
        return git.git_branch(0) ~= ""
      end,
      hl = {
        fg = colors.orange,
        style = "bold"
      },
      left_sep = " "
    },
    diff = {
      add = {
        provider = function()
          return git.git_diff_added(0)
        end,
        icon = icons.diff.added,
        enabled = function()
          return git.git_diff_added(0) ~= ""
        end,
        hl = {
          fg = colors.green
        },
        left_sep = " "
      },
      change = {
        provider = function()
          return git.git_diff_changed(0)
        end,
        icon = icons.diff.changed,
        enabled = function()
          return git.git_diff_changed(0) ~= ""
        end,
        hl = {
          fg = colors.yellow
        },
        left_sep = " "
      },
      remove = {
        provider = function()
          return git.git_diff_removed(0)
        end,
        icon = icons.diff.removed,
        enabled = function()
          return git.git_diff_removed(0) ~= ""
        end,
        hl = {
          fg = colors.red
        },
        left_sep = " "
      }
    }
  }
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}}
}

function components.active_add(self, n, x)
  self.active[n][#self.active[n] + 1] = x
end

function components.inactive_add(self, n, x)
  self.inactive[n][#self.inactive[n] + 1] = x
end

components:active_add(1, comps.vi_mode)
components:active_add(1, comps.file.icon)
components:active_add(1, comps.file.name)
components:active_add(1, comps.diag.error)
components:active_add(1, comps.diag.warn)
components:active_add(1, comps.diag.hint)
components:active_add(1, comps.diag.info)
components:active_add(3, comps.git.diff.add)
components:active_add(3, comps.git.diff.change)
components:active_add(3, comps.git.diff.remove)
components:active_add(3, comps.git.branch)
--  components:active_add(3, comps.lsp.servers)
components:inactive_add(1, comps.file.icon)
components:inactive_add(1, comps.file.fullpath)

require("feline").setup(
  {
    colors = {bg = colors.bg, fg = colors.fg},
    components = components,
    vi_mode_colors = vi_mode_colors,
    force_inactive = {
      filetypes = {
        "NvimTree",
        "dbui",
        "packer",
        "startify",
        "fugitive",
        "fugitiveblame"
      },
      buftypes = {"terminal"},
      bufnames = {}
    }
  }
)
