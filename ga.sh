#!/bin/bash

# Git Automation process made for Linux distros.
# This was made because of the repetetive token request on Linux distros.
# Configure your username, token and git repo as portrayed below.

# Configure these
username="belain3d"
token="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"
linktorepo="github.com/belain3d/linux-git-automation.git"

# This is for --help and -h
filename="./ga.sh"

# Program begins here
if [ "$1" == "" ]
then
	echo "Specify an argument. See --help or -h for more information."
	exit 1
elif [ "$1" == "--help" -o "$1" == "-h" ]
then
	echo "--------------------------------------------------"							 
	echo "| $filename add filename (or .)	      		 |"
	echo "| $filename commit \"message\"	      		 |"
	echo "| $filename push |branch|		      		 |"
	echo "| $filename pull |branch|		      		 |"
	echo "| $filename status		      		 |"
	echo "| $filename clone			      		 |"
	echo "| $filename branch |-d|--delete|branch|	         |"
	echo "| $filename checkout |branch|	      		 |"
	echo "--------------------------------------------------"
	
fi

if [ "$1" == "clone" ]
then
	git clone "https://"$username":$token@$linktorepo" | grep $linktorepo | cut -d "/" -f 3 | cut -d "." -f 1
                               
                              

elif [ "$1" == "pull" ]
then
	git pull "https://$username:$token@$linktorepo"

elif [ "$1" == "add" ]
then
	if [ "$2" == $2 ]
	then
		git add $2
		if [ $? -ne 0 ]
		then
			echo !!
		fi
	fi

elif [ $1 == "commit" ]
then
	if [ "$2" == "$2" ]
	then
		git commit -m "$2"
	fi

elif [ "$1" == "status" ]
then
	git status

elif [ "$1" == "push" ]
then
	git push "https://$username:$token@$linktorepo" $2
	
elif [ "$1" == "branch" ]
then
	if [ -z $2 ]
	then
		git branch
	elif [ "$2" == "-d" -o "$2" == "--delete" ]
	then
		if [[ "$3" == "$3" ]]
		then
			git branch -d $3
		fi
	elif [[ -n "$2" ]] # opposite is -z, -n is true if the length of string is non-zero
	then
		echo "Created branch $2"
		git branch $2
	fi

elif [ "$1" == "checkout" ]
then
	if [ -z $2 ]
	then
		git checkout
	
	elif [ -n $2 ]
	then
		git checkout $2
	fi
fi
