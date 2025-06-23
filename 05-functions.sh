#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/ss-logs/"
logs_files="$(echo $0 | cut -d "." -f1)"
Timestamp= $(date +%y-%m-%d-%H-%M-%S)
Log_Name="$logs_folder/$logs_files-$Timestamp.log"

echo " Script started at: $Timestamp " &>>Log_Name

if [ $USERID -ne 0 ]
then
    echo "ur not root"
    exit 1
fi

# we are writing the function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation is $R failed"
        exit 1
    else
        echo -e "$2 $G installed"
    fi
}

dnf list installed mysql &>>Log_Name
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>Log_Name
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already $Y installed"
fi

dnf list installed git &>>Log_Name
if [ $? -ne 0 ]
then
    dnf install git -y &>>Log_Name
    VALIDATE $? "installing git"
else
    echo -e "git is already is $Y installed"
fi