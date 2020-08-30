
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


" let g:startify_custom_header_time = startify#pad([
"       \ '>>> Happy coding @' . $USER . '!',
"       \])
let g:startify_custom_header =
          \ 'startify#center(g:ascii)'

" let g:startify_custom_footer =
"           \ 'startify#pad(g:loaded)'

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

 function s:pluginInfo()
    return [
          \ { 'line': 'Install Plugins', 'cmd': ':PlugInstall'},
          \ { 'line': 'Upgrade Plugins', 'cmd': ':PlugUpdate' },
          \ { 'line': 'Clean Plugins'  , 'cmd': ':PlugClean' },
          \ { 'line': 'Status Plugins' , 'cmd': ':PlugStatus' },
          \ ]
  endfunction

  let g:startify_lists = [
        \ { 'type': 'sessions',                    'header': ["      \ue62e Sessions"]           },
        \ { 'type': 'files',                       'header': ["      \ufa1e Files"]              },
        \ { 'type': 'dir',                         'header': ["      \ufa1e MRU in ". getcwd()]  },
        \ { 'type': function('s:list_commits'),    'header': ["       Commits "]                },
        \ { 'type': 'bookmarks',                   'header': ["      \uf5c2 Bookmarks"]          },
        \ { 'type': 'commands',                    'header': ["      \ufb32 Commands"]           },
        \ { 'type': function('s:pluginInfo'),      'header': ["      漣Plugin loaded " .len(get(g:, 'plugs', 0)).' '], 'indices': ['I','U','C','S'] },
        \ ]

   let g:startify_commands = [
        \ {'h': ['Check health'       , ':checkhealth']},
        \ {'u': ['Update CoC Plugin'  , ':CocUpdate']},
        \ {'m': ['Marketplace'        , ':CocList marketplace']},
        \ ]

let g:startify_bookmarks = [
           \ {'v': '~/.config/nvim/init.vim'},
           \ {'t': '.tmux.conf'},
           \ {'k': '~/.config/kitty/kitty.conf'},
           \ {'f': '~/.config/fish/config.fish'},
           \ {'d': '~/dotfiles' },
           \ {'c': '~/CodeHub'}
           \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 5
let g:webdevicons_enable_startify = 1
let g:startify_enable_special = 1
let g:startify_files_number = 5
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1
" let g:startify_enable_unsafe = 0

hi! link StartifyHeader Function 
hi! link StartifyFile Directory
hi! link StartifyPath LineNr
hi! link StartifySlash StartifyPath
hi! link StartifyBracket StartifyPath
hi! link StartifyNumber StartifyPath

autocmd User Startified setlocal cursorline

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

