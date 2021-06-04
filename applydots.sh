#!/usr/bin/sh

applydots() {
	cfgPath=$HOME/.config
	backupPath=$HOME/.config_backup

	curdate=$(date +"%Y-%m-%d-%T")

	echo "Creating backup at \"$backupPath/$curdate\"..."
	mkdir -p $backupPath
	cp -r $cfgPath $backupPath/$curdate # create backup

	echo "Installing dotfiles..."
	# copy over the dotfiles
	cp -rf $PWD/.config/* $cfgPath/

	echo "Done."
}

while true; do
	read -p "Do you wish to install the dotfiles? [yn] " yn
	case $yn in
		[Yy]* ) applydots; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
