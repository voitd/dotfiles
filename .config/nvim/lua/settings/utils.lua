local g = vim.g
local o = vim.o
local bo = vim.bo
local fn = vim.fn
local fnamemodify = fn.fnamemodify
local api = vim.api
local cmd = vim.cmd
local lsp = vim.lsp
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

function U.show_doc()
  local ft = api.nvim_buf_get_option(api.nvim_get_current_buf(), 'ft')
  if ft == 'vim' or ft == 'help' then
    api.nvim_exec('h '..fn.expand('<cword>'), '')
  else
    lsp.buf.signature_help()
  end
end

local current_hovered_word = nil
function U.hover()
  local new_current_hovered_word = fn.expand('<cword>')
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
  for k, v in pairs(opts) do g[k] = v end
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
  local command = string.format("autocmd ColorScheme * hi %s", group)
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

function U.organize_imports_sync()
  local params = lsp.util.make_range_params()
  params.context = {
    diagnostics = {},
    only = { 'source.organizeImports' }
  }

  local responses = lsp.buf_request_sync(0, 'textDocument/codeAction', params)

  if not responses or vim.tbl_isempty(responses) then
    print('You cannot organize your imports')
    return
  end

  for _, response in pairs(responses) do
    for _, result in pairs(response.result or {}) do
      if result.edit then
        lsp.util.apply_workspace_edit(result.edit)
      end
    end
  end
end

function U.console_log()
  local view = fn.winsaveview()
  local word = fn.expand("<cword>")

  cmd(string.format("keepjumps norm!oconsole.log('%s ->', %s); // eslint-disable-line no-console", word, word))
  fn.winrestview(view)
end

function U.rg_word()
  local word = fn.expand("<cword>")
  cmd(join("Rg! ", word))
end

function U.open_file_or_create_new()
  local path = fn.expand("<cfile>")
  if not path or path == "" then
    return false
  end

  -- TODO handle terminal buffers

  if pcall(vim.cmd, "norm!gf") then
    return true
  end

  local answer = fn.input("Create a new file, (Y)es or (N)o? ")
  if not answer or string.lower(answer) ~= "y" then
    return vim.cmd "redraw"
  end
  vim.cmd "redraw"
  local new_path = fn.fnamemodify(fn.expand("%:p:h") .. "/" .. path, ":p")
  local ext = fn.fnamemodify(new_path, ":e")

  if ext and ext ~= "" then
    return vim.cmd("edit " .. new_path)
  end

  local suffixes = fn.split(vim.bo.suffixesadd, ",")

  for _, suffix in ipairs(suffixes) do
    if fn.filereadable(new_path .. suffix) then
      return vim.cmd("edit " .. new_path .. suffix)
    end
  end

  return vim.cmd("edit " .. new_path .. suffixes[1])
end

local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, 'No location found')
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

function U.peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
      return
    end
    if not vim.bo[bufnr].modified then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.cmd("noautocmd :update")
      end
    end
  end

function U.rename()
  local current_word = vim.fn.expand("<cword>")
  local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.01)
  vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
  vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
  vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
    vim.api.nvim_win_close(plenary_window.win_id, true)

    if text ~= '' then
      vim.schedule(function()
        vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })

        vim.lsp.buf.rename(text)
      end)
    else
      print("Nothing to rename!")
    end
  end)

  vim.cmd [[startinsert]]
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
  'git',
  'undotree',
  'help',
  'startify',
  'vim-plug',
  'NvimTree',
}

function _G.is_special_buffer()
  local buftype = api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'terminal' or buftype == 'quickfix' or buftype == 'help' then
    return true
  end
  local filetype = api.nvim_buf_get_option(0, 'filetype')
  for _, b in ipairs(special_buffers) do
    if filetype == b then
      return true
    end
  end
  return false
end

_G.folds_render = require('settings.fold').render

function _G.check_backspace()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end


return U
