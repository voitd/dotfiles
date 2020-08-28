
"------------ Startify --------------------------------------------------------------
"

let g:ascii = [
  \'                                                                  ',                                                               
  \'                                                                  ',                                                               
  \'                                                                  ',                                                               
  \'                                                                  ',                                                               
  \'                                                                  ',                                                              
  \'  _|      _|  _|_|_|_|    _|_|    _|      _|  _|_|_|  _|      _|  ',
  \'  _|_|    _|  _|        _|    _|  _|      _|    _|    _|_|  _|_|  ',
  \'  _|  _|  _|  _|_|_|    _|    _|  _|      _|    _|    _|  _|  _|  ',
  \'  _|    _|_|  _|        _|    _|    _|  _|      _|    _|      _|  ',
  \'  _|      _|  _|_|_|_|    _|_|        _|      _|_|_|  _|      _|  ',
  \'                                                                  ',                                                              
  \'                                                                  ',                                                               
  \'                                                                  ',                                                               
  \'                                                                  ',                                                               
  \'                                                                  ',                                                             
\]

let g:startify_custom_header =
          \ 'startify#center(g:ascii )'

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '^/tmp',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'bundle/.*/doc',
      \ ]


  function! s:list_commits()
    let git = 'git -C '. getcwd()
    let commits = systemlist(git .' log --oneline | head -n4')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
  endfunction

  let g:startify_lists = [
        \ { 'type': 'sessions',                    'header': ["      \ue62e Sessions"]           },
        \ { 'type': 'files',                       'header': ["      \ufa1e Files"]              },
        \ { 'type': 'dir',                         'header': ["      \ufa1e MRU in ". getcwd()]  },
        \ { 'type': function('s:list_commits'),    'header': ["       Commits "]                },
        \ { 'type': 'bookmarks',                   'header': ["      \uf5c2 Bookmarks"]          },
        \ { 'type': 'commands',                    'header': ["      \ufb32 Commands"]           },
        \ ]



let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 5
let g:webdevicons_enable_startify = 1
let g:startify_enable_special = 1
let g:startify_files_number = 5

hi! link StartifyHeader Normal
hi! link StartifyFile Directory
hi! link StartifyPath LineNr
hi! link StartifySlash StartifyPath
hi! link StartifyBracket StartifyPath
hi! link StartifyNumber Title

autocmd User Startified setlocal cursorline

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction


 let g:startify_commands = [
        \ {'h': ['Check health',':checkhealth']},
        \ {'i': ['Install Plugin', ':PlugInstall']},
        \ {'c': ['Unistall Plugin', ':PlugClean']},
        \ {'u': ['Update Plugin', ':PlugUpdate | PlugUpgrade | CocUpdate']},
        \ {'s': ['Plugins status', ':PlugStatus']},
        \ {'m': ['Marketplace', ':CocList marketplace']},
        \ ]

let g:startify_bookmarks = [
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'd': '~/.dotfiles' },
            \ { 't': '~/.tmux.conf'},
            \ '~/.config/nvim/plug-config',
            \ '~/.config/kitty/',
            \ '~/CodeHub',
            \ ]


