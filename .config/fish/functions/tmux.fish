set sessions (tmux ls | awk -F ':' '{print $1}')
set selected_dir (fd -t d | fzf)

if test -z "$selected_dir"
    echo "No directory selected."
    exit 1
end

set session_name (basename "$selected_dir")

if contains -- "$session_name" $sessions
    tmux attach-session -t "$session_name"
else
    tmux new-session -s "$session_name" -c "$selected_dir"
end
