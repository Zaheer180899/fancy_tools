#!/bin/bash

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
if [ "$branch" = "master" ]
then
	mkdir ~/src
	cd ~/src
	git clone https://github.com/Zaheer180899/fancy_tools.git
	search=$( cat ~/.bashrc | grep "export PATH=$PATH:~/src/fancy_tools" )
	if [ -z "$search" ];
	then
        	echo "export PATH=$PATH:~/src/fancy_tools">>~/.bashrc
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

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

search=$( cat ~/.bashrc | grep "source /$DIR/fancy_tools/.aliases" )
if [ -z "$search" ];
then
	echo "source /$DIR/src/fancy_tools/.aliases">>~/.bashrc
fi

search=$( cat ~/.bashrc | grep "source /$DIR/fancy_tools/fancy_functions.sh" )
if [ -z "$search" ];
then
        echo "source /$DIR/src/fancy_tools/fancy_functions.sh">>~/.bashrc
fi

if [ ! -d ~/bin ]
then
	mkdir ~/bin
	cp /$DIR/fancy_tools/updateFancyTools ~/bin
else
	cp /$DIR/fancy_tools/updateFancyTools ~/bin
fi

echo "export PATH=$PATH:~/bin">>~/.bashrc
