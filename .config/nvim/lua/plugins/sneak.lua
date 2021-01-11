local map = require "settings.utils".map
local g = vim.g

g['sneak#label'] = 1
g['sneak#use_ic_scs'] = 1
g['sneak#s_next'] =1
g['sneak#streak'] = 1
g['sneak#streak_esc'] = "<Esc>"
g['sneak#prompt'] = '  '


map('n', 's', '<Plug>Sneak_s', {noremap = false})
map('n', 'S', '<Plug>Sneak_S', {noremap = false})
map('x', 's', '<Plug>Sneak_s', {noremap = false})
map('x', 'S', '<Plug>Sneak_S', {noremap = false})
map('o', 's', '<Plug>Sneak_s', {noremap = false})
map('o', 'S', '<Plug>Sneak_S', {noremap = false})
map('n', 'f', '<Plug>Sneak_f', {noremap = false})
map('n', 'F', '<Plug>Sneak_F', {noremap = false})
map('x', 'f', '<Plug>Sneak_f', {noremap = false})
map('x', 'F', '<Plug>Sneak_F', {noremap = false})
map('o', 'f', '<Plug>Sneak_f', {noremap = false})
map('o', 'F', '<Plug>Sneak_F', {noremap = false})
