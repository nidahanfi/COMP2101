#!/bin/bash

#login-message.sh
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############

#title='%A'
#read -p "Enter your username: " user
#echo "Thank you for your username $user"
#echo ""
#read -p "Enter your hostname: " hostname
#echo "Your hostname is: $hostname"
#echo ""
#now="$(date)"
#echo "Current date and time is %s\n" "$now"
#echo $now
#echo $title
#echo "Welcome $user, Today on $now you created hostname as $hostname"
#echo ""
###############
# Variables   #
###############
title="Overlord"
myname="dennis"
hostname=$(hostname)

###############
# Main        #
###############
#cat <<EOF

#Welcome to planet $hostname, "$title $myname!"

#EOF
read -p "Please input your username:" USER
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.
HH=$(date +%H)
MM=$(date +%M)
APM=$(date +%p)
weekday=$(date +%A)


echo "Welcome to planet $USER!" |cowsay
