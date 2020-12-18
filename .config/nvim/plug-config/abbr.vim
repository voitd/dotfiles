
:autocmd FileType html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> con@ console.log();<Left><Left>

:autocmd FileType html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> im@ import {} from '';<Left><Left>

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> if@ if() {<CR>}<Esc>%<Left><Left>i

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> el@ else {<CR>}<Up><End>

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> eli@ else {<CR>}<Esc>%iif() <Left><Left>

:autocmd FileType html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> sw@ switch(z) {<CR>}<Up><End><CR>case :<CR><BS>break;<CR><CR>default:<CR><BS>break;<Esc>j%Fzxi

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> fun@ function() {<CR>}<Esc>%F(i

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> afun@ async function() {<CR>}<Esc>%F(i

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> forii@ for(let i = 0; i <z; i++) {<CR><CR>}<Esc><Up><Up>fzxi 

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> forof@ for(let value ofz) {<CR><CR>}<Esc><Up><Up>fzxi 

:autocmd FileType php,html.twig,html,javascript,typescript,vue
  \ :iabbrev <buffer> iife@ (async function () {z})()<Esc>%Fzxi<CR><CR><Up>
