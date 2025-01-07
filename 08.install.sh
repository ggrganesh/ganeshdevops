#!/bin/bash 

USERID=$id -u

if [ $USERID -ne 0 ]
then
  echo "ERROR:: You must have sudo access to execute this script"
  exit 1 #other than 0
fi

dnf list installed mysql 

if [$? -ne 0]
then # not installed mysql start installing 
dnf install mysql -y

if [$? -ne 0 ]
then 
   echo "Installing MySQL....Failure"
   exit 1
else 
  echo "Insalled MySql .....Success"
fi

dnf list installed git

if [$? -ne 0]
then # not installed mysql start installing 
dnf install git -y

if [$? -ne 0 ]
then 
   echo "Installing git....Failure"
   exit 1
else 
  echo "Insalled git .....Success"
fi