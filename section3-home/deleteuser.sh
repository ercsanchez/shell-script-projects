#!/bin/bash

# delete created users to start over

# show users in local system
cut -d: -f1 /etc/passwd

# prompt for the user to delete
read -p 'Type the user you want to delete: ' USER_TO_DELETE

# delete user
userdel -r ${USER_TO_DELETE}

# show list of users again
cut -d: -f1 /etc/passwd

echo "check if the user has been deleted"

exit 0
