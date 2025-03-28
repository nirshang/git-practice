#!/bin/bash

for package in $@
do
   dnf list installed $package
   if [ $? -ne 0 ]
   then
       echo "The package $package is not installed...going to install it"
       sudo dnf install -y $package
       if [ $? -ne 0 ]
       then
           echo "The package $package failed to install"
       else
           echo "The package $package installed successfully"
       fi
   else
       echo "The package $package is already installed"
done
