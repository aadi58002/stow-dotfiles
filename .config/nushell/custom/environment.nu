# Set environment variables (similar to export in Bash/Fish)
$env.TERM = "xterm-256color"
$env.HISTORY_IGNORE = "(ls|cd|pwd|exit|poweroff|reboot|history|cd -|cd ..|doomsync|esr|ess|essr)"
$env.EDITOR = "emacsclient -c -a 'emacs'"
$env.MANPAGER = "bat"

$env.QT_QPA_PLATFORM = "wayland"
$env.XDG_DATA_HOME = $env.HOME + "/.local/share"
$env.XDG_RUNTIME_DIR = "/run/user/" + (id -u)
$env.XDG_CONFIG_HOME = $env.HOME + "/.config"
$env.XDG_STATE_HOME = $env.HOME + "/.local/state"
$env.XDG_CACHE_HOME = $env.HOME + "/.cache"

$env.NOTMUCH_CONFIG = $env.XDG_CONFIG_HOME + "/notmuch/notmuch-config"
$env.LESSHISTFILE = $env.XDG_CACHE_HOME + "/less/history"
$env.GOPATH = $env.XDG_DATA_HOME + "/go"
$env.CARGO_HOME = $env.XDG_DATA_HOME + "/cargo"
$env.HISTFILE = $env.XDG_STATE_HOME + "/bash/history"
$env.ANDROID_HOME = "/opt/android-sdk"
$env.DOCKER_CONFIG = $env.XDG_CONFIG_HOME + "/docker"
$env.GNUPGHOME = $env.XDG_DATA_HOME + "/gnupg"
$env.GRADLE_USER_HOME = $env.XDG_DATA_HOME + "/gradle"
$env.GTK2_RC_FILES = $env.XDG_CONFIG_HOME + "/gtk-2.0/gtkrc"
$env.KDEHOME = $env.XDG_CONFIG_HOME + "/kde"
$env.INPUTRC = $env.XDG_CONFIG_HOME + "/readline/inputrc"

# Ripgrep equivalent
$env.RIPGREP_CONFIG_PATH = $env.XDG_CONFIG_HOME + "/ripgrep.conf"

# pnpm setup
$env.PNPM_HOME = $env.HOME + "/.local/share/pnpm"

# Extra CMake flags
$env.CMAKE_EXTRA_FLAGS = "-DCMAKE_C_COMPILER_LAUNCHER=sccache -DCMAKE_CXX_COMPILER_LAUNCHER=sccache"

# Runit service directory
$env.SVDIR = $env.XDG_DATA_HOME + "/service"

# Firefox setup
$env.GDK_BACKEND = "wayland"
$env.MOZ_USE_XINPUT2 = 1
$env.MOZ_ENABLE_WAYLAND = 1

# Rust setup
$env.RUSTC_WRAPPER = "/usr/bin/sccache"
$env.RUSTUP_HOME = $env.XDG_DATA_HOME + "/rustup"

# Personal Blog setting
$env.BLOG_DEVELOPMENT = "True"

# Nix config (unfree packages)
$env.NIXPKGS_ALLOW_UNFREE = 1

# XDG environment for KDE on Wayland
$env.XDG_CURRENT_DESKTOP = "kde"
$env.XDG_SESSION_TYPE = "wayland"
$env.XDG_SESSION_DESKTOP = "kde"

# Paths
$env.PATH = (
  $env.PATH | split row (char esep) |
    append (echo $env.HOME | path join ".local/bin") |
    append (echo $env.HOME | path join ".local/share/pnpm") |
    append (echo $env.HOME | path join ".local/share/cargo/bin") | 
    append (echo $env.HOME | path join ".local/share/go/bin")
)
