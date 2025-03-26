#!/bin/bash
FRUITS=("mango" "banana" "grapes" "orange")

echo "first fruit is ${FRUITS[0]}"
echo "second fruit is ${FRUITS[1]}"
echo "third fruit is ${FRUITS[2]}"
echo "fourth fruit is ${FRUITS[3]}"
echo "all fruits are ${FRUITS[@]}"
echo "number of fruits are ${#FRUITS[@]}"