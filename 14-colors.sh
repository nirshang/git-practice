#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ];then
       echo "Please run this script with root priveleges"
       exit 1
    else
       echo "You are root user"
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ];then
       echo -e "$2 is .... $R failed $N"
       exit 1
    else
       echo -e "$2 is $G success $N"
    fi
}

CHECK_ROOT

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