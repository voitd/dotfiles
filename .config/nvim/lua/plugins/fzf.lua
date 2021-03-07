local map = require "settings.utils".map
local move_cursor_from_tree = require "settings.utils".move_cursor_from_tree
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

fn.setenv(
  "FZF_DEFAULT_OPTS",
  "--reverse --keep-right --marker=+ --padding=1,1 --color=fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#2E3440,hl+:#A3BE8C,pointer:#BF616A,info:#2E3440,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
)
-- "--reverse --keep-right --marker=+ --padding=1,1 --color=fg:#4d4d4c,bg:#eeeeee,hl:#d7005f,fg+:#4d4d4c,bg+:#e8e8e8,hl+:#d7005f,info:#eeeeee,prompt:#8959a8,pointer:#d7005f,marker:#4271ae,spinner:#4271ae,header:#4271ae"

fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden --glob '!.git/**'")
fn.setenv(
  "FZF_PREVIEW_COMMAND",
  "COLORTERM=truecolor bat --color=always --style=plain --theme=ansi-dark -n -- {} || cat {}  --style=numbers {-1}"
)

g.fzf_branch_actions = {
  checkout = {
    execute = 'echo system("{git} checkout " . (empty("{branch}") ? "-b {input}" : "{branch}"))',
    required = {}
  }
}
-- Customize fzf colors to match your color scheme
-- fzf#wrap translates this to a set of `--color` options
-- g.fzf_colors = {
--   fg = {"fg", "#4d4d4c"},
--   bg = {"bg", "#eeeeee"},
--   hl = {"fg", "#d7005f"},
--   ["fg+"] = {"fg", "#4d4d4c"},
--   ["bg+"] = {"bg", "#e8e8e8"},
--   ["hl+"] = {"fg", "#d7005f"},
--   info = {"bg", "Normal"},
--   prompt = {"fg", "#8959a8"},
--   pointer = {"fg", "#d7005f"},
--   marker = {"fg", "#4271ae"},
--   spinner = {"fg", "#4271ae"},
--   header = {"bg", "#4271ae"}
-- }
-- Enable per-command history
-- - History files will be stored in the specified directory
-- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
--   'previous-history' instead of 'down' and 'up'.
g.fzf_history_dir = "~/.local/share/fzf-history"
-- g.fzf_files_options = '--preview "(kitty +kitten icat --width 50 --true-color {} || cat {}) 2> /dev/null "'
--[[ g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.6,
    yoffset = 0.4,
    xoffset = 0.5
  }
} ]]
g.fzf_layout = {
  window = {
    width = 1,
    height = 0.4,
    border = "top",
    yoffset = 1
  }
}

-- g.fzf_preview_window = {"right:+{2}-/2:hidden", "ctrl-\\"}
-- g.fzf_layout = { ['down'] = '30%' }
vim.g.fzf_preview_window = "right:50%"

cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '❯ '"}, <bang>0) ]]

-- g.fzf_preview_window='right:50%'
g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-x"] = "split",
  ["ctrl-v"] = "vsplit",
  ["ctrl-k"] = "silent !kitty @ launch --copy-env --cwd=current nvim"
}

g.fzf_buffers_jump = 1

function FZFOpen(cmd_str)
  move_cursor_from_tree()
  cmd(cmd_str)
end

map("n", "<leader>rw", "<CMD>lua rg_word()<CR>")

map("n", "<leader>st", "<CMD>lua FZFOpen(':RG')<CR>")

-- map("n", "<leader>bb", "<CMD>lua FZFOpen(':Buffers')<CR>")
-- map("n", "<leader>sb", "<CMD>lua FZFOpen(':BLines')<CR>")
-- map("n", "<leader>bs", "<CMD>lua FZFOpen(':BLines')<CR>")
-- map("n", "<leader>bb", "<CMD>lua FZFOpen(':Buffers')<CR>")

-- map("n", "<leader>cd", "<CMD>lua FZFOpen(':Diagnostics')<CR>")
-- map("n", "<leader>cr", "<CMD>lua FZFOpen(':References')<CR>")
-- map("n", "<leader>cs", "<CMD>lua FZFOpen(':DocumentSymbols')<CR>")
-- map("n", "<leader>ci", "<CMD>lua FZFOpen(':Implementations')<CR>")

api.nvim_exec(
  [[
    function! RipgrepFzf(query)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'down': '40%'}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec))
        endfunction
        command! -nargs=* -bang RG call RipgrepFzf(<q-args>)
        au FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber | autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber
      ]],
  ""
)

function _G.fzf_omni()
  if vim.fn.isdirectory(".git") == 1 then
    return ":GFiles --cached --others --exclude-standard --full-name"
  else
    return ":Files"
  end
end
print()
-- map("n", "<C-f>", ":lua FZFOpen(fzf_omni())<CR>")
