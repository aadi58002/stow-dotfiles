set -U fish_greeting
set -x GPG_TTY (tty)

### EXPORT
export TERM="xterm-256color" # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|poweroff|reboot|history|cd -|cd ..|doomsync|esr|ess|essr)"
export GIT_EDITOR="nvim"
export EDITOR="nvim"
export KUBE_EDITOR="nvim"
export DIFFPROG="nvim"
export VISUAL="nvim"

### SET MANPAGER
export MANPAGER="bat"

### XDG variables setup
export QT_QPA_PLATFORM="wayland"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

### Home clean variables
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuch-config
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GOPATH="$XDG_DATA_HOME"/go
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export HISTFILE="$XDG_STATE_HOME"/bash/history
export ANDROID_HOME=/opt/android-sdk
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

##Runit
export SVDIR="$XDG_DATA_HOME"/service

### Firefox
export MOZ_ENABLE_WAYLAND=0

### Rust
export RUSTC_WRAPPER=/usr/bin/sccache
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

### Personal Blog
export BLOG_DEVELOPMENT="True"

### Nix
export NIXPKGS_ALLOW_UNFREE=1

export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

status --is-login; and begin
    # Login shell initialisation

    if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]
        dbus-run-session Hyprland
    end
end

status --is-interactive; and begin

    export ZELLIJ_AUTO_ATTACH=true

    abbr --add --global -- xX 'xbps-query -RX'
    abbr --add --global -- xf 'xbps-query -Rf'
    abbr --add --global -- xi 'sudo xbps-install'
    abbr --add --global -- xp 'sudo xbps-pkgdb'
    abbr --add --global -- xq 'xbps-query -Rs'
    abbr --add --global -- xr 'sudo xbps-remove -R'
    abbr --add --global -- xx 'xbps-query -Rx'

    set PATH $HOME/.local/bin $HOME/.local/share/cargo/bin $HOME/.local/share/pnpm $PATH

    eval (zellij setup --generate-auto-start fish | string collect)
    starship init fish | source
    zoxide init fish | source
    just --completions fish | source
    # kubectl completion fish | source
    # kind completion fish | source
    # helm completion fish | source

    # Aliases
    alias c cargo
    alias cat bat
    alias clock 'sudo systemctl start cpupower.service && sudo cpupower frequency-set -u 3'
    alias conhs 'sh -c '\''bluetoothctl scan on &> /dev/null & sleep 1 ; bluetoothctl connect 8C:64:A2:A7:2E:43 &> /dev/null'\'''
    alias cr 'cargo run'
    alias cunlock 'sudo systemctl stop cpupower.service'
    alias cws 'cargo watch -c -w src -x run'
    alias disconhs 'sh -c '\''bluetoothctl disconnect 8C:64:A2:A7:2E:43 &> /dev/null'\'''
    alias downmusic '~/Documents/Scripts/youtube-dl.sh'
    alias downmusic_ffmpeg '~/Documents/Scripts/musicconvert.sh'
    alias downvideos '~/Documents/Scripts/youtube-dl-videos.sh'
    alias e 'emacsclient -c -a '\''emacs'\'' -q . & disown'
    alias ess 'emacsclient -a '\'''\'' -e '\''(server-start)'\'''
    alias fd 'fd -E /run/timeshift -E /usr/share/man -E /proc -E /tmp -E /run/user'
    alias grep rg
    alias ke 'pkill emacs'
    alias ls eza
    alias n nvim
    alias pdf_join '~/Documents/Scripts/pdf_join.sh'
    alias plocate 'plocate -d ~/.local/share/plocate/plocate.db'
    alias podmanc 'podman container'
    alias podmani 'podman image'
    alias vim 'emacsclient -a '\''emacs'\'' -t -q'
    alias x11Start 'export DISPLAY=:12 && Xwayland -retro -noreset -noTouchPointerEmulation :12 & disown'

    bind \b backward-kill-word
end
