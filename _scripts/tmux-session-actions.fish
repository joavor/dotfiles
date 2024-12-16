#!/usr/bin/env fish

set selected_action (find ./.actions/ -mindepth 1 -maxdepth 1 -type f | fzf)

if test -n "$selected_action"
    echo "Running action '$selected_action'"
    echo

    $selected_action

    tmux display "Completed action '$selected_action'"
    sleep 2
end
exit 0
