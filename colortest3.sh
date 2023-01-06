#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
WHITE='\033[0;37m'
RESET='\033[0m'


DisplayResults() {
	if [ "$?" == "0" ]; then
		        echo -e "${GREEN}String exists in README file${RESET}"
		else
			        echo -e "${RED}String does NOT exist in README file${RESET}"
	fi
}

DisplayResults2() {
if [ "$?" == "0" ]; then
        echo -e "${GREEN}String ${SearchString} exists in README file${RESET}"
else
        echo -e "${RED}String ${SearchString} does NOT exist in README file${RESET}"
fi
}

DisplayResults3() {
	if [ "$?" == "0" ]; then
		        echo -e "${GREEN}String $SearchString exists in README file${RESET}"
		else
		        echo -e "${RED}String $SearchString does NOT exist in README file${RESET}"
	fi
}

DisplayResults4() {
	echo " "
	 if [ "$?" == "0" ]; then
		echo -e "${GREEN}String ${WHITE}$SearchString${GREEN} exists in file ${FILE}.${RESET}"
	else
		echo -e "${RED}String ${WHITE}$SearchString${RED} does NOT exist in file ${FILE}.${RESET}"
	fi
#	echo " "
}


Test1() {
	FILE="TestFile1"
	SearchString="supersillystring"
	echo -e "${WHITE}Search String Is: ${BLUE}$SearchString${RESET}."
	echo -e "${WHITE}Search File Is: ${BLUE}${FILE}${RESET}."
	grep -iw $SearchString $FILE
	DisplayResults4
}

Test2() {
	FILE="TestFile2"
	SearchString="stringissupersilly"
	echo -e "${WHITE}Search String Is: ${BLUE}$SearchString${RESET}."
	echo -e "${WHITE}Search File Is: ${BLUE}${FILE}${RESET}."
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
