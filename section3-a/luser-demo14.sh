#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.

# Ask for the user name
read -p 'Input your username: ' USER_NAME

# Ask for the real name.
read -p 'Input your real name: ' COMMENT

# Ask for the password.
read -p 'Input your password: ' PASSWORD

# Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force the user to change password on first login. 
passwd -e ${USER_NAME}

exit 0


