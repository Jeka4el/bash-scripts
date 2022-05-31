#!/bin/bash
echo -n "Enter first number:> "
read n1
echo -n "Enter second number:> "
read n2
if [ $n1 -gt $n2 ]
then
echo "The greater number is $n1"
else
echo "The greater number is $n2"
fi
