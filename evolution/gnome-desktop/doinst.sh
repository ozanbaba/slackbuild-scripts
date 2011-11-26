# refresh scrollkeeper database
if [ -x usr/bin/rarian-sk-update ]; then
  usr/bin/rarian-sk-update 1> /dev/null 2> /dev/null
fi

# update desktop entries
if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database 1> /dev/null 2> /dev/null
fi

# set gsb background as default
if [ -x usr/bin/gconftool-2 ]; then
  usr/bin/gconftool-2 --direct --config-source="$(usr/bin/gconftool-2 --get-default-source)" --type string --set /desktop/gnome/background/picture_filename /usr/share/pixmaps/backgrounds/gsb-background.png 1> /dev/null 2> /dev/null
fi;

# refresh gnome icon cache
for i in gnome hicolor
do
	if [ -e usr/share/icons/$i/icon-theme.cache ]; then
		rm -f usr/share/icons/$i/icon-theme.cache
	fi
	usr/bin/gtk-update-icon-cache -f -q usr/share/icons/$i 1>/dev/null 2>/dev/null
done
