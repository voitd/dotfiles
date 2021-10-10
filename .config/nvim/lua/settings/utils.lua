local g, o, bo = vim.g, vim.o, vim.bo
local util, api, cmd, fn, lsp = vim.lsp.util, vim.api, vim.cmd, vim.fn, vim.lsp
local fnamemodify = fn.fnamemodify
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
  api.nvim_set_keymap(mode, key, result, opts)
end

function U.show_doc()
  local ft = api.nvim_buf_get_option(api.nvim_get_current_buf(), "ft")
  if ft == "vim" or ft == "help" then
    api.nvim_exec("h " .. fn.expand("<cword>"), "")
  else
    lsp.buf.signature_help()
  end
end

local current_hovered_word = nil
function U.hover()
  local new_current_hovered_word = fn.expand("<cword>")
  if current_hovered_word ~= new_current_hovered_word then
    lsp.buf.hover()
  end
  current_hovered_word = new_current_hovered_word
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

function U.apply_globals(opts)
  for k, v in pairs(opts) do
    g[k] = v
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

function U.esc(arg)
  return api.nvim_replace_termcodes(arg, true, false, true)
end

-- Usage:
-- hi(Cursor, { fg = bg_dark, bg = yellow })
function U.hi(group, styles)
  -- local command = string.format("hi! %s", group)
  local command = string.format("hi %s", group)
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
  if styles.gui then
    command = string.format("%s gui=%s", command, styles.gui)
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

function _G.console_log()
  local view = fn.winsaveview()
  local word = fn.expand("<cword>")

  cmd(string.format("keepjumps norm!oconsole.log('%s ->', %s); // eslint-disable-line no-console", word, word))
  fn.winrestview(view)
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

function _G.reload_lsp()
  lsp.stop_client(lsp.get_active_clients())
  cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  cmd("edit " .. path)
end

local special_buffers = {
  "git",
  "undotree",
  "help",
  "startify",
  "vim-plug",
  "NvimTree"
}

function _G.is_special_buffer()
  local buftype = api.nvim_buf_get_option(0, "buftype")
  if buftype == "terminal" or buftype == "quickfix" or buftype == "help" then
    return true
  end
  local filetype = api.nvim_buf_get_option(0, "filetype")
  for _, b in ipairs(special_buffers) do
    if filetype == b then
      return true
    end
  end
  return false
end

_G.folds_render = require("settings.fold").render

function _G.check_backspace()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

function _G.reload()
  local modules = {"lsp", "plugins", "settings"}
  for _, moduleName in pairs(modules) do
    for packageName, _ in pairs(package.loaded) do
      if string.find(packageName, "^" .. moduleName) then
        package.loaded[packageName] = nil
      end
    end
    require(moduleName)
  end
  print("Reloaded!")
end

function _G.rg_word()
  local word = fn.expand("<cword>")
  cmd(join("RG ", word))
end

-- toggle mouse
function _G.toggle_mouse()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
    print("Mouse enabled")
  else
    vim.o.mouse = ""
    print("Mouse disabled")
  end
end


return U
