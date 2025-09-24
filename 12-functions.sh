#!/bin/bash

USERID=$(id -u)
#echo "User ID is $USERID"

VALIDATE(){
echo "exist status is $1"

}


if [ $USERID -ne 0 ]
then 
echo "Please run as root user"
exit 1
fi

dnf list install git -y
VALIDATE $?

# if [ $? -ne 0 ]
# then
#     echo "Git installation failed"
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "Git installation is not success..."
#     exit 1
#     else
#         echo "Git installation is successful"
#     fi
# else
#         echo "Git is already installed"
# fi


# dnf list installed mysql -y
# if [ $? -ne 0 ]
# then
# echo "mysql is not installed"
# dnf install mysql -y
# if [ $? -ne 0 ]
# then
# echo "mysql installation is not success..."
# exit 1
# else
# echo "mysql installation is successful"
# fi
# else
# echo "mysql is already installed"
# fi
