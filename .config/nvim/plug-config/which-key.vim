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

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

"{{{ Main mapinng

let g:which_key_display_names = {' ': '', '<CR>': '↵', '<C-H>': '', '<C-I>': 'ﲑ', '<TAB>': '⇆'}
" Single mappings
let g:which_key_map[' '] = [ ':WhichKey'                  , 'Toggle Which Key' ]
let g:which_key_map[','] = [ 'Startify'                   , 'Startify' ]
let g:which_key_map['r'] = [ ':SourceThis'                , 'Source file' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC'                , 'Open init.vim' ]
let g:which_key_map['x'] = [ ':source $MYVIMRC | echom "Reloaded $NVIMRC" | redraw! | silent doautocmd ColorScheme |' , 'Reload init.vim' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'Explorer' ]
let g:which_key_map['z'] = [ ':Goyo'                      , 'Focus mode']
let g:which_key_map['u'] = [ ':UndotreeToggle'            , 'Undo tree' ]
let g:which_key_map['T'] = [ ':Todos'                     , 'Show TODO marks' ]

"}}}

"{{{ Actions
let g:which_key_map.a = {
      \ 'name' : '+Actions' ,
      \ 'A' : [':norm ggVG'                     , 'Select All'],
      \ 'H' : [':let @/ = ""'                   , 'Remove current search highlight'],
      \ 'h' : [':set nohlsearch'                , 'Set no search highlight'],
      \ 'n' : [':set nonumber!'                 , 'Line-numbers'],
      \ 'r' : [':set norelativenumber!'         , 'Relative line nums'],
      \ 'w' : [':set wrap!'                     , 'Word wrap'],
      \ 'f' : ['<Plug>(coc-fix-current)'        , 'Fix line'],
      \ 's' : [':FixWhitespace'                 , 'QuickFix whitespaces '],
      \ }
"}}}

" {{{ Buffers
let g:which_key_map.b = {
      \ 'name' : '+Buffer' ,
      \ 'd' : ['bd'                                    , 'Delete buffer'  ],
      \ 'n' : ['bnext'                                 , 'Next buffer'    ],
      \ 'p' : ['bprevious'                             , 'Previous buffer'],
      \ 'b' : ['Buffers'                               , 'Buffers'   ],
      \ 'o' : [''                                      , 'Only one buffer'],
      \ }

"}}}

" {{{ Git
let g:which_key_map.g = {
      \ 'name' : '+Git' ,
      \ 'A' : [':Git add .'                        , 'Add All'],
      \ 'a' : [':Git add %'                        , 'Add Current'],
      \ 's' : [':Gstatus'                          , 'Status'],
      \ 'c' : [':Gcommit'                          , 'Commit'],
      \ 'b' : [':GCheckout'                        , 'Checkout'],
      \ 'p' : [':Git push'                         , 'Push'],
      \ 'f' : [':Git pull'                         , 'Pull/Fetch'],
      \ 'l' : [':GV'                               , 'Commits Log'],
      \ 'o' : [':GBrowse'                          , 'Open in Browser'],
      \ 'w' : [':Gwrite'                           , 'Save'],
      \ 'V' : [':GV!'                              , 'View Buffer Commits'],
      \ 'k' : {
          \ 'name' : '+GitCommands' ,
          \ 'm' : [':Git respond'                      , 'Ammend commit'],
          \ 'S' : [':Git save'                         , 'SAVEPOINT commit'],
          \ 'W' : [':Git wipe'                         , 'Wipe SAVEPOINT commit'],
          \ 'b' : [':Git blame'                        , 'Blame'],
          \ 'w' : [':Git gwip'                , 'Commit a work-in-progress(WIP) branch'],
          \ 'u' : [':Git gunwip'              , 'Uncommit a work-in-progress(WIP) branch'],
          \ 't' : [':CocCommand git.toggleGutters'     , 'Toggle Gutters'],
          \ },
      \ 'h' : {
          \ 'name' : '+GitGutterHunks' ,
          \ 't' : [':GitGutterLineHighlightsToggle'    , 'Toggle highlight hunks'],
          \ 'h' : ['<Plug>(GitGutterPreviewHunk)'      , 'Preview hunk'],
          \ 'n' : ['<Plug>(GitGutterNextHunk)'         , 'Next hunk'],
          \ 'p' : ['<Plug>(GitGutterPrevHunk)'         , 'Prev hunk'],
          \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'Stage hunk'],
          \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'Undo hunk'],
          \ },
      \ 'd' : {
          \ 'name' : '+GitDiffs' ,
          \ 's' : [':Gdiffsplit!'                      , 'Diff Split conflict'],
          \ 'h' : [':diffget //2'                      , 'Left diffs'],
          \ 'l' : [':diffget //3'                      , 'Right diffs'],
          \ 'n' : [']c'                                , 'Next hunks'],
          \ 'p' : ['[c'                                , 'Prev hunks'],
          \ }
      \ }

