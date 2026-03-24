set -U fish_greeting

#status --is-login; and begin
#    # Login shell initialisation
#
#    if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]
#        dbus-run-session Hyprland
#    end
#end

if status is-login
    source ~/.profile
end

status --is-interactive; and begin
    source ~/.profile
    # export ZELLIJ_AUTO_ATTACH=true

    # Xbps Abbr
    abbr --add --global -- xX 'xbps-query -RX'
    abbr --add --global -- xf 'xbps-query -Rf'
    abbr --add --global -- xi 'sudo xbps-install'
    abbr --add --global -- xp 'sudo xbps-pkgdb'
    abbr --add --global -- xq 'xbps-query -Rs'
    abbr --add --global -- xr 'sudo xbps-remove -R'
    abbr --add --global -- xx 'xbps-query -Rx'

    # Common Abbr
    abbr --add --global podmanc -- 'podman container'
    abbr --add --global podmani -- 'podman image'
    abbr --add --global lsblk -- 'lsblk -fmp'

    # Aliases
    alias cat bat
    alias cws 'cargo watch -c -w src -x run'
    alias downmusic '~/Documents/linux/scripts/youtube-dl.sh'
    alias downvideos '~/Documents/linux/scripts/youtube-dl-videos.sh'
    alias e 'emacsclient -c -a '\''emacs'\'' -q . & disown'
    alias ess 'emacsclient -a '\'''\'' -e '\''(server-start)'\'''
    alias fd 'fd -E /run/timeshift -E /usr/share/man -E /proc -E /tmp -E /run/user --follow'
    alias rg 'rg --hidden --follow'
    alias grep rg
    alias ke 'pkill emacs'

    # Ls commands
    # alias ls='lsd'
    # alias l='ls -l'
    # alias la='ls -a'
    # alias lla='ls -la'
    # alias lt='ls --tree'

    # Games
    alias arknights "QT_QPA_PLATFORM=xcb /opt/android-sdk/tools/emulator @arknights -gpu host -no-snapshot-load;adb -s emulator-5554 shell am start -n 'com.YoStarEN.Arknights/com.u8.sdk.U8UnityContext'"

    alias arknights '~/Documents/linux/scripts/start-arknights.sh'

    bind \b backward-kill-word
    bind \e\[1\;2D dir_back

    # kubectl completion fish | source
    # kind completion fish | source
    # helm completion fish | source
    # eval (zellij setup --generate-auto-start fish | string collect)
    fastfetch
end
