restore:
   stow . -t ~/

pkglist:
  xbps-query -l | awk '{ print $2 }' | xargs -n1 xbps-uhelper getpkgname > pkglist

backup outdir:
  7z a {{outdir}} -p -mhe=on . -xr!node_modules -xr!target -xr!elpaca -xr!undotree -xr!eln-cache -xr!hostdir -xr!masterdir-x86_64 -xr!.next -xr!.ccls-cache -xr!venv
