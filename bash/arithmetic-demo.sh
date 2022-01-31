#!/bin/bash
#arithmetic-demo.sh
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label
# 
echo ""
echo "We are going to add and multiply three numbers."
echo ""
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2
read -p "Enter the third number: " num3
echo ""
echo "The first number is $num1"
echo "The second number is $num2"
echo "The third number is $num3"
echo ""

sum=$(($num1 + $num2 + $num3))
mul_total=$(($num1 * $num2 * $num3))
echo "The sum of three numbers is: $sum, the product of three numbers is: $mul_total"
echo ""
echo $sum
echo $mul_total
