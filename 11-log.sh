#!/bin/bash 

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shell_script_logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOGFILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
      if [ $? -ne 0 ]
    then
        echo -e "$2 ...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi

}

echo "Script started executing at: $TIMESTAMP" &>>$LOGFILE_NAME

dnf list installed mysql &>>$LOGFILE_NAME

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y  &>>$LOGFILE_NAME
    VALIDATE $? "Installing MySQL"
else
    echo -e " MySQL is already ...$Y INSTALLED $N "
fi

dnf list installed git  &>>$LOGFILE_NAME

if [ $? -ne 0 ]
then # not installed
    dnf install git -y   &>>$LOGFILE_NAME
  
else
    echo -e "GIT is already ... $Y INSTALLED $N"
fi