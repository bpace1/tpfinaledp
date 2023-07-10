#!/bin/bash

for file in ./dir/*
do
	if [[ ${file:6} =~ ^[A-Z]{1}[a-z]+(([ ]{1}[][A-Z]{1}[a-z]+)?)$ ]]
		then	
		convert "$file" -resize 512x512! "$file"
	fi
done
exit 0
