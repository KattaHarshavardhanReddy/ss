#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ur not root"
exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]

then

dnf install mysql -y

if [ $? -ne 0 ]
then
echo "mysql installation is failed"
exit 1
else
echo "mysql installed"
fi

else
echo "myswl is already installed"
fi

dnf install git -y

if [ $? -ne 0 ]
then
echo "git installation is failed"
exit 1
else
echo "git installed"
fi
