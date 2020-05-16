function gco
{
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	if [ -z "$branch" ]
	then
		echo "Error, not in git project"
	else
		git commit -m "[$branch] "$*""
	fi
}

gco $1
