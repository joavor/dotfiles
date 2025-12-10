#!/usr/bin/env fish

# Ensure that the folder containing this script is in path and add the following in tmux.conf
#   set -s command-alias[100] tmux-sessions='display-popup -w 50% -h 50% "tmux-sessions.fish"'
#   bind-key -r f tmux-sessions

# Allow the user to select a directory in the projects folder using a fuzzy finder
set selected (
    begin
        echo "(home)" && \
        find ~/Development/projects/ -mindepth 1 -maxdepth 2 -type d && \
        echo "(system monitor)" && \
        echo "(create temporary session)"
    end | fzf)

# The name of the session should be the selected directory name
set selected_name (basename "$selected" | tr . _)

# A command to run after the session is created
# Will only be run on create
set command ""

if [ "$selected_name" = "(home)" ]
    set selected "~"
else if [ "$selected_name" = "(create temporary session)" ]
    set selected ( mktemp -d /tmp/session.XXXXXX )
    set selected_name ( basename $selected | tr . _ )
else if [ "$selected_name" = "(system monitor)" ]
    set command btop
end

if test -n "$selected_name"
    if tmux has-session -t="$selected_name" 2>/dev/null
        # The session already exists, attach to it
        if [ "$command" != "" ]
            tmux send-keys -t $selected_name "$command" C-m
        end
        tmux switch-client -t $selected_name
        tmux display "Switched to session '$selected_name'"
    else
        # The session does not exist, create a new one
        tmux new-session -ds "$selected_name" -c "$selected"
        if test -e "$selected/.tmux.sh"
            tmux send-keys -t $selected_name "$selected/.tmux.sh" C-m
        end
        if [ "$command" != "" ]
            tmux send-keys -t $selected_name "$command" C-m
        end
        tmux switch-client -t $selected_name
        tmux display "Created session '$selected_name'"
    end

end

exit 0
