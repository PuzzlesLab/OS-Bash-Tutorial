#!/bin/bash

read -p "Please Enter The Values You wish to evaluate (This program will find all it's even numbers out):" number

declare -i evenCount=0

for i in $(seq 1 $number)
do
	echo "Using Test"
	echo "----------------"
	if test $(( i%2 )) -eq 0
	then
		echo -e "Even: $i \n"
		$(( evenCount++ ))
	else
		echo -e "Odd: $i \n"
	fi 


	echo "Using []"
	echo "----------------"
	if [ $(( i%2 )) == 0 ]
	then
		echo -e "Even: $i \n"
	else
		echo -e "Odd: $i \n"
	fi
done

echo -e "Total Even Number from 1 to $number: $evenCount"

exit 0
