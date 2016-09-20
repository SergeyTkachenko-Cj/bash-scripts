#!/bin/bash

echo "Make empty random files script"
echo "You are in:"
pwd
echo "Do you want to create empty files here? (y/n)"
read -r location

if [ "$location" == y ]; 
then
	echo "How many files?"
	read quant
	re='^[0-9]+$'
		if ! [[ $quant =~ $re ]] ; 
		then
	   		echo "Error: Not a number" >&2; exit 1
	   	else
	   		file_nme=1
	   		while [ ${quant} -ge 1 ]
	   		do
	   			touch $file_nme ${pwd}
	   			let "file_nme++"
	   			let "quant--"
	   		done
		fi
elif [ "$location" == "n" ]
then
	echo "Go, change directory"
else
	echo "Incorrect input"
fi
