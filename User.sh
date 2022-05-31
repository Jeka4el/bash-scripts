#!/bin/bash
echo -n "Enter user name:> "
read user
if grep $user /etc/passwd > /dev/null
then
echo "User $user exist"
else
echo "User $user not found"
fi
