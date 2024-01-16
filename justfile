restore:
   stow . -t ~/

backup outdir:
  7z a {{outdir}} -p -mhe=on . -xr!node_modules -xr!target -xr!elpaca -xr!undotree -xr!eln-cache -xr!hostdir -xr!masterdir -xr!.next -xr!ccls-cache
