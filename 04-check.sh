#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ur not root"
exit 1
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
echo "mysql installation is failed"
exit 1
else
echo "mysql installed"
fi

dnf install git -y