#!/bin/bash
read -p "please enter the number:" number

if [ "$number" -gt 20 ];
then
echo "number is greater than 20"
else
echo "number is less than or equal to 20"
fi
