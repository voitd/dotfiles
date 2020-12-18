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

" {{{ Main mapinng

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

"}}}

" {{{ Actions
let g:which_key_map.a = {
      \ 'name' : '+Actions' ,
      \ 'A' : [':norm ggVG'                     , 'Select All'],
      \ 'H' : [':let @/ = ""'                   , 'Remove current search highlight'],
      \ 'h' : [':set nohlsearch'                , 'Set no search highlight'],
      \ 'w' : [':set wrap!'                     , 'Word wrap'],
      \ 'W' : [':FixWhitespace'                 , 'QuickFix whitespaces '],
      \ 'r' : [''                               , 'Search under cursor'],
      \ ',' : [':CtrlColumn'                    , 'Insert coma EOL'],
      \ ';' : [':CtrlSemicolumn'                , 'Insert semicolon EOL'],
      \ 'u' : [':SwitchCase'                    , 'Switch Case'],
      \ 'F' : [':SpellFix'                      , 'Fix Spell'],
      \ 's' : ['::CarbonNowSh'                      , 'Screenshot Carbon.now'],
      \ '"' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround ""'],
      \ '(' : [':s/\%V\(.*\)\%V/(\1)/'   , 'surround ()'],
      \ '{' : [':s/\%V\(.*\)\%V/{\1}/'   , 'surround {}'],
      \ '[' : [':s/\%V\(.*\)\%V/[\1]/'   , 'surround ""'],
      \ 'c' : [':ConsoleFromReg'                , 'console.log yanked'],
      \ 'm' : [':MakeTags'                      , 'Make Tags'],
      \ }
"}}}

" {{{ Buffers
let g:which_key_map.b = {
      \ 'name' : '+Buffer' ,
      \ 'd' : [''                                    , 'Delete buffer'  ],
      \ 'n' : ['bnext'                                 , 'Next buffer'    ],
      \ 'p' : ['bprevious'                             , 'Previous buffer'],
      \ 'b' : ['Buffers'                               , 'Buffers'   ],
      \ 'o' : [''                                      , 'Only one buffer'],
      \ 's' : [':BLines'                , 'Search in buffer'],
      \ 't' : [':BTags'                , 'Tags in buffer'],
      \ 'c' : [':BCommits'              , 'Buffer commits'],
      \ }

"}}}

" {{{ Git
let g:which_key_map.g = {
      \ 'name' : '+Git' ,
      \ 'A' : [':Git add .'                        , 'Add All'],
      \ 'a' : [':Git add %'                        , 'Add Current'],
      \ 's' : [':Gstatus'                          , 'Status'],
      \ '.' : [':Magit'                          , 'Magit'],
      \ 'c' : [':Gcommit'                          , 'Commit'],
      \ 'b' : [':GCheckout'                        , 'Checkout'],
      \ 'p' : [':Git push'                         , 'Push'],
      \ 'f' : [':Git pull'                         , 'Pull/Fetch'],
      \ 'l' : [':GV'                               , 'Commits Log'],
      \ 'm' : [':GitMessager'                      , 'Commit messager'],
      \ 'o' : [':GBrowse'                          , 'Open in Browser'],
      \ 'w' : [':Gwrite'                           , 'Save'],
      \ 'V' : [':GV!'                              , 'View Buffer Commits'],
      \ 'k' : {
          \ 'name' : '+GitCommands' ,
          \ 'm' : [':Git amend'                        , 'Amend commit'],
          \ 'S' : [':Git save'                         , 'SAVEPOINT commit'],
          \ 'u' : [':Git undo'                         , 'Undo last commit'],
          \ 'b' : [':Git blame'                        , 'Blame'],
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
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'Action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'Selected action'],
      \ 'c' : [':CocList commands'                   , 'Commands'],
      \ 'e' : [':CocList extensions'                 , 'Extensions list'],
      \ 'd' : [':CocList diagnostics'                 , 'Diagnostics for buffer'],
      \ 'j' : ['<Plug>(coc-diagnostic-next-error)'   , 'Next error'],
      \ 'k' : ['<Plug>(coc-diagnostic-prev-error)'   , 'Prev error'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'Fix line'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'Rename'],
      \ 's' : [':CocList -I symbols'                 , 'Search references'],
      \ 'S' : [':CocList snippets'                   , 'Snippets'],
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
      \ 'l' : [':CocCommand fzf-preview.Jumps'       , 'Jumps List'],
      \ 's': ['', 'Open in vertical split'],
      \ 'sh': ['', 'Open in horizotal split']
      \ }

"}}}

" {{{ Search

let g:which_key_map.s = {
      \ 'name' : '+Search' ,
      \ '/' : [':History/'              , 'History'],
      \ ';' : [':Commands'              , 'Commands'],
      \ 'b' : [':BLines'                , 'Current buffer'],
      \ 'c' : [':Commits'               , 'Commits'],
      \ 'f' : [':Files'                 , 'Files'],
      \ 'g' : [':GFiles'                , 'Git files'],
      \ 'G' : [':GFiles?'               , 'Modified git files'],
      \ 'h' : [':History'               , 'File history'],
      \ 'H' : [':History:'              , 'Command history'],
      \ 'l' : [':Lines'                 , 'Lines'] ,
      \ 'm' : [''                       , 'Git Lens'] ,
      \ 'M' : [':Maps'                  , 'Binding maps'] ,
      \ 'P' : [':Helptags'              , 'Help tags'] ,
      \ 'T' : [':Tags'                  , 'Project tags'],
      \ 'S' : [':CocList snippets'      , 'Snippets'],
      \ 'w' : [':call SearchVisual()<CR>'                , 'Rg word'],
      \ 'v' : [':call SearchWord()<CR>'                , 'Rg visual selected'],
      \ 't' : [':Rg'                    , 'Text Rg'],
      \ }
"}}}

" {{{ Terminal
let g:which_key_map.T = {
      \ 'name' : '+Terminal' ,
      \ 'J' : [':FloatermNew --wintype=normal --height=15'      , 'Terminal in Bottom'],
      \ 'N' : [':FloatermNew'                                   , 'New'],
      \ 'L' : [':FloatermList'                                  , 'List terms'],
      \ 'T' : [':FloatermToggle '                               , 'Terminal'],
      \ }

"}}}

" {{{ Jest
let g:which_key_map.J = {
      \ 'name' : '+Jest' ,
      \ 'C' : [':JestNearest'                          , 'Jest nearest to the cursor'],
      \ 'F' : [':JestCurrent'                          , 'Runs all tests in the current file'],
      \ 'J' : [':Jest'                                 , 'Runs Jest'],
      \ 'I' : [':JestInit'                             , 'Init Jest'],
      \ }

      "\ 'T' : [':TestFile'                             , 'Test current file'],   
      "\ 'O' : [':TestVisit'                            , 'Open test file'],   
      "\ 'A' : [':TestSuite'                            , 'All test'],   
      "\ 'c' : [':TestNearest'                          , 'Test nearest to the cursor'],
""}}}

