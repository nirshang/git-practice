#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 50 ]
then
  echo "Given number $NUMBER is greater than 50"
else
  echo "Given number $NUMBER is less than 50"
fi