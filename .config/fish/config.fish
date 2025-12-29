# shashanks fish config file

function fish_greeting
   # do nothing
end

# function fish_prompt
#     set user (whoami)
#     set host (cat /etc/hostname)
#     set dir (basename (pwd))
#     echo -n "["$user"@"$host" "$dir"]\$ "
# end

set -gx PS1 '[\u@\h \W]\$ '

# Environment variables
set -gx EDITOR "vim"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx JAVA_HOME "/usr/lib/jvm/default"
set -gx NVM_DIR "$HOME/.config/nvm"
set -gx WALLPAPER_DIR "$HOME/Pictures/Wallpapers"
set -gx JAVA_HOME (dirname (dirname (readlink -f (which java))))

# find "$BACKUP_DIR" -type f -name "*.zip" -mtime +7 -delete
# this is to delete everything except the last lines
# test this and then add it to backup_world.sh

# Personal projects and paths
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$HOME/.cargo/env" $PATH
set -gx PATH "$HOME/.config/scripts" $PATH
set -gx PATH "$BUN_INSTALL/bin" $PATH
set -gx PATH "$HOME/.local/share" $PATH
set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.zfunc" $PATH
set -gx PATH "$JAVA_HOME/bin" $PATH
set -gx PATH "$HOME/Code/todo-rs/target/release" $PATH
set -gx PATH "$HOME/Codey/pass-rs/target/release" $PATH
set -gx PATH "$HOME/Code/suburl_crawler_py" $PATH
set -gx PATH "$JAVA_HOME/bin" $PATH
set -gx PATH "$HOME/Apps" $PATH

set fish_vi_force_cursor 1
set fish_cursor_insert "block"

# Aliases
alias l='ls -al'
alias grep='grep --color=auto'
alias convertpngtojpg='mogrify -format jpg *.png'
alias vate='source .venv/bin/activate.fish'
alias mc='java -jar ~/SKlauncher-3.2.8.jar'
alias speedtest='curl -w "\n\nTime: %{time_total}s\nDownload: %{speed_download} bytes/sec\nSize: %{size_download} bytes\n" -o /dev/null -s'
alias aria='aria2c --enable-mmap --file-allocation=none -x 16 -s 16 -k 1M'
alias zf='zathura ~/$(fzf)'
alias mp3='yt-dlp -x "$1" --audio-format mp3'
alias nv='nvim -u ~/.config/kickstart.nvim/init.lua $1'
alias mc='java -jar /home/shashank/mc.jar'
alias fontlist='fc-list :family | uniq | sort | rg'
alias v='vim'
alias gv='GTK_THEME=Adwaita:dark gvim'
alias day='date +"%d_%m_%y"'
alias reflect="sudo reflector --country 'India' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias poff="systemctl poweroff --now"
alias dc="docker compose"

# Important system aliases
alias gmute='pamixer --get-mute'
alias batt='acpi -b'
alias stat='status.sh'

# Postgres login
# alias student='psql -U postgres -d student -h localhost -W'

# Git aliases
alias gs='git status'
alias ga='git add .'
function gc
    git commit -m $argv
end
alias gcd='git commit -m (date)'
alias gp='git push -u origin main'

set -gx HISTSIZE 1000
set -gx SAVEHIST 1000
set -gx HISTFILE "$HOME/.histfile"

# Evaluate zoxide initialization
eval (zoxide init fish | source)

# Fish functions
function ff
    fastfetch
end

function ffall
    for i in (seq 1 22)
        echo '--------------------------------------------------------------------------------------------'
        echo "$i th one"
        fastfetch -c /usr/share/fastfetch/presets/examples/$i.jsonc
        echo '--------------------------------------------------------------------------------------------'
    end
end

function send
    curl -F "file=@$argv" https://0x0.st | wl-copy
end

function recv

    if test (count argv) -ne 2
        echo "recv <linkid> <output filename>"
    end

    curl https://0x0.st/$argv[1] -o $argv[2]

end



set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/shashank/.ghcup/bin $PATH # ghcup-env

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/shashank/.opam/opam-init/init.fish' && source '/home/shashank/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
