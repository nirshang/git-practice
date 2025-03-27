#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ];then
       echo "$2 is failed"
       exit 1
    else
       echo "$2 is success"
    fi
}

if [ $USERID -ne 0 ];then
  echo "Please run this script with root priveleges"
  exit 1
fi
    
dnf list installed mysql 

if [ $? -ne 0 ];then
   echo "mysql is not installed, installing mysql"
   dnf install mysql -y
   VALIDATE $? "mysql installation"
else
   echo "mysql is already installed, nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]; then
   echo "git is not installed, installing git"
   dnf install git -y
   VALIDATE $? "git installation"
else
   echo "git is already installed, nothing to do"
fi