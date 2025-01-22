# ~/.config/fish/config.fish
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
set -gx EDITOR "nvim"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx JAVA_HOME "/usr/lib/jvm/default"
set -gx NVM_DIR "$HOME/.config/nvm"
set -gx WEZTERM_GUI_BACKEND "wayland"
set -gx WALLPAPER_DIR "$HOME/Pictures/Wallpapers"
set -gx XDG_CURRENT_DESKTOP "Hyprland"
set -gx BROWSER "qutebrowser"

# i can setup colorscheme for gvim
set -gx GTK_THEME "Adwaita:dark gvim"

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

# Aliases
# alias l='lsd -l --color=auto'
# alias ls='lsd --color=auto'
alias grep='grep --color=auto'
alias convertpngtojpg='mogrify -format jpg *.png'
alias vate='source .venv/bin/activate.fish'
alias mc='java -jar ~/SKlauncher-3.2.8.jar'
# alias toff='echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
# alias ton='echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
# alias tshow='cat /sys/devices/system/cpu/intel_pstate/no_turbo'
alias zf='zathura ~/$(fzf)'
alias mp3='yt-dlp -x "$1" --audio-format mp3'
alias nv='nvim -u ~/.config/kickstart.nvim/init.lua $1'

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

# Cargo aliases
alias cr='cargo run'
alias ca='cargo add'

# Aliases for the pass-rs program
function pa
    pass-rs --add $argv
end
alias pl='pass-rs --list'
function pr
    pass-rs --remove $argv
end

# Aliases for the todo-rs program
function ta
    todo-rs --add $argv
end
alias tl='todo-rs --list'
function tr
    todo-rs --remove $argv
end

# Personal project related aliases
alias rurls="source $HOME/PersonalProjects/suburl_crawler_py/.venv/bin/activate && $HOME/PersonalProjects/suburl_crawler_py/sub_url_crawler.py"

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

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/shashank/.ghcup/bin # ghcup-env
