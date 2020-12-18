" -- Sneak ---------------------------------------------------------------------

let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" imediately move tot the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

let g:sneak#streak = 1
let g:sneak#streak_esc = "\<Esc>"

" remap so I can use , and ; with f and t
" map gS <Plug>Sneak_,
" map gs <Plug>Sneak_;

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" Change the colors
highlight Sneak      guifg=black guibg=#00C7DF 
highlight SneakScope guifg=red   guibg=yellow 

" Cool prompt
" let g:sneak#prompt = '🔎'
let g:sneak#prompt = '  '
