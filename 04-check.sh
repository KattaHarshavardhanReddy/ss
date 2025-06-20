#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]
then
echo "ur not root"
exit 1
fi