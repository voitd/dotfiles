local map = require 'utils'.map
local U = require 'utils'
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd

fn.setenv("FZF_DEFAULT_OPTS", "--color=dark --reverse --keep-right --marker=+ --padding=1,1")
fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --hidden --glob '!.git/**'")
fn.setenv("FZF_PREVIEW_COMMAND", "COLORTERM=truecolor bat --color=always --style=plain --theme=ansi-dark -n -- {} || cat {}  --style=numbers {-1}")
-- fn.setenv("FZF_DEFAULT_COMMAND", "fd --type f --type l --hidden --follow || git ls-files --cached --others --exclude-standard")

-- Customize fzf colors to match your color scheme
-- fzf#wrap translates this to a set of `--color` options
g.fzf_colors = {
    fg = { "fg", "Normal" },
    bg = { "bg", "Normal" },
    hl = { "fg", "Red" },
    ["fg+"] = { "fg", "White" },
    ["bg+"] = { "bg", "Normal" },
    ["hl+"] = { "fg", "Red" },
    info = { "bg", "Normal" },
    prompt = { "fg", "White" },
    pointer = { "fg", "White" },
    marker = { "fg", "Yellow" },
    spinner = { "fg", "White" },
    header = { "bg", "Normal" }
}

-- Enable per-command history
-- - History files will be stored in the specified directory
-- - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
--   'previous-history' instead of 'down' and 'up'.
g.fzf_history_dir = "~/.local/share/fzf-history"

g.fzf_layout = {
    window = {
        width = 0.7,
        height = 0.55,
        yoffset = 0.4,
    },
}

cmd [[ command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, { "options": "--prompt '❯ '"}, <bang>0) ]]

g.fzf_preview_window='right:50%'
-- g.fzf_preview_window = {"right:50%", "ctr-p"}
-- g.fzf_preview_window = ""
g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit'
}

g.fzf_buffers_jump = 1

function FZFOpen(cmd_str)
    U.move_cursor_from_tree()
    cmd(cmd_str)
end


cmd [[
  function! Fzf_goto_def(lines) abort
    silent! exe 'e +BTags '.a:lines[0]
    call timer_start(10, {-> execute('startinsert') })
  endfunction
  function! Fzf_goto_line(lines) abort
    silent! exe 'e '.a:lines[0]
    call timer_start(10, {-> feedkeys(':') })
  endfunction
  let g:fzf_action['@'] = function('Fzf_goto_def')
  let g:fzf_action[':'] = function('Fzf_goto_line')
]]

-- Ctrl-p = fuzzy finder
map("n", "<C-P>", "<CMD>lua FZFOpen(':Files')<CR>")

-- . = location of current file
map("n", "'.", "<CMD>lua FZFOpen(':FZF "..fn.expand("%:h").."')<CR>")

map("n", "<leader>sw", "<CMD>lua require('utils').rg_word()<CR>")

-- z = FZF
map("n", "'z", "<CMD>lua FZFOpen(':FZF')<CR>")

-- b = buffers
map("n", "'b", "<CMD>lua FZFOpen(':Buffers')<CR>")

-- t = tags
map("n", "'t", "<CMD>lua FZFOpen(':Tags')<CR>")

-- i = history
map("n", "'i", "<CMD>lua FZFOpen(':History')<CR>")

-- h = home
map("n", "'h", "<CMD>lua FZFOpen(':FZF ~/')<CR>")

-- g = gitfiles
map("n", "'g", "<CMD>lua FZFOpen(':GFiles')<CR>")

-- d = diagnostics
map("n", "<leaderr>cd", "<CMD>lua FZFOpen(':Diagnostics')<CR>")
