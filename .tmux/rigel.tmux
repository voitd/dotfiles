
# split lines
set -g pane-border-style fg=brightblack
set -g pane-active-border-style fg=brightblack

# statusline
set -g status-bg default
set -g status-fg default 

# set -g status-right "%H:%M"
set -g status-right ""
set -g status-left ""

# set -g status-justify left
set -g status-justify centre

# set -g window-status-current-format "●"
# set -g window-status-format "○"

set -g window-status-current-format "#[fg=#1c8db2]#[fg=#002635]#[bg=#1c8db2]#I #[bg=brightblack]#[fg=#002635] #W #[fg=brightblack]#[bg=default]"
set -g window-status-format         "#[fg=#00484d]#[fg=#002635]#[bg=#00484d]#I #[bg=#00384d]#[fg=#002635] #W #[fg=#00384d]#[bg=default]"

