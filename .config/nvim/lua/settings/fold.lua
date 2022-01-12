local fn, api = vim.fn, vim.api

local replace_tabs = function(value)
  return fn.substitute(value, '\\t', fn['repeat'](' ', api.nvim_buf_get_option(0, 'tabstop')), 'g')
end

local strip_whitespace = function(value)
  return fn.substitute(value, '^\\s*', '', 'g')
end

local prepare_fold_section = function(value)
  return strip_whitespace(replace_tabs(value))
end

local fold_exclusions = {}

local is_ignored = function()
  return fn.index(fold_exclusions, api.nvim_buf_get_option(0, 'filetype')) >= 0 or vim.wo.diff
end

local is_import = function(item)
  local sub = item:match('^import')
  if sub ~= nil then
    return #sub > 0
  end
  return false
end

local transform_import = function(item, foldsymbol)
  return fn.substitute(item, '^import .\\+', 'import' .. foldsymbol, '')
end

local contains_delimiter = function(value)
  return #fn.matchstr(value, '}\\|)\\|]\\|`\\|>')
end

local handle_fold_start = function(start_text, end_text, foldsymbol)
  if is_import(start_text) and contains_delimiter(end_text) then
    return transform_import(start_text, foldsymbol)
  end
  return prepare_fold_section(start_text) .. foldsymbol
end

local handle_fold_end = function(item)
  if not contains_delimiter(item) or is_import(item) then
    return ''
  end
  return prepare_fold_section(item)
end

local render = function()
  if is_ignored() then
    return fn.foldtext()
  end
  local end_text = fn.getline(vim.v.foldend)
  local start_text = fn.getline(vim.v.foldstart)
  local st = handle_fold_start(start_text, end_text, '…')
  local ed = handle_fold_end(end_text)
  local line = string.format('%s%s', st, ed)
  local lines_count = vim.v.foldend - vim.v.foldstart + 1
  local count_text = string.format('(%d lines)', lines_count)
  local indentation = fn.indent(vim.v.foldstart)
  local fold_start = fn['repeat'](' ', indentation) .. line .. ' '
  local fold_end = ' ' .. count_text .. ' '
  local columns = fn.split(vim.wo.foldcolumn, ':')
  local column_size = columns[#columns]
  local fold_char = vim.o.fillchars:match('fold:(.-),') or ' '
  local text_length = #fn.substitute(fold_start .. fold_end, '.', 'x', 'g') + column_size
  return string.format('%s%s%s', fold_start, fn['repeat'](fold_char, fn.winwidth(0) - text_length - 10), fold_end)
end

return {render = render}
