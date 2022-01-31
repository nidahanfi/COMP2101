#!/bin/bash
#improveddice.sh
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
#  put the bias, or minimum value for the generated number in another variable
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
for i in {1..5}
do
echo "You rolled a..."
echo $(($RANDOM % 6 + 1))
done
# roll the dice and save the results
die1=$(( RANDOM % 6 + 1))
die2=$(( RANDOM % 6 + 1 ))
total=$((die1 + die2))
echo "The sum of the dice is: " $total
average=$((total/2))
echo "The average of the dice is: " $average

# display the results
echo "Rolled $die1, $die2"
