#!/bin/bash

USERID=$(id -u)
#echo "User ID is $USERID"
if [ $USERID -ne 0 ]
then 
echo "Please run as root user"
exit 1
fi


dnf list install git -y
if [ $? -ne 0 ]
then
echo "Git installation failed"
dnf install git -y
if [ $? -ne 0 ]
then
echo "Git installation is not success..."
exit 1

else
echo "Git is already installed"
fi

git --version

