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

        echo $timestamp > ./$filename.list

        UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

        echo $UniqueID >> ./$filename.list

        read -p "What is your favorite color? " question1_ans
        read -p "Do you prefer mexican food over italian food? " question2_ans 
        read -p "What's your remedy for a sweet tooth? " question3_ans
        read -p "What do you want to do when you grow up? " question4_ans 
        read -p "Where is your dream vacation location? " question5_ans

        echo $question1_ans >> ./$filename.list
        echo $question2_ans >> ./$filename.list
        echo $question3_ans >> ./$filename.list
        echo $question4_ans >> ./$filename.list
        echo $question5_ans >> ./$filename.list

        paste -d, -s ./$filename.list >> ./$filename.csv
    fi

    if [ $over_app_var == "overwrite" ];
    then
        timestamp=$(date +"%F_%T")

        echo $timestamp > ./$filename.list

        UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

        echo $UniqueID >> ./$filename.list

        read -p "What is your favorite color? " question1_ans
        read -p "Do you prefer mexican food over italian food? " question2_ans 
        read -p "What's your remedy for a sweet tooth? " question3_ans
        read -p "What do you want to do when you grow up? " question4_ans 
        read -p "Where is your dream vacation location? " question5_ans

        echo $question1_ans >> ./$filename.list
        echo $question2_ans >> ./$filename.list
        echo $question3_ans >> ./$filename.list
        echo $question4_ans >> ./$filename.list
        echo $question5_ans >> ./$filename.list

        paste -d, -s ./$filename.list > ./$filename.csv
    fi
fi

if [ ! -e $filename.csv ];
then
    timestamp=$(date +"%F_%T")

    echo $timestamp > ./$filename.list

    UniqueID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1)

    echo $UniqueID >> ./$filename.list

    read -p "What is your favorite color? " question1_ans
    read -p "Do you prefer mexican food over italian food? " question2_ans 
    read -p "What's your remedy for a sweet tooth? " question3_ans
    read -p "What do you want to do when you grow up? " question4_ans 
    read -p "Where is your dream vacation location? " question5_ans

    echo $question1_ans >> ./$filename.list
    echo $question2_ans >> ./$filename.list
    echo $question3_ans >> ./$filename.list
    echo $question4_ans >> ./$filename.list
    echo $question5_ans >> ./$filename.list

    paste -d, -s ./$filename.list > ./$filename.csv
fi