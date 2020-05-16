#!/bin/bash

search=$( cat ~/.bashrc | grep "source ~/fancy_tools/.aliases" )
if [ -z "$search" ];
then
	echo "source ~/fancy_tools/.aliases">>~/.bashrc
fi

search=$( cat ~/.bashrc | grep "source ~/fancy_tools/fancy_functions.sh" )
if [ -z "$search" ];
then
        echo "source ~/fancy_tools/fancy_functions.sh">>~/.bashrc
fi

if [ ! -d ~/bin ]
then
	mkdir ~/bin
	cp ~/fancy_tools/updateFancyTools ~/bin
else
	cp ~/fancy_tools/updateFancyTools ~/bin
fi

echo "export PATH=$PATH:~/bin">>~/.bashrc

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ "$branch" = "master" ]
then
	mkdir ~/src
	cd ~/src
	git clone https://github.com/Zaheer180899/fancy_tools.git
	search=$( cat ~/.bashrc | grep "export PATH=$PATH:~/fancy_tools/src" )
	if [ -z "$search" ];
	then
        	echo "export PATH=$PATH:~/fancy_tools/src">>~/.bashrc
	fi
else
	git checkout master
	mkdir ~/src
	cd ~/src
	git clone https://github.com/Zaheer180899/fancy_tools.git
	search=$( cat ~/.bashrc | grep "export PATH=$PATH:~/fancy_tools/src" )
        if [ -z "$search" ];
        then
                echo "export PATH=$PATH:~/fancy_tools/src">>~/.bashrc
        fi
fi
