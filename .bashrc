#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Ranking mirrors
# First switch to root user
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# Then do the following:
# rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
# All of this should be done as root user
# If anything goes wrong, try this:
# sudo reflector --country 'India' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# This uses reflector
# For converting doc files to pdf you can use soffice
# It's from LibreOffice
# soffice --headless --convert-to pdf *.docx

export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export BUN_INSTALL="$HOME/.bun"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/share/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.zfunc/:$PATH"
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$JAVA_HOME/bin:$PATH"
export NVM_DIR="$HOME/.config/nvm"
export WEZTERM_GUI_BACKEND="wayland"
export WALLPAPER_DIR='/home/shashank/Pictures/Wallpapers'
export TERM='wezterm'

# Personal projects
export PATH="$HOME/Code/todo-rs/target/release/:$PATH"
export PATH="$HOME/Codey/pass-rs/target/release/:$PATH"
export PATH="$HOME/Code/suburl_crawler_py/:$PATH"

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
alias vate='source .venv/bin/activate'
alias update='sudo pacman -Syu; paru -Syu'
alias zf='zathura ~/$(fzf)'
alias think='nvim think.md'

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
alias gc='git commit -m "$1"'
alias gcd='git commit -m "$(date)"'
alias gp='git push -u origin main'

# Cargo aliases
alias cr='cargo run'
alias ca='cargo add'

# Aliases for the pass-rs program
alias pa='pass-rs --add "$1"'
alias pl='pass-rs --list'
alias pr='pass-rs --remove "$1"'

# Aliases for the todo-rs program
alias ta='todo-rs --add "$1"'
alias tl='todo-rs --list'
alias tr='todo-rs --remove "$1"'

# Personal project related aliases
alias rurls="source $HOME/PersonalProjects/suburl_crawler_py/.venv/bin/activate && $HOME/PersonalProjects/suburl_crawler_py/sub_url_crawler.py"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$HOME/.histfile"

# Evaluate zoxide initialization
eval "$(zoxide init bash)"

# some sway shit
export XDG_CURRENT_DESKTOP="sway"

ff() {
    fastfetch
}

ffall() {
    for i in $(seq 1 22);do
        echo '--------------------------------------------------------------------------------------------'
        echo "$i th one"
        fastfetch -c /usr/share/fastfetch/presets/examples/$i.jsonc
        echo '--------------------------------------------------------------------------------------------'
    done
}

[ -f "/home/sns/.ghcup/env" ] && . "/home/sns/.ghcup/env" # ghcup-env
eval "$(starship init bash)"
. "$HOME/.cargo/env"
. "/home/shashank/.deno/env"