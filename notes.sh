#!/bin/bash


################################################################################
# Creator: Ernest Duckworth IV
# Date: 09/14/2021
# For: to be placed in .bash_aliases file for future use in taking notes
# Description: 
#              - If theres an argument use that for title of name
#              - Check if title is already existing in directory
#              - Create if instance does not already exist
################################################################################

#Colors for stdout stream
NO='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'
RU='\033[4;31m'
GU='\033[4;32m'
OU='\033[4;33m'

#acts as main for our program called at bottom of page
run () {
   getFileName $1
   checkFile $file
   createFile $file
}

# Checks if there is a 1st argument for naming 
# if not uses date
getFileName () {
   if [[ ${#1} -eq 0 ]]
   then
      file="$(date +%a-%m-%d-%y).txt"
   else
      file="$1.txt"
   fi
}

# Checks if file exists before creation
checkFile () {
   if [[ $# -ne 1 ]]
   then
      echo -e "${R}Check file requires 1 argument only (file name)${NO}"
      return 1
   fi
   if [[ -f $1 ]]
   then
      echo -e "${R}File: ${RU}$1${R} already exists${NO}"
      read -p "New file: " file
      file=$file.txt
      checkFile $file
   fi
}

createFile () {
   touch $1
   echo -e "${G}Successfuly created file ${GU}$file${NO}"
   return 0
}

run $1

