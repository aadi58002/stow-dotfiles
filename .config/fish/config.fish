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

# pnpm
set -gx PNPM_HOME "/home/aditya-yadav/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

## Cmake Extra flags
export CMAKE_EXTRA_FLAGS="-DCMAKE_C_COMPILER_LAUNCHER=sccache -DCMAKE_CXX_COMPILER_LAUNCHER=sccache"

##Runit
export SVDIR="$XDG_DATA_HOME"/service

### Firefox
export GDK_BACKEND=wayland
export MOZ_USE_XINPUT=1
export MOZ_ENABLE_WAYLAND=1

##t Rust
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

    abbr --add --global -- xX 'xbps-query -RX'
    abbr --add --global -- xf 'xbps-query -Rf'
    abbr --add --global -- xi 'sudo xbps-install'
    abbr --add --global -- xp 'sudo xbps-pkgdb'
    abbr --add --global -- xq 'xbps-query -Rs'
    abbr --add --global -- xr 'sudo xbps-remove -R'
    abbr --add --global -- xx 'xbps-query -Rx'

    set PATH $HOME/.local/bin $HOME/.local/share/cargo/bin $HOME/.local/share/pnpm $PATH

    starship init fish | source
    zoxide init fish | source
    just --completions fish | source
    # kubectl completion fish | source
    # kind completion fish | source
    # helm completion fish | source

    # Aliases
    alias c cargo
    alias cat bat
    alias cr 'cargo run'
    alias cws 'cargo watch -c -w src -x run'
    alias downmusic '~/Documents/40-49.Computer/41.Linux/41.01.Scripts/youtube-dl.sh'
    alias downvideos '~/Documents/40-49.Computer/41.Linux/41.01.Scripts/youtube-dl-videos.sh'
    alias e 'emacsclient -c -a '\''emacs'\'' -q . & disown'
    alias ess 'emacsclient -a '\'''\'' -e '\''(server-start)'\'''
    alias fd 'fd -E /run/timeshift -E /usr/share/man -E /proc -E /tmp -E /run/user --follow'
    alias rg 'rg --hidden --follow'
    alias grep rg
    alias ke 'pkill emacs'
    alias ls eza
    alias n nvim
    alias podmanc 'podman container'
    alias podmani 'podman image'
    alias vim 'emacsclient -a '\''emacs'\'' -t -q'

    alias lsblk 'lsblk -fmp'

    bind \b backward-kill-word
    bind \e\[1\;2D dir_back
end
