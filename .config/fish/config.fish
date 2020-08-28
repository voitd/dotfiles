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


# Set the prompt
# function fish_prompt
#     echo -n (set_color red)"$USER@"(prompt_hostname)"❯"
#     echo -n (set_color cyan)(prompt_pwd)"❯"
#     echo -n (set_color red)(git branch 2> /dev/null | awk '{print $2}' | sed '/^\s*$/d')"❯"
#     echo -n " "
# end
starship init fish | source

## get top process eating memory
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps aux | sort -nr -k 3'
alias pscpu10='ps aux | sort -nr -k 3 | head -10'


# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


# apps
alias v="nvim"
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

abbr record "ffmpeg -f x11grab -s 1440x900 -i :0.0 -r 30 -vcodec libx264 recording.mkv"
abbr Dl  "cd ~/Downloads/"
abbr con "cd ~/.config/"
abbr fi  "cd ~/.config/fish/"
abbr ran "cd ~/.config/ranger/"
abbr kit  "cd ~/.config/kitty/"
abbr dtf "cd ~/.dotfiles/ "


# alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
# alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
# alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"


# bare git repo alias for dotfiles
alias dots="/usr/local/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias dotfiles="/usr/local/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
