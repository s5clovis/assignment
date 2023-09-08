#!/bin/bash

#This script create user by taking data from the CLI

echo "Welcome to EK-Tech Software Solutions.We will be creating your account in few moments"
printf "\n"
sleep 1
read -p "Please enter your desired username:" USERNAME
sleep 1
printf "\n"
read -p "Please enter your desired lastname:" LASTNAME
printf "\n"
sleep 2
read -s -p "Please enter your desired password:" PASSWORD
printf "\n\n"
echo "Thank you $USERNAME for providing your desired username and password. Please wait while we create an account for you"
# creating the user
useradd "$USERNAME"
# collecting the password earlier defined and attributing to the user
echo "$USERNAME:$PASSWORD" | chpasswd
# Adding user to the admin group and -a means append
usermod -aG admin $USERNAME
# creating the user dedicated home directory
mkdir -p /home/"$USERNAME" "$USERNAME"
# Set ownership of the home directory to the new user
chown -R "$USERNAME:$USERNAME" /home/"$USERNAME"
# Set permissions for the home directory
chmod 755 /home/"$USERNAME"
printf "\n\n"
echo "Congratulations! A new account has been created for you with the preferred Name $USERNAME and your confidential password"
printf "\n"
echo "Good bye"
