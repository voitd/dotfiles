
" -- Coc -----------------------------------------------------------------------

" coc diagnostic highlight
hi CocErrorHighlight gui=bold guifg=#e06c75
hi CocWarningHighlight gui=NONE guifg=#e5c07b

" Use H to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  " imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call Format()<CR>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

command! -nargs=0 Todos  :CocList -A --normal grep -e TODO|FIXME

" Run jest for current project
command! -nargs=0 Jest :call CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
command! -nargs=0 JestNearest :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-jest',
  \ 'coc-snippets',
  \ 'coc-git', 
  \ 'coc-yaml',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-webpack',
  \ 'coc-scssmodules',
  \ 'coc-explorer',
  \ 'coc-docker',
  \ 'coc-yank',
  \ 'coc-style-helper',
  \ ]
" \ 'coc-spell-checker',

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/stylelint')
  let g:coc_global_extensions += ['coc-stylelintplus']
endif

autocmd FileType javascript,javascriptreact,typescript,typescript.tsx let b:coc_root_patterns =
        \ ['.git', 'package-lock.json', 'yarn.lock']

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" " Fancy Hover:
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction

" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction

" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()
