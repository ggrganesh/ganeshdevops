#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ];then
 
 echo "Error: User does'nt have sudo permission to run this script"
 exit 1  #Not other than 0 
fi   

install_package (){
  local package=$1
  echo "checking $package is insalled ..."  
  dnf list installed $package &>/dev/null
  if [ $? -ne 0];then
  echo "$package is not found installing...."
  dnf install $package -y &>/dev/null
  if [ $? -ne 0 ];then
  echo "Install $package failure "
  exit 1 
  else 
  echo "Install $package Success"
  fi  
  else
  echo "$package is already installed"
  fi
}

# Check and install MySQL
install_package nginx

# Check and install Git
install_package telnet 