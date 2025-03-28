#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ];then
       echo -e " $R Please run this script with root priveleges $N" &>> $LOG_FILE
       exit 1
    else
       echo "You are root user"
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ];then
       echo -e "$2 is .... $R failed $N" &>> $LOG_FILE
       exit 1
    else
       echo -e "$2 is $G success $N" &>> $LOG_FILE
    fi
}

CHECK_ROOT

for package in $@
do
   dnf list installed $package &>> $LOG_FILE
   if [ $? -ne 0 ]
   then
       echo "The package $package is not installed...going to install it" &>> $LOG_FILE
       sudo dnf install -y $package &>> $LOG_FILE
       VALIDATE $? "installing package"
   else
       echo -e "The package $package is already $y installed $N" &>> $LOG_FILE
    fi
done