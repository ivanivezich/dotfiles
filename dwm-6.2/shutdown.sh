#!/bin/sh
if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi
cmd=$(echo -e "shutdown\nreboot\nlogout\nhibernate" | $DMENU)
case $cmd in
	shutdown)
		sudo shutdown -h now
		;;
	reboot)
		sudo shutdown -r now
		;;
	logout)
		sudo pkill -KILL -u ivan
		;;
	hibernate)
		systemctl hibernate
		;;
esac

