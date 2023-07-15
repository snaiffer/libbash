#!/bin/bash

# Example:
# printf "${b}my bold text${n}"
export b=$(tput bold)   # bold text
export n=$(tput sgr0)   # normal text
export yellow="\033[1;33;40m"   # yellow text

change_passwd() {
  user=$1
  pass=$2

  echo "Setting password for user: \"$user\""
  passwd $user &> /dev/null <<-EOF
$pass
$pass
EOF
}

# Example:
# printf "Operation_1 is in progress... "
# <your_operations>
# check_status
check_status() {
  if [[ "$?" != "0" ]]; then
    printf "There are some errors. Do you want to continue? ( y/n )... " && read answer
    if [[ "n" = "$answer" || "N" = "$answer" || "no" != "$answer" ]]; then
      echo "exit"
      exit 1
    fi
    echo "continue"
    return 0
  fi
  echo "done."
}

reboot_request() {
  printf "Press <Enter> to reboot... " && read && sudo reboot
}

checkif_root() {
  if [ $(whoami) != "root" ]; then
    echo "You should be root to perform it."
    exit -1
  fi
}

# Return exited username in variable $username
enter_existed_username() {
  while true; do
    echo
    printf "\tEnter user name=" && read username && \
    grep -w $username /etc/passwd &> /dev/null
    if [[ "$?" = "0" ]]; then
      break;
    else
      echo "Error: User with name $username isn't exist!"
    fi;
  done
  echo $username
}

