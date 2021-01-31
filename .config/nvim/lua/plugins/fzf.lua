local map = require "settings.utils".map
local move_cursor_from_tree = require "settings.utils".move_cursor_from_tree
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

fn.setenv("FZF_DEFAULT_OPTS", "--color=dark --reverse --keep-right --marker=+ --padding=1,1")
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
g.fzf_colors = {
  fg = {"fg", "Normal"},
  bg = {"bg", "Normal"},
  hl = {"fg", "Red"},
  ["fg+"] = {"fg", "White"},
  ["bg+"] = {"bg", "Normal"},
  ["hl+"] = {"fg", "Red"},
  info = {"bg", "Normal"},
  prompt = {"fg", "White"},
  pointer = {"fg", "White"},
  marker = {"fg", "Yellow"},
  spinner = {"fg", "White"},
  header = {"bg", "Normal"}
}

-- Enable per-command history
-- - History files will be stored in the specified directory
-- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
--   'previous-history' instead of 'down' and 'up'.
g.fzf_history_dir = "~/.local/share/fzf-history"
-- g.fzf_files_options = '--preview "(kitty +kitten icat --width 50 --true-color {} || cat {}) 2> /dev/null "'
g.fzf_layout = {
  window = {
    width = 0.6,
    height = 0.55,
    yoffset = 0.4,
    xoffset = 0.5,
  }
}

-- g.fzf_layout = { ['down'] = '30%' }
vim.g.fzf_preview_window = 'right:60%'
cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '❯ '"}, <bang>0) ]]

-- g.fzf_preview_window='right:50%'
g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
-- g.fzf_preview_window = {"right:50%", "ctr-p"}
-- g.fzf_preview_window = ""
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


-- Ctrl-p = fuzzy finder
-- map("n", "<C-m>", "<CMD>lua FZFOpen(':History')<CR>")
-- map("n", "<C-m>", "<CMD>lua FZFOpen(':History')<CR>")
-- map("n", "<C-P>", "<CMD>lua FZFOpen(':Files')<CR>")
  

-- . = location of current file
-- map("n", "'.", "<CMD>lua FZFOpen(':FZF " .. fn.expand("%:h") .. "')<CR>")

map("n", "<leader>sw", "<CMD>lua rg_word()<CR>")

-- r = RG
map("n", "<leader>srg", "<CMD>lua FZFOpen(':RG')<CR>")

-- z = FZF
-- map("n", "<leader>sf", "<CMD>lua FZFOpen(':FZF')<CR>")

-- b = buffers
map("n", "<leader>bb", "<CMD>lua FZFOpen(':Buffers')<CR>")

-- t = tags
-- map("n", "<leader>sta", "<CMD>lua FZFOpen(':Tags')<CR>")

-- i = history
-- map("n", "<C-m>", "<CMD>lua FZFOpen(':History')<CR>")

-- h = home
-- map("n", "<leader>sh", "<CMD>lua FZFOpen(':FZF ~/')<CR>")

-- g = gitfiles
-- map("n", "<leader>sg", "<CMD>lua FZFOpen(':GFiles')<CR>")

-- d = diagnostics
map("n", "<leader>cd", "<CMD>lua FZFOpen(':Diagnostics')<CR>")

api.nvim_exec(
  [[
    function! RipgrepFzf(query)
          let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'down': '70%'}
          call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec))
        endfunction
        command! -nargs=* -bang RG call RipgrepFzf(<q-args>)
        au FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber | autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber
      ]],
  ""
)


function _G.fzf_omni()
  if vim.fn.isdirectory(".git") == 1 then
   return ':GFiles --cached --others --exclude-standard --full-name'
  else
   return ':Files'
  end
end

map("n", "<C-f>", ":lua FZFOpen(fzf_omni())<CR>")