" {{{ Windows
let g:which_key_map.w = {
      \ 'name' : '+Windows'                        ,
      \ 'n'    : ['<C-w>w'                         , 'Next window']           ,
      \ 'q'    : ['<C-w>q'                         , 'Quit window']           ,
      \ '-'    : ['<C-w>s'                         , 'Split horizotal']       ,
      \ '\'    : ['<C-w>v'                         , 'Split vertical']        ,
      \ 'd'    : ['<C-w>v'                         , 'Duplicate in splits']   ,
      \ '='    : ['<C-w>='                         , 'Balance window']        ,
      \ 's'    : ['<C-w>x'                         , 'Swap windows']          ,
      \ 'f'    : ['<C-w>H'                   , 'Flip horiz-to-vert']    ,
      \ 'F'    : ['<C-w>K'                   , 'Flip vert-to-horiz']    ,
      \ 'w'    : ['Windows'                        , 'Fzf window']            ,
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

" {{{ Toggle
let g:which_key_map.t = {
			\ 'name' : '+Toogle' ,
      \ 't' : [':FloatermToggle '               , 'Terminal'],
      \ 'T' : [':ToggleTabline'                 , 'Tabline'],
			\ 'i' : [':IndentLinesToggle'             , 'Indentline'],
			\ 's' : [':LeadingSpaceToggle'            , 'Leading space'],
      \ 'c' : [':ColorizerToggle'               , 'Show Colors'],
      \ 'b' : [':RainbowToggle'                 , 'Color Brackets'],
      \ 'g' : [':ToggleGitBlame'                , 'Git Blame'],
      \ 'r' : [':Codi'                          , 'ON Virtual REPL'],
      \ 'R' : [':Codi!'                         , 'OFF Virtual REPL'],
      \ 'S' : [':ToggleSpell'                   , 'Spell word'],
      \ 'm' : ['<Plug>MarkdownPreviewToggle'    , 'Markdown preview'],
      \ 'G' : [':CocCommand git.toggleGutters'  , 'Git Gutters'],
      \ }

"}}}

" {{{ Open
let g:which_key_map.o = {
			\ 'name' : '+Open' ,
      \ 'f' : [''                                               , 'File'],
      \ 'T' : [''                                               , 'Tab by file'],
      \ 'v' : [':Vista!!'                                       , 'Vista'],
      \ 'y' : [':FloatermNew ytop'                              , 'Ytop'],
      \ 'g' : [':FloatermNew lazygit'                           , 'Lazygit'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'Lazydocker'],
      \ 'm' : [':FloatermNew lazynpm'                           , 'Lazynpm'],
      \ 'n' : [':FloatermNew node'                              , 'Node'],
      \ 'r' : [':FloatermNew ranger'                            , 'Ranger'],
      \ 's' : [':FloatermNew ncdu'                              , 'Ncdu'],
      \ 't' : [':FloatermNew'                                   , 'Floaterm'],
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

" {{{ PLugins
let g:which_key_map.P = {
			\ 'name' : '+Plugins' ,
			\ 'I' : [':PlugInstall'     , 'Install'],
			\ 'U' : [':PlugUpgrade'    , 'Upgrade'],
			\ 'S' : [':PlugStatus'    , 'Status'],
      \ }

"}}}

" {{{  Marks
let g:which_key_map.m = {
			\ 'name' : '+Mark' ,
			\ 'm' : [':CocCommand bookmark.toggle'               , 'New/Toggle mark'],
			\ 'a' : [':CocCommand bookmark.annotate'             , 'Named mark'],
			\ 'n' : [':CocCommand bookmark.next'                 , 'Next'],
			\ 'p' : [':CocCommand bookmark.prev'                 , 'Prev'],
			\ 'c' : [':CocCommand bookmark.clearForCurrentFile'  , 'Clear buffer marks'],
			\ 'C' : [':CocCommand bookmark.clearForAllFile'      , 'Clear all buffer marks'],
      \ 'l' : [':CocList bookmark', 'list marks'],
      \ }
"}}}

" {{{  Graveyard


      " \ 'po': [':normal! :FloatermSend git push origin $(git branch | grep "\*" | sed s:^..::g )<cr>'     , 'Push into origin'],


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


