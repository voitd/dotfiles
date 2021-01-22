local map = require "settings.utils".map
local finders = require "telescope.builtin"
local actions = require "telescope.actions"
local telescope = require "telescope"
local sorters = require "telescope.sorters"
local previewers = require "telescope.previewers"
local transform_mod = require("telescope.actions.mt").transform_mod

telescope.setup {
  defaults = {
    prompt_position = "top",
    prompt_prefix = " ❯",
    file_ignore_patterns = {".git/*"},
    shorten_path = true,
    color_devicons = true,
    winblend = 20,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = actions.goto_file_selection_split,
        ["<C-v>"] = actions.goto_file_selection_vsplit,
        ["<C-k>"] = actions.close + transform_mod(
          {
            x = function()
              vim.cmd ":silent !kitty @ launch --copy-env --cwd=current nvim"
            end
          }
          )
      },
      n = {
        ["<esc>"] = actions.close,
      }
    },
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new
  }
}

function TelescopeOpen(fn)
  require "settings.utils".move_cursor_from_tree()
  finders[fn](require("telescope.themes").get_dropdown({previewer = false}))
end

function TelescopeOpenPrewiev(fn)
  require "settings.utils".move_cursor_from_tree()
  finders[fn](require("telescope.themes").get_dropdown({}))
end

map("n", "<leader>bb", "<CMD>lua TelescopeOpen('buffers')<CR>")
map("n", "<C-f>", "<CMD>lua TelescopeOpenPrewiev('find_files')<CR>")
map("n", "<C-p>", "<CMD>lua TelescopeOpenPrewiev('git_files')<CR>")
map("n", "<leader>fc", "<CMD>lua TelescopeOpen('commands')<CR>")
map("n", "<leader>fi", "<CMD>lua TelescopeOpen('builtin')<CR>")
map("n", "<leader>rg", "<CMD>lua TelescopeOpenPrewiev('grep_string')<CR>")
map("n", "<leader>fg", "<CMD>lua TelescopeOpenPrewiev('git_files')<CR>")
map("n", "<leader>lg", "<CMD>lua TelescopeOpenPrewiev('live_grep')<CR>")
-- map("n", "<leader>fm", "<CMD>lua TelescopeOpenPrewiev('oldfiles')<CR>")
map("n", "<leader>fgs", "<CMD>lua TelescopeOpenPrewiev('git_status')<CR>")
map("n", "<leader>fk",  "<CMD>lua TelescopeOpenPrewiev('lsp_references')<CR>")
