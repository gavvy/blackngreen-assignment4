#!/bin/bash
read -p "Which .csv file would you like to use? " filename

if [ -e $filename.csv ];
then
    read -p "Would you like to overwrite or append that file? " over_app_var

    until [ $over_app_var == "overwrite" ] || [ $over_app_var == "append" ];
    do
        read -p 'Please enter "overwrite" or "append" ' over_app_var
    done

    if [ $over_app_var == "append" ];
    then
        timestamp=$(date +"%F_%T")

        UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

        read -p "What is your favorite color? " question1_ans
        read -p "Do you prefer mexican food over italian food? " question2_ans 
        read -p "What's your remedy for a sweet tooth? " question3_ans
        read -p "What do you want to do when you grow up? " question4_ans 
        read -p "Where is your dream vacation location? " question5_ans

        echo "$timestamp, $UniqueID, $question1_ans, $question2_ans, $question3_ans, $question4_ans, $question5_ans" >> $filename.csv
    fi

    if [ $over_app_var == "overwrite" ];
    then
        timestamp=$(date +"%F_%T")

        UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

        read -p "What is your favorite color? " question1_ans
        read -p "Do you prefer mexican food over italian food? " question2_ans 
        read -p "What's your remedy for a sweet tooth? " question3_ans
        read -p "What do you want to do when you grow up? " question4_ans 
        read -p "Where is your dream vacation location? " question5_ans

        echo "$timestamp, $UniqueID, $question1_ans, $question2_ans, $question3_ans, $question4_ans, $question5_ans" > $filename.csv
    fi
fi

if [ ! -e $filename.csv ];
then
    timestamp=$(date +"%F_%T")

        UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

        read -p "What is your favorite color? " question1_ans
        read -p "Do you prefer mexican food over italian food? " question2_ans 
        read -p "What's your remedy for a sweet tooth? " question3_ans
        read -p "What do you want to do when you grow up? " question4_ans 
        read -p "Where is your dream vacation location? " question5_ans

        echo "$timestamp, $UniqueID, $question1_ans, $question2_ans, $question3_ans, $question4_ans, $question5_ans" > $filename.csv
fi