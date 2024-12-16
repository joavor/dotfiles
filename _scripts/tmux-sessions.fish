#!/usr/bin/env fish

# Ensure that the folder containing this script is in path and add the following in tmux.conf
#   set -s command-alias[100] tmux-sessions='display-popup -w 50% -h 50% "tmux-sessions.fish"'
#   bind-key -r f tmux-sessions

# Allow the user to select a directory in the projects folder using a fuzzy finder
set selected (
    begin
        echo "~" && \
        find ~/Development/projects/ -mindepth 1 -maxdepth 2 -type d
    end | fzf)

# The name of the session should be the selected directory name
set selected_name (basename "$selected" | tr . _)

if [ "$selected_name" = "~" ]
    set selected_name "(home)"
end

if test -n "$selected_name"
    if tmux has-session -t="$selected_name" 2>/dev/null
        # The session already exists, attach to it
        tmux switch-client -t $selected_name
        tmux display "Switched to session '$selected_name'"
    else
        # The session does not exist, create a new one
        tmux new-session -ds $selected_name -c $selected
        tmux send-keys -t $selected_name "$selected/.tmux.sh" C-m
        tmux switch-client -t $selected_name
        tmux display "Created session '$selected_name'"
    end
end

exit 0
