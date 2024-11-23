#!/bin/bash


## Source our color configs
# source bash_color_vars.sh

DisplayResults() {
	if [ "$?" == "0" ]; then
		        echo -e "${Green}String exists in README file${Reset}"
		else
			        echo -e "${Red}String does NOT exist in README file${Reset}"
	fi
}

DisplayResults2() {
if [ "$?" == "0" ]; then
        echo -e "${Green}String ${SearchString} exists in README file${Reset}"
else
        echo -e "${Red}String ${SearchString} does NOT exist in README file${Reset}"
fi
}

DisplayResults3() {
	if [ "$?" == "0" ]; then
		        echo -e "${Green}String $SearchString exists in README file${Reset}"
		else
		        echo -e "${Red}String $SearchString does NOT exist in README file${Reset}"
	fi
}

DisplayResults4() {
	echo " "
	 if [ "$?" == "0" ]; then
		echo -e "${Green}String ${WHITE}$SearchString${Green} exists in file ${FILE}.${Reset}"
	else
		echo -e "${Red}String ${WHITE}$SearchString${Red} does NOT exist in file ${FILE}.${Reset}"
	fi
#	echo " "
}


Test1() {
	FILE="TestFile1"
	SearchString="supersillystring"
	echo -e "${White}Search String Is: ${Blue}$SearchString${Reset}."
	echo -e "${White}Search File Is: ${Blue}${FILE}${Reset}."
	grep -iw $SearchString $FILE
	DisplayResults4
}

Test2() {
	FILE="TestFile2"
	SearchString="stringissupersilly"
	echo -e "${White}Search String Is: ${Blue}$SearchString${Reset}."
	echo -e "${White}Search File Is: ${Blue}${FILE}${Reset}."
	grep -iw $SearchString $FILE
	DisplayResults4
}

# Run Program
clear
echo " "
Test1
echo " "
echo " "
Test2
echo " "
