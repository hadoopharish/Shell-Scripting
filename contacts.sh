#!/usr/bin/env bash

#=================================
#Script to manage conacts database
#Version: 1.0
#Author: Harish
#=================================

function usage () {
  # This function is used to display help for the user
  # basename here will takeout only filename from full path
  # $0 is a special variable that will store the script name
  # 1>&2 will redirect the message to stderror
  echo "Usage: `basename $0` $*" 1>&2
  exit 2  #exit out with code other than zero specifying script ran failed
}

function dec_line () {
  # This function will take all the arguments passed to it and will print out
  # $* contains all the arguments passed
  clear
  echo "************ $* **************"
}

function addcontact () {
  echo -e "please enter the following contact details\n"
  read -p "Given name: " name
  read -p "Surname: " surname
  read -p "Address: " address
  read -p "City: " city
  read -p "State: " state
  read -p "Zip: " zip
  echo -e "\nAre the details entered correct?(Y or N) \c"
  read answer
  if [ $answer = "N" ]; then
      addcontact
  else
      echo "$name:$surname:$address:$city:$state:$zip" >> $1
      echo "contact added successfully!"
      read x
  fi
}

function viewcontact () {
  echo -e "First Name\t\tSurname\t\tAddress\t\tCity\t\tState\t\tZip"
  echo -e "=========================================================================="
  while read p; do
      IFS=":"
      q=($p)
      echo -e "${q[0]}\t\t${q[1]}\t\t${q[2]}\t\t${q[3]}\t\t${q[4]}\t\t${q[5]}"
  done < $1
  read x
}

function searchcontact () {
  echo -e "enter the keyword to search: \c"
  read key
  grep "$key" $1 > output
  viewcontact output
}

function deletecontact () {
  echo -e "enter the keyword to delete: \c"
  read delkey
  grep "$delkey" $1 > delfile
  viewcontact delfile
  read -p "these contacts will be deleted, are you sure?: (Y or N) " option
  if [ $option = "Y" ]; then
      sed '/'$delkey'/d' $1 > file
      cat file > $1 
      echo "deleted"
      read x
  fi
}
  
if [ $# -lt 1 ]; then
	usage "<filename>"
fi

clear
echo -e "\tSHELL PROGRAMMING DATABASE\n\t\tMAIN MENU" 

# while with true will loop for ever, until we exit out explicitly
while true
do
  #Menu that we want to show to the user
  echo "What do you wish to do?"
  echo "1.  Create records"
  echo "2.  View records"
  echo "3.  Search for records"
  echo "4.  Delete records that match a pattern"
  #echo -e will allow it to recognize special symbols in this case \c
  #which will cause the echo to supress new line and stay at the current line
  echo -e "Answer (or 'q' to quit)? \c"
  read choice

[ "$choice" = "" ] && continue
 
  #Using case to sort out which function to call
  case $choice in
    1)
      dec_line "Creating Contact"
      addcontact $1
      ;;
    2)
      dec_line "Viewing Contacts"
      viewcontact $1
      ;;
    3)
      dec_line "Searching Contacts"
      searchcontact $1
      ;;
    4)
      dec_line "Deleting Contacts"
      deletecontact $1
      ;;
    q)
      clear
      exit 0
      ;;
    *)
      echo "Only takes 1..4 and q to exit"
      ;;
  esac
done
