#!/bin/bash

# CENTOS7 SCRIPT
# SECTION3 EXERCISE2: CREATE USER ACCOUNTS ON THE SAME LINUX SYSTEM WHERE SCRIPT IS EXECUTED
# script name: add-local-user.sh

# Requirements:
# enforces that script is executed with superuser privileges, if not return an exit status of 1
# prompts person who executed script to enter username login, name for person who will be using account, initial password for account
# creates a new user on local system with input provided by user
# informs user if account was not able to be created for some reason; if account not created, return exit status of 1
# displays the username, password, and host where account was created so that you can deliver the info to new account holder/user

# Make sure script is being executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then 
  echo 'Please run with sudo or as root'
  exit 1
fi

# Get the username (login)
read -p 'Enter the username to create: ' USER_NAME

# Get the real name/application name (contents for the description field)
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Get the password
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the account
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded
# We don't want to tell the user that an account was created when it wasn't.
if [[ "${?}" -ne 0 ]]
then 
  echo 'The account could not be created.'
  exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# check if passwd command succeeded and the password was properly set
if [[ "${?}" -ne 0 ]]
then 
  echo 'The password for the account could not be set'
  exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created
echo 
echo 'username:'
echo ${USER_NAME}
echo
echo 'password:'
echo ${PASSWORD}
echo
echo 'host:'
echo ${HOSTNAME}
exit 0



