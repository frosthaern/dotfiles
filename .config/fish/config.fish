if status is-interactive
    set fish_greeting
    fish_vi_key_bindings
end

source ~/.cache/wal/fish-theme.fish

# ranking mirror
# first go to su -
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# then do the 
# rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
# all of this should be done while youre in su -
# if anything gets fucked up just try this
# sudo reflector --country 'India' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
# this is using reflector
# i saw once for converting the doc files and stuff you can use soffice
# its from libreoffice 
# you can do soffice --headless --convert-to pdf *.docx

set -x EDITOR "nvim"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/.cargo/env" $PATH
set -x PATH "$HOME/.config/scripts" $PATH
set -x PATH "$BUN_INSTALL/bin" $PATH
set -x PATH "$HOME/.local/share/" $PATH
set -x PATH "$HOME/.local/bin" $PATH
set -x PATH "$HOME/.zfunc/" $PATH
set -x JAVA_HOME "/usr/lib/jvm/default"
set -x PATH "$JAVA_HOME/bin:$PATH"
set -g NVM_DIR ~/.config/nvm
set -x WEZTERM_GUI_BACKEND wayland
set -x WALLPAPER_DIR '/home/shashank/Pictures/Wallpapers'

# personal projects
set -x PATH "$HOME/Projects/todo-rs/target/release/" $PATH
set -x PATH "$HOME/Projects/pass-rs/target/release/" $PATH



# suburl crawler
set -x PATH "$HOME/Projects/suburl_crawler_py/" $PATH



alias l 'lsd -Al --color always --group-dirs first'
alias ls 'lsd -A --color always --group-dirs first'
alias d 'fd -t d -H | fzf'
alias f 'fd -t f -H | fzf'
alias convertpng 'mogrify -format jpg *.png'
alias vate 'source .venv/bin/activate.fish'
alias mc 'java -jar ~/SKlauncher-3.2.8.jar'
alias c 'code'
alias toff 'echo "1" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
alias ton 'echo "0" | sudo tee /sys/devices/system/cpu/intel_pstate/no_turbo'
alias tshow 'cat /sys/devices/system/cpu/intel_pstate/no_turbo'
alias vate 'source .venv/bin/activate.fish'
alias update 'sudo pacman -Syu; paru -Syu'


# imp system alias
alias gmute 'pamixer --get-mute'
alias batt 'acpi -b'
alias stat 'status.sh'

#postgres login
alias student 'psql -U postgres -d student -h localhost -W'
alias sgms 'psql -U postgres -d sgms -h localhost -W'

# git alias
alias gs 'git status'
alias ga 'git add .'
alias gc 'git commit -m $1'
alias gcd 'git commit -m $(date)'
alias gp 'git push -u origin main'

#cargo alias
alias cr 'cargo run'
alias ca 'cargo add'

# for the pass-rs program i wrote
alias pa 'pass-rs --add $1'
alias pl 'pass-rs --list'
alias pr 'pass-rs --remove $1'

# for the todo-rs program i wrote
alias ta 'todo-rs --add $1'
alias tl 'todo-rs --list'
alias tr 'todo-rs --remove $1'

# some personal project related alias
alias rurls "source $HOME/PersonalProjects/suburl_crawler_py/.venv/bin/activate.fish && $HOME/PersonalProjects/suburl_crawler_py/sub_url_crawler.py"



set -x HISTSIZE 1000
set -x SAVEHIST 1000
set -x HISTFILE "$HOME/.histfile"

# Evaluate zoxide initialization
zoxide init fish | source
source "$HOME/.cargo/env.fish"

set MOJO_PATH (modular config mojo.path) \
  && set -Ux MODULAR_HOME $HOME/.modular \
  && fish_add_path $MOJO_PATH/bin


# for changing wallpaper
function change_wal
  wal -i $argv[1]
  echo $argv[1]
  killall swaync
  hyprctl hyprpaper wallpaper "eDP-1, $argv[1]"
  swaync &
end
