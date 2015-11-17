#!/bin/bash

## Question 1
## Read User Input: DirectoryName, Number
read -p "Please enter the name of directory:" name
read -p "Please enter the number of $name:" number

## Process the input and create directory
dirName="$name""_""$number"
mkdir "$dirName"
echo "Directory $dirName has been created!"

## Question 2
cd $dirName

## Read User Input: File, Number
read -p "Please enter the name of the file:" fileName
read -p "Please enter the number of files that you wish to create:" count

## Process the input and create files
for i in $(seq 1 $count)
do
	file="$fileName""_""$i"
	touch $file
	echo "$file has been created!"
done

## Question 3
## Check file nameList exist or not, 
## If not exist create one default file
cd ../

nameList="nameList"
test -f $nameList && echo "File Found!" || ( echo "File not exist!"; touch $nameList; echo "File $nameList created!" )

while(true)
do
	echo -e "Press Ctrl+C to terminate this process\n"
	echo -e "----------------------------------------\n"
	echo -e "Please make a choice below:\n"
	echo -e "1: Add a name into name list\n"
	echo -e "2: Delete a name from name list\n"
	echo -e "3: Show all the names consist within name list\n"

	## Read User Input: Choices
	read -p "Enter your choice here: " choice
	case $choice in
		1)
			read -p "Please insert the name you wish to add into file: " inputName
			echo $inputName >> $nameList && echo "$inputName has been added to $nameList!" || "Failed to add $inputName to $nameList!"
			;;
		2)
			read -p "Please insert the name you wish to delete: " nameToDelete
			sed -e "/$nameToDelete/ {N; d;}" $nameList && echo "$nameToDelete already been deleted from the files" || echo "$nameToDelete failed to deleted in files"		
			;;
		3)
			clear
			cat $nameList
			;;
	esac
		
done
