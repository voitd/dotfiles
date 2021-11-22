local get_hex = require("cokeline.utils").get_hex
local space = {text = " "}

require("cokeline").setup(
  {
    show_if_buffers_are_at_least = 1,
    cycle_prev_next_mappings = true,
    buffers = {
      filter = function(buffer)
        return buffer.type ~= "terminal"
      end
    },
    default_hl = {
      focused = {
        bg = "none"
      },
      unfocused = {
        fg = "#77929e",
        bg = "none"
      }
    },
    components = {
      space,
      {
        text = "| ",
        hl = {
          fg = "#77929e",
          style = "bold"
        }
      },
      space,
      {
        text = function(buffer)
          return buffer.devicon.icon
        end,
        hl = {
          fg = function(buffer)
            return buffer.devicon.color
          end
        }
      },
      {
        text = function(buffer)
          return buffer.filename
        end,
        hl = {
          fg = function(buffer)
            if buffer.is_focused then
              return "#f08e48"
            end
            if buffer.lsp.errors ~= 0 then
              return "#c43060"
            end
          end,
          style = function(buffer)
            local style
            if buffer.is_focused then
              style = "bold,italic"
            end
            if buffer.lsp.errors ~= 0 then
              if style then
                style = style .. ",underline"
              else
                style = "underline"
              end
            end
            return style
          end
        }
      },
      {
        text = function(buffer)
          if buffer.is_readonly then
            return " "
          end
          return ""
        end
      },
      {
        text = function(buffer)
          return buffer.is_modified and "  " or " 窱"
        end,
        delete_buffer_on_left_click = true,
        hl = {
          fg = function(buffer)
            if buffer.is_modified then
              return "#7fc06e"
            end
            return "#77929e"
          end
          --  style = "bold"
        }
      },
      {
        text = function(buffer)
          local no_of_buffers = #vim.fn.getbufinfo({buflisted = 1})
          return buffer.index == no_of_buffers and " |" or ""
        end,
        hl = {
          fg = "#77929e",
          style = "bold"
        }
      },
      space
    }
  }
)

local opts = {silent = true}
vim.api.nvim_set_keymap("n", "<Tab>", "<Plug>(cokeline-focus-next)", opts)
vim.api.nvim_set_keymap("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", opts)
vim.api.nvim_set_keymap("n", "<M-Left>", "<Plug>(cokeline-switch-prev)", opts)
vim.api.nvim_set_keymap("n", "<M-Right>", "<Plug>(cokeline-switch-next)", opts)

vim.cmd "au VimEnter * hi! tablinefill guifg=NONE guibg=NONE"
