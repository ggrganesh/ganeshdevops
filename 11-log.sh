#!/bin/bash 

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOG_FOLDER=$"/var/log/shell_script_logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%M-%D-%H-%M-%S )
LOGFILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
      if [ $? -ne 0 ]
    then
        echo -e "$2 ...$R FAILURE"
        exit 1
    else
        echo -e "$2...$G SUCCESS"
    fi

}

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e " MySQL is already ...$Y INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then # not installed
    dnf install git -y
  
else
    echo -e "GIT is already ... $Y INSTALLED"
fi