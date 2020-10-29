
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


" let g:startify_custom_header_time = startify#center([
"       \ '>>> Happy coding @' . $USER . '!',
"       \])

let g:startify_custom_header =
          \ 'startify#center(g:ascii)'

" function s:strt() 
" if has('vim_starting') && has('reltime')
  " let s:startuptime = reltime()
"   return 'startuptime:' . reltimestr(reltime(s:startuptime))
" endif
" endfunction
" if has('vim_starting') && has('reltime')
"   " let s:startuptime = reltime()
"   let g:foot = [ 'startuptime:' . reltimestr(reltime(g:startuptime)) ]
"   let g:startify_custom_footer = 
"           \ 'startify#center(g:foot)'
" endif

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '^/tmp',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'bundle/.*/doc',
      \ ]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:list_commits()
  let git = 'git -C '. getcwd()
  let commits = systemlist(git .' log --oneline | head -n4')
  let git = 'G'. git[1:]
  return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\\\+") }')
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
      \ { 'type': function('s:gitModified'),     'header': ["      Git Modified"]              },
      \ { 'type': function('s:list_commits'),    'header': ["       Commits "]                },
      \ { 'type': 'bookmarks',                   'header': ["      \uf5c2 Bookmarks"]          },
      \ { 'type': 'commands',                    'header': ["      \ufb32 Commands"]           },
      \ { 'type': function('s:pluginInfo'),      'header': ["      漣Plugin loaded " .len(get(g:, 'plugs', 0)).' '], 'indices': ['I','U','C','S'] },
      \ ]

 let g:startify_commands = [
      \ {'h': ['Check Vim health'       , ':checkhealth']},
      \ {'u': ['Update CoC Plugin'      , ':CocUpdate']},
      \ {'m': ['CoC Marketplace'        , ':CocList marketplace']},
      \ ]

let g:startify_bookmarks = [
           \ {'v': '~/.config/nvim/init.vim'},
           \ {'k': '~/.config/kitty/kitty.conf'},
           \ {'f': '~/.config/fish/config.fish'},
           \ {'g': '~/.gitconfig'},
           \ {'a': '~/.aliases'},
           \ {'t': '~/.tmux.conf'},
           \ {'d': '~/dotfiles' },
           \ {'p': '~/CodeHub/playgrounds/playground.js'},
           \ {'c': '~/CodeHub'}
           \ ]

let g:startify_session_sort = 1 " sort sessions by alphabet or modification time
let g:startify_change_to_dir = 1 " when opening a file or bookmark, change to its directory
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


" Hide status line
" autocmd! FileType startify
" autocmd  FileType startify set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

