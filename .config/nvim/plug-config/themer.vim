" let g:vimColorScheme = 'Gruvbox Mix Dark'
let g:colorSchemeList = {}
let g:colorSchemeList['Rigel'] = [
      \   'set background=dark',
      \   "let g:rigel_italic=1",
      \   "let g:rigel_bold=1",
      \   'colorscheme rigel',
      \   'source ~/.config/nvim/plug-config/statusline/rigel-line.vim',
      \   ]

let g:colorSchemeList['Gruvbox Material Dark'] = [
      \   'set background=dark',
      \   "let g:gruvbox_material_background = 'medium'",
      \   "let g:gruvbox_material_palette = 'material'",
      \   "let g:gruvbox_material_visual = 'grey background'",
      \   "let g:gruvbox_material_cursor = 'green'",
      \   "let g:gruvbox_material_sign_column_background = 'none'",
      \   'colorscheme gruvbox-material',
      \   'source ~/.config/nvim/plug-config/statusline/gruvbox-dark-line.vim',
      \   ]

let g:colorSchemeList['Gruvbox Material Light'] = [
      \   'set background=light',
      \   "let g:gruvbox_material_background = 'hard'",
      \   "let g:gruvbox_material_enable_bold = 1",
      \   "let g:gruvbox_material_palette = 'original'",
      \   "let g:gruvbox_material_visual = 'green background'",
      \   "let g:gruvbox_material_cursor = 'auto'",
      \   "let g:gruvbox_material_sign_column_background = 'none'",
      \   'colorscheme gruvbox-material',
      \   'source ~/.config/nvim/plug-config/statusline/gruvbox-light.vim',
      \   ]

let g:colorSchemeList['Gruvbox Dark'] = [
      \   'colorscheme gruvbox',
      \   'set background=dark',
      \   "let g:gruvbox_contrast_dark ='hard'",
      \   "let g:gruvbox_sign_column ='bg0'",
      \   "let g:gruvbox_invert_selection =0",
      \   'source ~/.config/nvim/plug-config/statusline/gruvbox-dark-line.vim',
      \   ]

let g:colorSchemeList['Gruvbox Light'] = [
      \   'colorscheme gruvbox',
      \   'set background=light',
      \   "let g:gruvbox_contrast_light ='hard'",
      \   "let g:gruvbox_sign_column ='bg0'",
      \   "let g:gruvbox_invert_selection =0",
      \   'source ~/.config/nvim/plug-config/statusline/gruvbox-light.vim',
      \   ]

      " \    'execute "silent ! kitty @ --to=tcp:localhost:12345 set-colors --all ~/.config/kitty/colors/rigel.conf"'
      " \    'execute "silent ! tmux source-file ~/.tmux/rigel.tmux"'

function SwitchColorScheme(name)
  for l:item in g:colorSchemeList[a:name]
    execute l:item
  endfor
endfunction

function! s:Color(a, l, p)
  return keys(g:colorSchemeList)
endfunction

command! -bar -nargs=? -complete=customlist,<sid>Color SwitchColors call SwitchColorScheme(<f-args>)
" call SwitchColorScheme('Gruvbox Dark')

" Functions
" function SwitchLightlineColorScheme(lightlineName) abort
"   execute join(['source', globpath(&runtimepath, join(['autoload/lightline/colorscheme/', a:lightlineName, '.vim'], ''), 0, 1)[0]], ' ')
"   let g:lightline.colorscheme = a:lightlineName
"   call lightline#init()
"   call lightline#colorscheme()
"   call lightline#update()
" endfunction

