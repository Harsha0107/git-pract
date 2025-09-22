#!/bin/bash

USERID=$(id -u)

#echo "User ID is $USERID"
if [ $USERID -ne 0 ]
then
  echo "Please run as root user"
fi

dnf install git -y
echo "Git installed successfully"
