# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -al'

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

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/share/:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$JAVA_HOME/bin:$PATH"

# Aliases
alias grep='grep --color=auto'
alias convertpngtojpg='mogrify -format jpg *.png'
alias vate='source .venv/bin/activate'
alias mc='java -jar /home/shashank/mc.jar'
alias speedtest='curl -w "\n\nTime: %{time_total}s\nDownload: %{speed_download} bytes/sec\nSize: %{size_download} bytes\n" -o /dev/null -s'
alias aria='aria2c --enable-mmap --file-allocation=none -x 16 -s 16 -k 1M'
alias zf='zathura ~/$(fzf)'
alias mp3='yt-dlp -x "$1" --audio-format mp3'
alias nv='nvim -u ~/.config/kickstart.nvim/init.lua $1'
alias fontlist='fc-list :family | uniq | sort | rg'
alias v='vim'
alias gv='GTK_THEME=Adwaita:dark gvim'
alias gmute='pamixer --get-mute'
alias batt='acpi -b'
alias stat='status.sh'
alias ll='ls -al'

# Git aliases
alias gs='git status'
alias ga='git add .'
alias gcd='git commit -m "$(date)"'
alias gp='git push -u origin main'

# this is hwo you do postgres
# psql -U postgres -d student -h localhost -W

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

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$HOME/.histfile"

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

send() {
    curl -F "file=@$1" https://0x0.st | wl-copy
}

recv() {
    curl https://0x0.st/$1 -o $2
}

# Evaluate zoxide initialization
eval "$(zoxide init bash)"
. "$HOME/.cargo/env"
