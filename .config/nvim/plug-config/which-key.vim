" ------- Wich Keys ------------------------------------------------------------
"

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" let g:which_key_display_names = {' ': '', '<CR>': '↵', '<C-H>': '', '<C-I>': 'ﲑ', '<TAB>': '⇆'}
" Single mappings
let g:which_key_map[' '] = [ ':WhichKey'                  , 'Toggle Which Key' ]
let g:which_key_map[','] = [ 'Startify'                   , 'Startify' ]
let g:which_key_map['o'] = [ ':e<Space>**/'               , 'Open file' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'Open init.vim' ]
let g:which_key_map['x'] = [ ':source $MYVIMRC'           , 'Reload init.vim' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'Explorer' ]
let g:which_key_map['z'] = [ ':Goyo'                      , 'Focus mode']
let g:which_key_map['u'] = [ ':UndotreeToggle'            , 'Undo tree' ]
let g:which_key_map['T'] = [ ':Todos'                     , 'Todo' ]
" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+Actions' ,
      \ 'A' : [':norm ggVG'                     , 'Select All'],
      \ 'k' : [':ColorizerToggle'               , 'Colorize'],
      \ 'C' : [':Codi'                          , 'Virtual repl ON'],
      \ 'c' : [':Codi!'                         , 'Virtual repl OFF'],
      \ 'm' : [':MarkdownPreview'               , 'Markdown preview'],
      \ 'M' : [':MarkdownPreviewStop'           , 'Markdown preview stop'],
      \ 'h' : [':let @/ = ""'                   , 'Remove current search highlight'],
      \ 'H' : [':set nohlsearch'                , 'Set no search highlight'],
      \ 'n' : [':set nonumber!'                 , 'Line-numbers'],
      \ 'r' : [':set norelativenumber!'         , 'Relative line nums'],
      \ 'z' : [':set wrap!'                     , 'Word wrap'],      
      \ 'f' : ['<Plug>(coc-fix-current)'        , 'Fix line'],      
      \ 'q' : [':call QuickFix_toggle()<CR>'    , 'QuickFix Menu'],      
      \ 't' : [':SwitchColors '                  , 'Theme switch']
      \ }

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+Buffer' ,
      \ 'd' : ['bd'                                    , 'Delete buffer'  ],
      \ 'n' : ['bnext'                                 , 'Next buffer'    ],
      \ 'p' : ['bprevious'                             , 'Previous buffer'],
      \ 'b' : ['Buffers'                               , 'Buffers'   ],
      \ 'l' : [''                                      , 'List buffers'   ],
      \ 'o' : [':w <bar> %bd <bar> e# <bar> bd# <CR>'  , 'Only one buffer'],
      \ }
" g is for git
let g:which_key_map.g = {
      \ 'name' : '+Git' ,
      \ 'A' : [':Git add .'                        , 'Add All'],
      \ 'a' : [':Git add %'                        , 'Add Current'],
      \ 'm' : [':Git amend'                        , 'Ammend commit'],
      \ 's' : [':Gstatus'                          , 'Status'],
      \ 'c' : [':Gcommit'                          , 'Commit'],
      \ 'b' : [':GCheckout'                        , 'Checkout'],
      \ 'p' : [':Git push'                         , 'Push'],
      \ 'f' : [':Git pull'                         , 'Pull/Fetch'],
      \ 'd' : [':Gdiffsplit!'                      , 'Diff Split conflict'],
      \ 'B' : [':Git blame'                        , 'Blame'],
      \ 'l' : [':GV'                               , 'Commits Log'],
      \ 'o' : [':GBrowse'                          , 'Open in Browser'],
      \ '>' : [':diffget //2'                      , 'Left diffs'],
      \ '<' : [':diffget //3'                      , 'Right diffs'],
      \ 'w' : [':Gwrite'                           , 'Save diffs'],
      \ 'W' : [':FloatermSend gwip'                , 'Commit a work-in-progress branch'],
      \ 'U' : [':FloatermSend gunwip'              , 'Uncommit a work-in-progress branch'],
      \ 'V' : [':GV!'                              , 'View Buffer Commits'],     
      \ 't' : [':CocCommand git.toggleGutters'     , 'Toggle Gutters'],     
      \ }

      " \ 'po': [':normal! :FloaterSend git push origin $(git branch | grep "\*" | sed s:^..::g )<cr>'     , 'Push into origin'],     
