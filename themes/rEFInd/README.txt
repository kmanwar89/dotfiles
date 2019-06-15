Theme files for theming rEFInd EFI boot manager.

Currently using rEFInd-minimal as of 11 JUNE 2019



Other Notes
-----------
6 Themes
--------
4) rEFInd-theme (customized for /r/unixporn, steal these icons!)
Link: git@github.com:initramfs/rEFInd-Theme.git

5) rEFInd-ambience (really nice looking theme)
Link: git@github.com:lukechilds/refind-ambience.git

6) refind-theme-regular (basic theme, I like the Windows icon here)
Link: git@github.com:munlik/refind-theme-regular.git



Keep
----
rEFInd-minimal -- the basis for all other themes
Link: git@github.com:EvanPurkhiser/rEFInd-minimal.git
include themes/rEFInd-minimal/theme.conf

rEFInd-minimal (geometric background)
Link: git@github.com:WolfEdge/rEFInd-minimal.git
include rEFInd-minimal/theme.conf
NOTE: Have to place in the same directory as refind.conf (/boot/efi/EFI/refind), not in the themes folder

Don't Keep
----------




Didn't work
-----------
rEFInd-black -- blacked out rEFInd-minimal
Link: git@github.com:anthon38/refind-black.git
include themes/refind-black/theme.conf
