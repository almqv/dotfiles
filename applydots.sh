#!/usr/bin/sh

applydots() {
	cfgPath=$HOME/.config_test
	backupPath=$HOME/.config_backup

	curdate=$(date +"%Y-%m-%d-%T")

	mkdir -p $backupPath
	cp -r $cfgPath $backupPath/$curdate # create backup


	# copy over the dotfiles
	cp -rf $PWD/.config/* $cfgPath/
}

while true; do
	read -p "Do you wish to install the dotfiles? (y/n) " yn
	case $yn in
		[Yy]* ) applydots; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
