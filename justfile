PROFILE_NAME := `echo $(date +%F)-kde-configuration`


restore:
   stow . -t ~/
   cp -r ./.config/autostart/* ~/.config/autostart/

pkglist:
  xbps-query -m | sed 's/[0-9\._-]*$//' > pkglist

backup outdir: backup-kde
  cp -r ~/.config/autostart/* ./.config/autostart
  cp -r /etc/modules-load.d/* ./root/etc/modules-load.d
  7z a {{outdir}} -p -mhe=on . -xr!*.iso -xr!node_modules -xr!target -xr!elpaca -xr!undotree -xr!eln-cache -xr!hostdir -xr!*.xbps -xr!masterdir-x86_64 -xr!.next -xr!.ccls-cache -xr!venv -xr!cdk.out

backup-kde:
  konsave --save "{{PROFILE_NAME}}"
  konsave -e "{{PROFILE_NAME}}" -n "{{PROFILE_NAME}}"