"}}}

" {{{ CoC
let g:which_key_map.c = {
			\ 'name' : '+Coc-Commands' ,
      \ '.' : [':CocConfig'                          , 'Config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'Refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'Line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'Selected action'],
      \ 'b' : [':CocNext'                            , 'Next action'],
      \ 'B' : [':CocPrev'                            , 'Prev action'],
      \ 'c' : [':CocList commands'                   , 'Commands'],
      \ 'L' : [':CocFzfList'                         , 'List Fzf commands'],
      \ 'e' : [':CocList extensions'                 , 'Extensions list'],
      \ 'd' : [':CocList diagnostics'                , 'Diagnostics'],
      \ 'n' : ['<Plug>(coc-diagnostic-next-error)'   , 'Next error'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev-error)'   , 'Prev error'],
      \ 'f' : ['<Plug>(coc-fix-current)'             , 'Quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'Rename'],
      \ 'S' : [':CocList -I symbols'                 , 'References'],
      \ 's' : [':CocList snippets'                   , 'Snippets'],
      \ 'u' : [':CocListResume'                      , 'Resume list'],
      \ 'x' : [':CocRestart'                         , 'Restart CoC'],
      \ 'y' : [':CocList -A --normal yank'           , 'Yank List'],
      \ 'Y' : [':CocCommand yank.clean'              , 'Clear Yank List'],
      \ }

"}}}

" {{{ Jumps
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

"}}}

" {{{ Search

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
"}}}

" {{{ Terminal
let g:which_key_map.T = {
      \ 'name' : '+Terminal' ,
      \ 'j' : [':FloatermNew --wintype=popup --height=10'       , 'Terminal in Bottom'],
      \ 'n' : [':FloatermNew'                                   , 'New'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 'g' : [':FloatermNew lazygit'                           , 'lazygit'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'lazydocker'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'lazynpm'],
      \ 'o' : [':FloatermNew node'                              , 'node'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 'l' : [':FloatermList'                                  , 'Show List Terminals'],
      \ }

"}}}

" {{{ Jest
let g:which_key_map.J = {
      \ 'name' : '+Jest' ,
      \ 'c' : [':JestNearest'                          , 'Test nearest to the cursor'],
      \ 'f' : [':JestCurrent'                          , 'Runs all tests in the current file'],
      \ 'r' : [':Jest'                                 , 'Runs Jest'],
      \ 'i' : [':JestInit'                             , 'Init Jest'],
      \ }

"}}}

" {{{ Windows
let g:which_key_map.w = {
      \ 'name' : '+Windows'                        ,
      \ 'w'    : ['<C-w>w'                         , 'Next window']           ,
      \ 'q'    : ['<C-w>q'                         , 'Quit window']           ,
      \ '-'    : ['<C-w>s'                         , 'Split horizotal']       ,
      \ '|'    : ['<C-w>v'                         , 'Split vertical']        ,
      \ '2'    : ['<C-w>v'                         , 'Duplicate in splits']   ,
      \ 'H'    : ['<C-w>5<'                        , 'Resize left']           ,
      \ 'J'    : ['resize -5'                      , 'Resize below']          ,
      \ 'L'    : ['<C-w>5>'                        , 'Resize right']          ,
      \ 'K'    : ['resize +5'                      , 'Resize up']             ,
      \ '='    : ['<C-w>='                         , 'Balance window']        ,
      \ 'x'    : ['<C-w>x'                         , 'Flip windows']          ,
      \ 'f'    : ['<C-w>t<C-w>H'                   , 'Flip horiz-to-vert']    ,
      \ 'F'    : ['<C-w>t<C-w>K'                   , 'Flip vert-to-horiz']    ,
      \ 'W'    : ['Windows'                        , 'Fzf window']            ,
      \ }

"}}}

" {{{ Sesions
let g:which_key_map.S = {
			\ 'name' : '+Sessions' ,
			\ 's' : [':SSave'           , 'Save Session'],
			\ 'l' : [':SLoad'           , 'Load Session'],
			\ 'd' : [':SDelete'         , 'Delete Session'],
			\ 'c' : [':SClose'          , 'Close Session'],
      \ }

"}}}

" {{{ Togglers
let g:which_key_map.t = {
			\ 'name' : '+Toogle' ,
      \ 't' : [':FloatermToggle '               , 'Terminal'],
			\ 'i' : [':IndentLinesToggle'             , 'Indentline'],
			\ 's' : [':LeadingSpaceToggle'            , 'Leading space'],
      \ 'c' : [':ColorizerToggle'               , 'Show Colors'],
      \ 'b' : [':RainbowToggle'                 , 'Color Brackets'],
      \ 'r' : [':Codi!!'                        , 'Virtual REPL'],
      \ 'm' : ['<Plug>MarkdownPreviewToggle'    , 'Markdown preview'],
      \ }

"}}}

" {{{ Imports
let g:which_key_map.i = {
			\ 'name' : '+ImportFixes' ,
			\ 'f' : [':ImportJSFix'     , 'Fix all imports'],
			\ 'w' : [':ImportJSWord'    , 'Add imports under the cursor.'],
			\ 'g' : [':ImportJSGoto'    , 'Go to the module under the cursor'],
      \ 'o' : [':OR'              , 'Organize imports'],
      \ }

"}}}

" {{{  Marks
let g:which_key_map.m = {
			\ 'name' : '+Mark' ,
			\ 'm' : [':CocCommand bookmark.toggle'               , 'New/Toggle mark'],
			\ 'a' : [':CocCommand bookmark.annotate'             , 'Named mark'],
			\ 'n' : [':CocCommand bookmark.next'                 , 'Next'],
			\ 'p' : [':CocCommand bookmark.prev'                 , 'Prev'],
      \ 'l' : [':CocList bookmark'                         , 'List CoC marks'],
      \ 'L' : [':NativeMarks<CR>'                              , 'List native marks'],
			\ 'd' : [':delmarks!<CR>:delmarks A-Z0-9<CR>'        , 'Del native marks'],
			\ 'c' : [':CocCommand bookmark.clearForCurrentFile'  , 'Clear buffer marks'],
			\ 'C' : [':CocCommand bookmark.clearForAllFile'      , 'Clear all buffer marks'],
      \ }
"}}}

" {{{  Graveyard


      " \ 'po': [':normal! :FloaterSend git push origin $(git branch | grep "\*" | sed s:^..::g )<cr>'     , 'Push into origin'],

" let g:which_key_map.w = {
" 			\ 'name' : '+Window' ,
" 			\ '|' : ['<C-u>split<CR>'            , 'Vertical split'],
" 			\ '_' : ['<C-u>vsplit<CR>'           , 'Horizontal split'],
" 			\ 'b' : ['<C-W>='                    , 'Balance windows'],
" 			\ '+' : ['resize +5', 'Resize +'],
" 			\ '-' : ['resize -5', 'Resize -'],
"       \ 'h' : ['<c-w>_'                    , 'max height'],
"     	\ 'w' : ['<c-w>|'                    , 'max width'],
"       \ }


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

"}}}


" vim: fdm=marker
