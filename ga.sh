#!/bin/bash

username="belain3d"
token="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"
filename="./ga.sh"
linktorepo="github.com/imkms/linux.git"

if [ "$1" == "" ]
then
	echo "Specify an argument. See --help or -h for more information."
	exit 1
elif [ "$1" == "--help" -o "$1" == "-h" ]
then
	echo "| $filename clone yourDesiredFolderName |"
	echo "| $filename push branch		      |"
	echo "| $filename pull branch		      |"
	
	exit 1
fi

if [ "$1" == "clone" ]
then
	git clone "https://"$username":$token@$linktorepo" | grep $linktorepo | cut -d "/" -f 3 | cut -d "." -f 1
                               
                              

elif [ "$1" == "pull" ]
then
	git pull "https://$username:$token@$linktorepo" $2

elif [ "$1" == "add" ]
then
	if [ "$2" == "." ]
	then
		git add .
	elif [ "$2" == "" ]
	then
		echo "Please add \".\" as second argument (this will add everything onto the stage.)"
	else
		echo "Invalid argument \"$2\""
	fi

elif [ $1 == "commit" ]
then
	if [ "$2" == "$2" ]
	then
		git commit -m $2 >> /dev/null
	fi

elif [ "$1" == "status" ]
then
	git status

elif [ "$1" == "push" ]
then
	git push "https://$username:$token@$linktorepo" $2
fi
