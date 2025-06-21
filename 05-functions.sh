#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ur not root"
    exit 1
fi

# we are writing the function
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation is failed"
        exit 1
    else
        echo "$2 installed"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "mysql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo "git is already is installed"
f