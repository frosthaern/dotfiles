# ~/.config/fish/config.fish
# shashanks fish config file

function fish_greeting
    # do nothing
end

alias ls='ls --color=auto'
alias grep='grep --color=auto'
set -gx PS1 '[\u@\h \W]\$ '

# Environment variables
set -gx EDITOR "nvim"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx BUN_INSTALL "$HOME/.bun"
set -gx JAVA_HOME "/usr/lib/jvm/default"
set -gx NVM_DIR "$HOME/.config/nvm"
set -gx WEZTERM_GUI_BACKEND "wayland"
set -gx WALLPAPER_DIR "$HOME/Pictures/Wallpapers"

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
alias l='ls -al'
alias d='fd -t d -H | fzf'
alias f='fd -t f -H | fzf'
alias convertpngtojpg='mogrify -format jpg *.png'
alias vate='source .venv/bin/activate'
alias mc='java -jar ~/SKlauncher-3.2.8.jar'
alias c='code'
alias toff='echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
alias ton='echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
alias tshow='cat /sys/devices/system/cpu/intel_pstate/no_turbo'
alias update='sudo pacman -Syu; paru -Syu'
alias zf='zathura ~/$(fzf)'
alias think='nvim think.md'
alias mp3='yt-dlp -x $1 --audio-format mp3'
alias nv='nvim -u ~/.config/kickstart.nvim/init.lua $1'

# pacman commands
alias ps='pacman -Ss'
alias pi='sudo pacman -Sy'
alias pas='paru -Ss'
alias pai='paru -S'

# Important system aliases
alias gmute='pamixer --get-mute'
alias batt='acpi -b'
alias stat='status.sh'

# Postgres login
alias student='psql -U postgres -d student -h localhost -W'
alias sgms='psql -U postgres -d sgms -h localhost -W'

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

# # some sway shit
# set -gx XDG_CURRENT_DESKTOP "sway"

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


# Starship prompt initialization
eval (starship init fish | source)
