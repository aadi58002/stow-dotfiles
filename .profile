### EXPORT
export TERM="xterm-256color" # getting proper colors
export HISTORY_IGNORE="(ls|cd|pwd|exit|poweroff|reboot|history|cd -|cd ..|doomsync|esr|ess|essr)"
export EDITOR="emacsclient -c -a 'emacs'"
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
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/.android
export ANDROID_AVD_HOME="$XDG_CONFIG_HOME"/.android/avd
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# XCURSOR SIZE
export XCURSOR_SIZE=48

# Ripgrep
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME"/ripgrep.conf

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

## Cmake Extra flags
export CMAKE_EXTRA_FLAGS="-DCMAKE_C_COMPILER_LAUNCHER=sccache -DCMAKE_CXX_COMPILER_LAUNCHER=sccache"

##Runit
export SVDIR="$XDG_DATA_HOME"/service

### Firefox
export GDK_BACKEND=wayland
export MOZ_USE_XINPUT2=1
export MOZ_ENABLE_WAYLAND=1

##t Rust
export RUSTC_WRAPPER=/usr/bin/sccache
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

### Personal Blog
export BLOG_DEVELOPMENT="True"

### Nix
export NIXPKGS_ALLOW_UNFREE=1

export XDG_CURRENT_DESKTOP=kde
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=kde

# Add user-local binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.local/share/go/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"

# Nix profiles
export PATH="$HOME/.nix-profile/bin:$PATH"
export PATH="$XDG_STATE_HOME/.local/state}/nix/profile/bin:$PATH"

# Android SDK
export PATH="/opt/android-sdk/platform-tools:$PATH"
export PATH="/opt/android-sdk/cmdline-tools/latest/bin:$PATH"
export PATH="/opt/android-sdk/emulator:$PATH"
