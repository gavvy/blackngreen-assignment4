#!/bin/bash

timestamp=$(date +"%F_%T")
echo "In which csv file would you like to save these results? Include .csv"
read FILENAME
echo "Would you like to overwrite or append to that file?"
read CHOICE
echo $timestamp >./example.list

UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

echo $UniqueID >> ./example.list

bold=$(tput bold)



read -p "${bold}What is your favorite color? "  question1_ans
read -p "${bold}Do you prefer Mexican food over Italian food? " question2_ans 
read -p "${bold}What's your remedy for a sweet tooth? " question3_ans
read -p "${bold}What do you want to do when you grow up? " question4_ans 
read -p "${bold}Where is your dream vacation location? " question5_ans


echo $question1_ans >> ./example.list
echo $question2_ans >> ./example.list
echo $question3_ans >> ./example.list
echo $question4_ans >> ./example.list
echo $question5_ans >> ./example.list

if [$CHOICE = overwrite] then {paste -d, -s ./example.list >> ./$FILENAME}
elif [$CHOICE = append] then {paste -d, -s ./example.list >> ./$FILENAME}