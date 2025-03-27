#!/bin/bash
USERID=$(id -u)
PACKAGENAME=$1
if [ $USERID -ne 0 ];then
  echo "Please run this script with root priveleges"
  exit 1
fi
    
dnf list installed mysql 

if [ $? -ne 0 ];then
   echo "$PACKAGENAME is not installed, installing $PACKAGENAME"
   dnf install $PACKAGENAME -y
   if [ $? -ne 0 ];then
      echo "$PACKAGENAME installation failed"
      exit 1
    else
      echo "$PACKAGENAME installation success"
    fi
else 
   echo "$PACKAGENAME is already installed, nothing to do"
fi
