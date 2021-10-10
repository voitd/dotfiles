
# split lines
# set -g pane-border-style fg=brightblack
# set -g pane-active-border-style fg=brightblack

# statusline
set -g status-bg terminal
set -g status-fg terminal 

# set -g status-right "%H:%M"

set -g status-right ""
set -g status-left ""

set -g status-right-length "100"
set -g status-left-length "100"

set -g status-justify left
# set -g status-justify centre

# set -g window-status-current-format "●"
# set -g window-status-format "○"

# set -g window-status-current-format "#[fg=#1c8db2]#[fg=#002635]#[bg=#1c8db2]#I #[bg=brightblack]#[fg=#002635] #W #[fg=brightblack]#[bg=default]"
# set -g window-status-format         "#[fg=#00484d]#[fg=#002635]#[bg=#00484d]#I #[bg=#00384d]#[fg=#002635] #W #[fg=#00384d]#[bg=default]"

set -g pane-border-style "fg=#00384d"
set -g pane-active-border-style "fg=#00484d"
# setw -g window-status-activity-style "none,fg=#9ecd6f,bg=#2d2a2e"
# setw -g window-status-separator ""
# setw -g window-status-style "none,fg=#e3e1e4,bg=#2d2a2e"

# set -g status-left " #[bg=#2d2a2e,fg=#9ecd6f]%I:%M %p"

set -g status-right "#[bg=#002635,fg=#517f8d] #{?client_prefix,"..Prefix..",%H:%M %d-%m-%Y} "

setw -g window-status-format "#[bg=#002635,fg=#7eb2dd] #W "

setw -g window-status-current-format "#[bg=#002635,fg=#ff5a67] #W "

# Cool trick: Let's dim out any pane that's not active.
# set-window-option -g window-style fg=colour245,bg=colour237
# set-window-option -g window-active-style fg=colour230,bg=colour235

#: Color scheme 
# foreground   #e6e6dc
# background   #002635

# # black
# color0       #00384d
# color8       #517f8d

# # red
# color1       #c43061
# color9       #ff5a67

# # green
# color2       #7fc06e
# color10      #9cf087

# # yellow
# color3       #f08e48
# color11      #ffcc1b

# # blue
# color4       #1c8db2
# color12      #7eb2dd

# # magenta
# color5       #c694ff
# color13      #fb94ff

# # cyan
# color6       #00cccc
# color14      #00ffff

# # white
# color7       #77929e
# color15      #b7cff9
