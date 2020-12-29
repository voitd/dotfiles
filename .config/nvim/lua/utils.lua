local g = vim.g
local o = vim.o
local bo = vim.bo
local fn = vim.fn
local fnamemodify = fn.fnamemodify
local api = vim.api
local cmd = vim.cmd
local U = {}

local function join(...)
  return table.concat({...}, " ")
end

-- Key mapping
function U.map(mode, key, result, opts)
  opts =
    vim.tbl_extend(
    "keep",
    opts or {},
    {
      noremap = true,
      silent = true,
      expr = false
    }
  )
  fn.nvim_set_keymap(mode, key, result, opts)
end

function U.apply_options(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd("set " .. k)
    elseif v == false then
      cmd(string.format("set no%s", k))
    else
      cmd(string.format("set %s=%s", k, v))
    end
  end
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
  local nr = api.nvim_get_current_buf()
  local buf = api.nvim_buf_get_name(nr)
  if string.find(buf, "NERD_tree") and nr > 1 then
    cmd("wincmd l")
  end
end

-- Open help vertically and press q to exit
function U.help_tab()
  if bo.buftype == "help" then
    cmd("wincmd L")
    local nr = api.nvim_get_current_buf()
    api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", {noremap = true, silent = true})
  end
end

function U.esc(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

-- Usage:
-- hi(Cursor, { fg = bg_dark, bg = yellow })
function U.hi(group, styles)
  local command = string.format("hi! %s", group)
  if styles.bg then
    command = string.format("%s guibg=%s", command, styles.bg)
  end
  if styles.fg then
    command = string.format("%s guifg=%s", command, styles.fg)
  end
  if styles.cbg then
    command = string.format("%s ctermbg=%s", command, styles.cbg)
  end
  if styles.cfg then
    command = string.format("%s ctermfg=%s", command, styles.cfg)
  end
  if styles.g then
    command = string.format("%s gui=%s", command, styles.g)
  end
  cmd(command)
end

-- Usage:
-- highlights({
--      CursorLine   = { bg = bg },
--      Cursor       = { fg = bg_dark, bg = yellow }
-- })
function U.highlights(hi_table)
  for group, styles in pairs(hi_table) do
    U.hi(group, styles)
  end
end

function U.hiLink(src, dest)
  cmd(string.format("hi! link %s %s", src, dest))
end

function U.hiLinks(hi_table)
  for src, dest in pairs(hi_table) do
    U.hiLink(src, dest)
  end
end

function U.disable_distribution_plugins()
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1
  g.loaded_vimball = 1
  g.loaded_vimballPlugin = 1
  g.loaded_matchit = 1
  g.loaded_matchparen = 1
  g.loaded_2html_plugin = 1
  g.loaded_logiPat = 1
  g.loaded_rrhelper = 1
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_netrwFileHandlers = 1
end

function U.toggle_settings(settings)
  for _, setting_name in ipairs(settings) do
    if o[setting_name] == true then
      o[setting_name] = false
    elseif o[setting_name] == false then
      o[setting_name] = true
    else
      print("error must be boolean")
    end
  end
end

-- takes a table of global variable names to toggle
function U.toggle_global_variables(global_variables)
  for _, g_var_name in ipairs(global_variables) do
    if g[g_var_name] == 0 then
      g[g_var_name] = 1
    elseif g[g_var_name] == 1 then
      g[g_var_name] = 0
    else
      print("error, must be 0 or 1")
    end
  end
end

function U.define_autocmd(spec)
  local event = spec.event
  if type(event) == "table" then
    event = table.concat(event, ",")
  end
  local group = spec.group or ""
  local pattern = spec.pattern or "*"
  local once = spec.once and "++once" or ""
  local nested = spec.nested and "++nested" or ""

  local command = spec.command or ""

  cmd(join("autocmd", group, event, pattern, once, nested, command))
end

function U.get_toggleterm_name(_, bufnum)
  local shell = fnamemodify(vim.env.SHELL, ":t")
  local terminal_prefix = "Terminal(" .. shell .. ")["
  return terminal_prefix .. fn.getbufvar(bufnum, "toggle_number") .. "]"
end

function U.console_log()
  local view = fn.winsaveview()
  local word = fn.expand("<cword>")

  cmd(string.format("keepjumps norm!oconsole.log('%s ->', %s); // eslint-disable-line no-console", word, word))
  -- fn["repeat#set"](U.esc("<Plug>(JsConsoleLog)"))
  fn.winrestview(view)
end

function U.rg_word()
  local word = fn.expand("<cword>")
  cmd(join("Rg! ", word))
end

function U.log()
end

-- local function feedkeys(s)
--   api.nvim_feedkeys(api.nvim_replace_termcodes(s, true, true, true), 'n', true)
-- end

-- function U.expand_tab()
--   if vim.fn.pumvisible() == 1 then
--     if vim.fn.complete_info({"selected"})["selected"] == -1 then
--       api.nvim_input("<C-n><Plug>(completion_confirm_completion)")
--     else
--       api.nvim_input("<Plug>(completion_confirm_completion)")
--     end
--   else
--     feedkeys("<Tab>")
--   end
-- end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

return U
