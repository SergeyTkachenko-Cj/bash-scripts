#!/bin/bash

echo "Capital letter script"
echo "Enter directory path"
read drktr

for filename in $drktr/*
do	
	vrb="$( echo $(basename "${filename%.*}") | tr '[a-z]' '[A-Z]' )"
	mv $filename $drktr/$vrb
done