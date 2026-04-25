# pane navigation to match vim
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

bind -n M-H previous-window
bind -n M-L next-window

# window navigation
bind -n M-1 select-window -t :1
bind -n M-2 select-window -t :2
bind -n M-3 select-window -t :3
bind -n M-4 select-window -t :4
bind -n M-5 select-window -t :5
bind -n M-6 select-window -t :6
bind -n M-7 select-window -t :7
bind -n M-8 select-window -t :8
bind -n M-9 select-window -t :9

# session navigation
bind -n M-J switchc -p
bind -n M-K switchc -n

# pane editing
bind -n M-n split-window
bind -n M-v split-window -h
bind -n M-x kill-pane
bind -n M-m select-pane -m
bind -n M-b join-pane

bind -n M-Up resize-pane -U
bind -n M-Down resize-pane -D
bind -n M-Left resize-pane -L
bind -n M-Right resize-pane -R

# window editing
bind -n M-c new-window -a
bind -n M-X kill-window
