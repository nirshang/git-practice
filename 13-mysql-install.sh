#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
  echo "Please run this script with root priveleges"
  exit 1
fi
    
dnf list installed mysql 

if [ $? -ne 0 ];then
   echo "mysql is not installed, installing mysql"
   dnf install mysql -y
   if [ $? -ne 0 ];then
      echo "mysql installation failed"
      exit 1
    else
      echo "mysql installation success"
    fi
else 
   echo "mysql is already installed, nothing to do"
fi

dnf list installed git

if [ $? -ne 0 ]; then
   echo "git is not installed, installing git"
   dnf install git -y
   if [ $? -ne 0 ];then
      echo "git installation failed"
      exit 1
    else
      echo "git installation success"
    fi
else
   echo "git is already installed, nothing to do"
fi