" c is for lsp
let g:which_key_map.c = {
			\ 'name' : '+Coc-Commands' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'e' : [':CocList extensions'                 , 'extensions list'],
      \ 'd' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'n' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'f' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'S' : [':CocList -I symbols'                 , 'references'],
      \ 's' : [':CocList snippets'                   , 'snippets'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ 'x' : [':CocRestart'                         , 'restart CoC'],
      \ 'y' : [':CocList -A --normal yank'           , 'Yank List'],
      \ 'Y' : [':CocCommand yank.clean'              , 'Clear Yank List'],
      \ }

" j is for jumps
let g:which_key_map.j = {
      \ 'name' : '+JumpTo' ,
      \ 'd' : ['<Plug>(coc-definition)'              , 'Definition'],
      \ 'c' : ['<Plug>(coc-declaration)'             , 'Declaration'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'Implementation'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'Type definition'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'Open link'],
      \ 'r' : ['<Plug>(coc-references)'              , 'References'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'Prev diagnostic'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'Next diagnostic'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'd' : [':Definition'                         , 'definition'],
      \ 'D' : [':Declaration'                        , 'declaration'],
      \ 'F' : [':Format'                             , 'format'],
      \ 'h' : [':Hover'                              , 'hover'],
      \ 'i' : [':Implementation'                     , 'implementation'],
      \ 'l' : [':NextDiagnostic'                     , 'next diagnostic'],
      \ 'L' : [':PrevDiagnostic'                     , 'prev diagnostic'],
      \ 'I' : [':OpenDiagnostic'                     , 'diagnostics'],
      \ 'r' : [':References'                         , 'references'],
      \ 's' : [':DocumentSymbol'                     , 'document symbols'],
      \ 'S' : [':WorkspaceSymbol'                    , 'workspace symbols'],
      \ 't' : [':TypeDefinition'                     , 'type definition'],
      \ }
" s is for search
let g:which_key_map.s = {
      \ 'name' : '+Search' ,
      \ '/' : [':History/'              , 'History'],
      \ ';' : [':Commands'              , 'Commands'],
      \ 'o' : [':CocSearch <C-R>=expand("<cword>")<CR><CR>'                    , 'All buffer search'],
      \ 'b' : [':BLines'                , 'Current buffer'],
      \ 'B' : [':Buffers'               , 'Open buffers'],
      \ 'c' : [':Commits'               , 'Commits'],
      \ 'C' : [':BCommits'              , 'Buffer commits'],
      \ 'f' : [':Files'                 , 'Files'],
      \ 'g' : [':GFiles'                , 'Git files'],
      \ 'G' : [':GFiles?'               , 'Modified git files'],
      \ 'h' : [':History'               , 'File history'],
      \ 'H' : [':History:'              , 'Command history'],
      \ 'l' : [':Lines'                 , 'Lines'] ,
      \ 'm' : [':Marks'                 , 'Marks'] ,
      \ 'M' : [':Maps'                  , 'Binding maps'] ,
      \ 'p' : [':Helptags'              , 'Help tags'] ,
      \ 'T' : [':Tags'                  , 'Project tags'],
      \ 'S' : [':CocList snippets'      , 'Snippets'],
      \ 's' : [':Colors'                , 'Color schemes'],
      \ 't' : [':Rg'                    , 'Text Rg'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+Terminal' ,
      \ 'j' : [':FloatermNew --wintype=popup --height=10'       , 'Terminal in Bottom'],
      \ 't' : [':FloatermToggle '                               , 'Toggle'],
      \ 'n' : [':FloatermNew'                                   , 'New'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'g' : [':FloatermNew lazygit'                           , 'lazygit'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'lazydocker'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'lazynpm'],
      \ 'o' : [':FloatermNew node'                              , 'node'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'l' : [':FloatermList'                                  , 'Show List Terminals'],
      \ }

let g:which_key_map.J = {
      \ 'name' : '+Jest' ,
      \ 'c' : [':JestNearest'                          , 'Test nearest to the cursor'],
      \ 'f' : [':JestCurrent'                          , 'Runs all tests in the current file'],
      \ 'r' : [':Jest'                                 , 'Runs Jest'],
      \ 'i' : [':JestInit'                             , 'Init Jest'],
      \ }

let g:which_key_map.w = {
			\ 'name' : '+Window' ,
			\ '|' : ['<C-u>split<CR>'            , 'Vertical split'],
			\ '_' : ['<C-u>vsplit<CR>'           , 'Horizontal split'],
			\ 'b' : ['<C-W>='                    , 'Balance windows'],
			\ '+' : [':(winheight(0) * 3/2)<CR>', 'Resize +'],  
			\ '-' : [':exe "vertical resize " . (winheight(0) * 2/3)<CR>', 'Resize -'], 
      \ 'h' : ['<c-w>_'                    , 'max height'],
    	\ 'w' : ['<c-w>|'                    , 'max width'],
      \ }

let g:which_key_map.S = {
			\ 'name' : '+Session' ,
			\ 's' : [':SSave'           , 'Save Session'],
			\ 'l' : [':SLoad'           , 'Load Session'],
			\ 'd' : [':SDelete'         , 'Delete Session'],
			\ 'c' : [':SClose'          , 'Close Session'],
      \ }

let g:which_key_map.i = {
			\ 'name' : '+Import Fixes' ,
			\ 'f' : [':ImportJSFix'     , 'Fix all imports'],
			\ 'w' : [':ImportJSWord'    , 'Add imports under the cursor.'],
			\ 'g' : [':ImportJSGoto'         , 'Go to the module under the cursor'],
      \ 'o' : [':OR'              , 'Organize imports'],
      \ }

let g:which_key_map.m = {
			\ 'name' : '+Mark' ,
			\ 't' : [':CocCommand bookmark.toggle'               , 'Toggle'],
			\ 'a' : [':CocCommand bookmark.annotate'             , 'Named mark'],
			\ 'n' : [':CocCommand bookmark.next'                 , 'Next'],
			\ 'p' : [':CocCommand bookmark.prev'                 , 'Prev'],
      \ 'l' : [':CocList bookmark<CR>'                     , 'List marks'],
			\ 'd' : [':delmarks!<CR>:delmarks A-Z0-9<CR>'        , 'Del native marks'],
			\ 'c' : [':CocCommand bookmark.clearForCurrentFile'  , 'Clear buffer marks'],
			\ 'C' : [':CocCommand bookmark.clearForAllFile'      , 'Clear all buffer marks'],
      \ }

" let g:which_key_map.w = {
" 			\ 'name' : '+Workspace' ,
" 			\ 'b' : [':CtrlSpace'                    , 'Buffer List'],
" 			\ 'n' : [':CtrlSpaceNewWorkspace'        , 'New Workspace'],
" 			\ 's' : [':CtrlSpaceSaveWorkspace'       , 'Save Workspace'],
" 			\ 'l' : [':CtrlSpaceLoadWorkspace'       , 'Load Workspace'],
" 			\ 'a' : [':CtrlSpaceAddProjectRoot'      , 'Add Project Root'],
" 			\ 'r' : [':CtrlSpaceRemoveProjectRoot'   , 'Remove Project Root'],
"       \ }

" let g:which_key_map.z = {
" 			\ 'name' : '+ZenMode' ,
" 			\ 'l' : [':Limelight!! .8'     , 'Focus Mode '],
" 			\ 'z' : [':Goyo'               , 'Exit Zen Mode '],
"      \ }

" let g:which_key_map.w = {
"       \ 'name' : '+Wiki' ,
"       \ 'w' : [':VimwikiIndex'                             , 'Title'],
"       \ 'n' : ['<plug>(wiki-open)'                              , 'Open'],
"       \ 'j' : ['<plug>(wiki-journal)'                           , 'Journal'],
"       \ 'R' : ['<plug>(wiki-reload)'                            , 'Restart'],
"       \ 'c' : ['<plug>(wiki-code-run)'                          , 'Run Code'],
"       \ 'b' : ['<plug>(wiki-graph-find-backlinks)'              , 'graph find backlinks'],
"       \ 'g' : ['<plug>(wiki-graph-in)'                          , 'in'],
"       \ 'G' : ['<plug>(wiki-graph-out)'                         , 'out'],
"       \ 'l' : ['<plug>(wiki-link-toggle)'                       , 'Toggle Link'],
"       \ 'd' : ['<plug>(wiki-page-delete)'                       , 'Delete'],
"       \ 'r' : ['<plug>(wiki-page-rename)'                       , 'Rename'],
"       \ 't' : ['<plug>(wiki-page-toc)'                          , 'Toc'],
"       \ 'T' : ['<plug>(wiki-page-toc-local)'                    , 'Toc-local'],
"       \ 'e' : ['<plug>(wiki-export)'                            , 'Export'],
"       \ 'u' : ['<plug>(wiki-list-uniq)'                         , 'List Uniq'],
"       \ 'U' : ['<plug>(wiki-list-uniq-local)'                   , 'List Uniq Local'],
"       \ 'h' : [':Vimwiki2HTML'                                  , 'Convert to HTML'],
"       \ 'H' : [':VimwikiAll2HTML'                               , 'Convert ALL to HTML'],
"       \ 'C' : [':help vimwiki-commands'                         , 'Commands help'],
"       \ 'W' : [':help vimwiki'                                  , 'Help'],
"       \ }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

