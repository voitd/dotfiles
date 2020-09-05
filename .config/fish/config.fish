set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

alias reload="source ~/.config/fish/config.fish | echo "Reloaded!" "
export TERM=xterm-256color
export TERMINAL="kitty"
export EDITOR="nvim"
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export DOTBARE_DIR="$HOME/dotfiles"

# sets vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

# FZF settings {{{
 set -gx FZF_DEFAULT_OPTS '--color=bg+:#073642,bg:#eee8d5,spinner:#859900,hl:#586e75,fg:#073642,pointer:#859900,info:#cb4b16,fg+:#fdf6e3,marker:#859900,header:#586e75,prompt:#859900,hl+:#859900'
 set -gx _ZO_FZF_OPTS "--height 40% --reverse $FZF_DEFAULT_OPTS"
 set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore --smart-case --hidden --follow --no-messages --ignore-file ~/.gitignore'
 set -gx FZF_CTRL_T_COMMAND 'rg --files --ignore --smart-case --hidden --follow --no-messages --ignore-file ~/.gitignore'
# }}}

# Set the prompt
# function fish_prompt
#     echo -n (set_color red)"$USER@"(prompt_hostname)"❯"
#     echo -n (set_color cyan)(prompt_pwd)"❯"
#     echo -n (set_color red)(git branch 2> /dev/null | awk '{print $2}' | sed '/^\s*$/d')"❯"
#     echo -n " "
# end
starship init fish | source

## get top process eating memory
alias psmem='ps aux | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps -er -o pid,pcpu,comm | head -10'

alias stats='top -l 1 | grep -E "^CPU|^Phys"'


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


# apps
alias v="nvim"
alias v!='nvim -u NONE'
alias wt="webtorrent"
alias r="ranger"
alias a="aria2c"
alias wlp="unsplash-wallpaper -r --width 2880 --height 1800"
alias ytdl="youtube-dl -f bestvideo "
alias ytdla="youtube-dl --extract-audio --audio-format m4a "

# tmux
alias t="tmux"
alias ta="t a -t"
alias tl="t ls"
alias tn="t new -t"
alias tk="t kill-server"

# Replace legacy tools with new ones
alias ls='exa -G  --color auto --icons -a -s type'
alias ll='exa -l --color always --icons -a -s type'
alias rls="cd && cd - && ls -G"

# Colorized cat.
alias cat='bat -pp --theme="Nord"'

# Common quality of life aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cc="clear"
alias bi="brew install"
alias ht="htop"
alias htu="htop -t -u void"

# git
alias	gil="git log --graph --abbrev-commit --decorate --date=relative \
  --format=format:'%C(red)%h%C(r) —— %C(bold blue)%an%C(r): %C(white)%s%C(r) \
  %C(dim white) %C(bold green)(%ar)%C(r) %C(bold yellow)%d%C(r)' --all"
alias upd="git pull origin develop:develop --rebase --ff-only"
alias upm="git pull origin master:master --rebase --ff-only"

alias fzf='fzf --color=light'
alias findF="ps -ef | grep -v grep | grep "

abbr record "ffmpeg -f x11grab -s 1440x900 -i :0.0 -r 30 -vcodec libx264 recording.mkv"
abbr Dl  "cd ~/Downloads/"
abbr g 'git'
abbr d 'dots'


# alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
# alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
# alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"


# bare git repo alias for dotfiles
alias dots="/usr/local/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias dotfiles="/usr/local/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias dotsall="dots add commit-types .tmux.conf .gitconfig .config/fish/config.fish
.config/nvim/init.vim .config/nvim/coc-settings.json .config/nvim/plug-config .config/kitty/"


# vim: foldmethod=marker:sw=2:foldlevel=10
