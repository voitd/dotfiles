let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' ¤ '
highlight clear ALEWarning
let g:ale_statusline_format = ['✖ %d', '⚠ %d', '⬥ ok']
let g:ale_linters = {
\  'rust': [],
\  'javascript': ['eslint'],
\  'typescript' : ['eslint'],
\  'typescript.tsx' : ['tslint', 'eslint'],
\  'python': ['pycodestyle', 'mypy', 'bandit'],
\  'html': ['tidy'],
\  'css': ['stylelint'],
\  'bash': ['shellcheck'],
\  'zsh': ['shellcheck'],
\  'vim': ['vint'],
\}
let g:ale_virtualenv_dir_names = [$WORKON_HOME]
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = 'ALE: %severity% %linter%: %s '
let g:ale_lint_on_enter = 0
let g:ale_fixers = {
\  'javascript' : ['prettier'],
\  'typescript' : ['prettier'],
\  'typescript.tsx' : ['prettier'],
\  'json' : ['fixjson'],
\  'python' : ['black', 'isort'],
\  'rust': ['rustfmt'],
\  'go' : ['goimports'],
\  'css' : ['prettier'],
\  'elm' : ['elm-format'],
\  'markdown' : ['prettier'],
\  'html' : ['prettier'],
\  'yaml': ['prettier'],
\  'sh': ['shfmt'],
\  'dart': ['dartfmt']
\}
let g:ale_javascript_prettier_use_local_config = 1
