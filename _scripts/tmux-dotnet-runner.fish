#!/usr/bin/env fish

# Ensure that the folder containing this script is in path and add the following in tmux.conf
#   set -s command-alias[100] tmux-sessions='display-popup -w 50% -h 50% "tmux-sessions.fish"'
#   bind-key -r f tmux-sessions

# Allow the user to select a directory in the projects folder using a fuzzy finder
set selected (find ./ -mindepth 1 -maxdepth 10 -type f -name "*.csproj" | fzf)

# The name of the session should be the selected directory name
set selected_name (basename "$selected" | tr . _)

tmux display "$selected_name"

if test -n "$selected_name"
end

exit 0
