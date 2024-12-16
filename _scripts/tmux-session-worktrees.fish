#!/usr/bin/env fish

set is_bare_repo (git rev-parse --is-bare-repository 2> /dev/null)
echo $is_bare_repo

if $is_bare_repo = true
    set selected_worktree (git worktree list | fzf)
    set selected_dir (echo "$selected_worktree" | awk "{print $1}")

    tmux display "TODO: Switch to $selected_dir"
end

sleep 2
exit 0
