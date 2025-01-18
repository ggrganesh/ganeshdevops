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

if [ $USERID -ne 0 ]
then
   echo "ERROR:: You must have sudo access to execute this script"
   exit 1 #other than 0
fi

for package in $@
do 
     dnf installed $package &>>$LOGFILE_NAME
     if [ $? -ne 0 ]
     then
        dnf install $package -y &>>$LOGFILE_NAME
        VALIDATE $? "installing $package"
     else
        echo "$package already $Y Installed $N"
     fi
done 