#!/bin/bash

# Git Automation process made for Linux distros.
# This was made because of the repetetive token request on Linux distros.
# Configure your username, token and git repo as portrayed below.

# Configure these
username="belain3d"
token="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"
linktorepo="github.com/belain3d/linux-git-automation.git"

# These are color codes

fncolor='\e[36m'      # Cyan
commandcolor='\e[93m' # Yellow
argcolor="\e[34m"     # Blue
ENDCOLOR='\e[0m'

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
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}add${ENDCOLOR} ${argcolor}filename (or .)${ENDCOLOR}	      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}commit${ENDCOLOR} ${argcolor}\"message\"${ENDCOLOR}	      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}push${ENDCOLOR} ${argcolor}|branch|${ENDCOLOR}		      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}pull${ENDCOLOR} ${argcolor}|branch|${ENDCOLOR}		      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}status${ENDCOLOR}		      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}clone${ENDCOLOR}			      		 |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}branch${ENDCOLOR} ${argcolor}|-d|--delete|branch|${ENDCOLOR}	         |"
	echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}checkout ${argcolor}|branch|${ENDCOLOR}	      		 |"
        echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}--copytobin ${argcolor} copies to /usr/local/bin${ENDCOLOR}	 |"
        echo -e "| ${fncolor}$filename${ENDCOLOR} ${commandcolor}--edit ${argcolor} edits in /usr/local/bin${ENDCOLOR}	 |"
echo "--------------------------------------------------"

fi

if [ "$1" == "clone" ]
then
	git clone "https://"$username":$token@$linktorepo" | grep $linktorepo | cut -d "/" -f 3 | cut -d "." -f 1

elif [ "$1" == "--copytobin" ]; then
	sudo cp ./ga.sh /usr/local/bin/ga

elif [ "$1" == "--edit" -o "$1" == "-e" ]; then
	sudo nano "/usr/local/bin/ga"


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
