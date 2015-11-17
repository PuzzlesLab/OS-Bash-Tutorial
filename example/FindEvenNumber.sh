#!/bin/bash

for i in {0..10}
do
	echo "Using Test"
	echo "----------------"
	if test $(( i%2 )) -eq 0
	then
		echo -e "Even: $i \n"
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
