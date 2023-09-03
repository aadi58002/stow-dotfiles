# ~/.config/fish/config.fish: DO NOT EDIT -- this file has been generated
# automatically by home-manager.
function fish_user_key_bindings
    fish_default_key_bindings -M insert
    #fish_vi_key_bindings --no-erase insert

    bind \cX "fish_commandline_append ' | wl-copy'"
    bind \cV "fish_commandline_prepend_full 'wl-paste | '"  # https://github.com/fish-shell/fish-shell/issues/8763
end

# Only execute this file once per shell.
set -q __fish_home_manager_config_sourced; and exit
set -g __fish_home_manager_config_sourced 1

set -U fish_greeting
set -x GPG_TTY (tty)

### EXPORT
export TERM="xterm-256color" # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|poweroff|reboot|history|cd -|cd ..|doomsync|esr|ess|essr)"
export GIT_EDITOR="emacsclient -c -a \'\'" # $EDITOR use Emacs in terminal
export EDITOR="emacsclient -c -a \'\'" # $EDITOR use Emacs in terminal
export KUBE_EDITOR="emacsclient -c -a \'\'"
export DIFFPROG="emacsclient -c -a emacs"
export VISUAL="emacsclient -c -a emacs" # $VISUAL use Emacs in GUI mode

### SET MANPAGER
export MANPAGER="bat"

### XDG variables setup
# export QT_QPA_PLATFORM="wayland"
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

status --is-login; and begin

    # Login shell initialisation
    if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]
        Hyprland
    end


end

status --is-interactive; and begin

    # Abbreviations
    abbr --add --global -- xX 'xbps-query -RX'
    abbr --add --global -- xf 'xbps-query -Rf'
    abbr --add --global -- xi 'sudo xbps-install'
    abbr --add --global -- xp 'sudo xbps-pkgdb'
    abbr --add --global -- xq 'xbps-query -Rs'
    abbr --add --global -- xr 'sudo xbps-remove -R'
    abbr --add --global -- xx 'xbps-query -Rx'

    # Aliases
    alias c cargo
    alias cat bat
    alias clear 'clear && /home/$USER/Documents/Scripts/shell-color-scripts/random.sh'
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
    alias ls exa
    alias n nvim
    alias pdf_join '~/Documents/Scripts/pdf_join.sh'
    alias plocate 'plocate -d ~/.local/share/plocate/plocate.db'
    alias podmanc 'podman container'
    alias podmani 'podman image'
    alias vim 'emacsclient -a '\''emacs'\'' -t -q'
    alias x11Start 'export DISPLAY=:12 && Xwayland -retro -noreset -noTouchPointerEmulation :12 & disown'

    alias hmr 'home-manager switch --flake ~/Personal/nix-dotfiles/nix/home-manager#aadi58002'
    alias hmu 'nix flake update ~/Personal/nix-dotfiles/nix/home-manager && hmr'

    # Interactive shell initialisation
    function cmd_exists
        command -v $argv[1] 1>/dev/null && true || false
    end


    #PATH
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.local/share/cargo/bin/

    cmd_exists starship && starship init fish | source
    cmd_exists zoxide && zoxide init fish | source
    cmd_exists kind && kind completion fish | source
    cmd_exists helm && helm completion fish | source

    #/home/$USER/Documents/Scripts/shell-color-scripts/random.sh

    function dir_back
        commandline "cd .."
        commandline -f execute
    end

    function dir_prev
        commandline "cd -"
        commandline -f execute
    end
    bind \e\[1\;3D dir_back
    bind \e\[1\;3C dir_prev

    # pnpm
    set -gx PNPM_HOME "/home/aditya-yadav/.local/share/pnpm"
    set -gx PATH "$PNPM_HOME" $PATH
    # pnpm end


    # kind completion fish | source
    # kubectl completion fish | source
    # helm completion fish | source

    
    zoxide init fish | source

end
