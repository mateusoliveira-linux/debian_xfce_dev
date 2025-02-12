#! /bin/bash

#test if user is root
if [ "$(whoami)" == "root" ];
then
	echo "please exit the root user"
	exit 1
fi

# test sudo user
user=$(whoami)

if [ "$(grep 'sudo' /etc/group | grep $user)" ];
then
		echo "Install themes"
else
		echo "Add user $user at sudo group"
		echo """how root user:
	adduser $user sudo"""
	exit 1
fi

#theme install
tar -xvf themes/Sours.tar.gz -C $HOME/.icons
tar -xvf themes/volantes-cursors.tar.gz -C $HOME/.icons

#install vim
./scripts/vim_install.sh
