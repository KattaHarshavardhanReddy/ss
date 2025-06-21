#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
echo "ur not root"
fi
dnf install mysqll -y
dnf install git -y