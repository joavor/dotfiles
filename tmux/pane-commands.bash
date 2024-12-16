if [ $1 = "n" ]; then
    tmux split-window -v
fi
if [ $1 = "N" ]; then
    tmux split-window -h
fi
