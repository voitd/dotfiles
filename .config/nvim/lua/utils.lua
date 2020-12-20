local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local U = {}

-- function table.merge(dest, src)
--    for k,v in pairs(src) do
--        dest[k] = v
--    end
--    return dest
-- end

-- Key mapping
function U.map(mode, key, result, opts)
    opts = vim.tbl_extend('keep', opts or {}, {
        noremap = true,
        silent = true,
        expr = false
    })

    fn.nvim_set_keymap(mode, key, result, opts)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    n = fn.bufname()
    nr = api.nvim_get_current_buf()
    if string.find(n, 'NERD_tree') and nr > 1 then
        -- cmd('exe "normal! \\<C-W>\\<C-W>"')
        cmd('wincmd l')
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local gui = styles.gui and 'gui='..styles.gui or 'gui=NONE'
    local sp = styles.sp and 'guisp='..styles.sp or 'guisp=NONE'
    local fg = styles.fg and 'guifg='..styles.fg or 'guifg=NONE'
    local bg = styles.bg and 'guibg='..styles.bg or 'guibg=NONE'
    cmd('highlight! '..group..' '..gui..' '..sp..' '..fg..' '..bg)
end

-- Usage:
-- highlight({
--      CursorLine   = { bg = bg },
--      Cursor       = { fg = bg_dark, bg = yellow }
-- })
function U.highlights(hi_table)
    for group, styles in pairs(hi_table) do
        U.highlight(group, styles)
    end
end

function U.hiLink(src, dest)
    cmd('highlight link '..src..' '..dest)
end

function U.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        U.hiLink(src, dest)
    end
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

function U.disable_distribution_plugins()
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1
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

return U
