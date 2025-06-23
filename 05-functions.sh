#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

#logs_folder="/var/logs/ss-logs/

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

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already $Y installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo -e "git is already is $Y installed"
fi