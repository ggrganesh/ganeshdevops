#!/bin/bash 

USERID=$(id -u)

VALIDATE(){
      if [ $? -ne 0 ]
    then
        echo  "$2 ... FAILURE"
        exit 1
    else
        echo  "$2... SUCCESS"
    fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo  " MySQL is already ... INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
  
else
    echo  "GIT is already ...  INSTALLED"
fi