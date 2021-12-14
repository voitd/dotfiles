# set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set -x LC_ALL en_US.UTF-8

export TERM=xterm-256color
export TERMINAL="kitty"
export EDITOR="nvim"
# sets vim as manpager
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""

# FZF settings {{{
 # set -gx FZF_DEFAULT_COMMAND 'rg --files --ignore --smart-case --hidden --follow --no-messages --ignore-file ~/.gitignore'
# }}}
export FZF_TMUX=1
export FZF_TMUX_OPTS="-p"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# Set the prompt
# function fish_prompt
#     echo -n (set_color red)"$USER@"(prompt_hostname)"❯"
#     echo -n (set_color cyan)(prompt_pwd)"❯"
#     echo -n (set_color red)(git branch 2> /dev/null | awk '{print $2}' | sed '/^\s*$/d')"❯"
#     echo -n " "
# end


source $HOME/.aliases

set -g -x PATH /opt/homebrew/bin $PATH 
set -g fish_user_paths /opt/homebrew/sbin $fish_user_paths

starship init fish | source



# bind \cm peco_select_history # Bind for peco select history to Ctrl+R
# bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
