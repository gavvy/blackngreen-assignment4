#!/bin/bash
#add timestamp to desired file
timestamp=$(date +"%F_%T")
echo "In which csv file would you like to save these results? Do not include .csv"
read FILENAME
echo "Would you like to overwrite or append to that file? [o/a]"
read CHOICE
echo $timestamp >./$FILENAME.list
#generate randomID
UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

echo $UniqueID >> ./$FILENAME.list
#bold output
bold=$(tput bold)


#ask questions
read -p "${bold}What is your favorite color? "  question1_ans
read -p "${bold}Do you prefer Mexican food over Italian food? " question2_ans 
read -p "${bold}What's your remedy for a sweet tooth? " question3_ans
read -p "${bold}What do you want to do when you grow up? " question4_ans 
read -p "${bold}Where is your dream vacation location? " question5_ans

#pipe questions
echo $question1_ans >> ./$FILENAME.list
echo $question2_ans >> ./$FILENAME.list
echo $question3_ans >> ./$FILENAME.list
echo $question4_ans >> ./$FILENAME.list
echo $question5_ans >> ./$FILENAME.list
#append or overwrite desired csv file
if [[ "$CHOICE" == "o" ]]; then paste -d, -s ./$FILENAME.list > ./$FILENAME.csv 
 
elif [[ "$CHOICE" == "a" ]]; then paste -d, -s ./$FILENAME.list >> ./$FILENAME.csv
echo "The responses have been recorded."
fi 