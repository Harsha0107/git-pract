#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p "$LOGS_FOLDER"

# Color codes
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
B="\e[34m"  # Blue
M="\e[35m"  # Magenta
C="\e[36m"  # Cyan
W="\e[37m"  # White
N="\e[0m"   # Reset

USERID=$(id -u)

# Function to check if script is run as root
CHECK_ROOT() {
  if [ "$USERID" -ne 0 ]; then
    echo -e "${R}Please run with root privileges${N}" | tee -a "$LOG_FILE"
    exit 1
  fi
}

# Function to validate command success
VALIDATE() {
  if [ $? -ne 0 ]; then
    echo -e "${R}FAILED: $1${N}" | tee -a "$LOG_FILE"
    exit 1
  else
    echo -e "${G}SUCCESS: $1${N}" | tee -a "$LOG_FILE"
  fi
}

# Function to show usage
USAGE() {
  echo -e "${R}USAGE: sudo bash $SCRIPT_NAME.sh package1 package2 package3...${N}"
  exit 1
}

echo "Script started on: $(date)" >> "$LOG_FILE"

CHECK_ROOT

if [ $# -eq 0 ]; then
  USAGE
fi

for package in "$@"; do
  dnf list installed "$package" &>> "$LOG_FILE"
  if [ $? -ne 0 ]; then
    echo "$package is not installed. Installing now..." | tee -a "$LOG_FILE"
    dnf install "$package" -y &>> "$LOG_FILE"
    VALIDATE "$package installation"
  else
    echo -e "$package is already ${Y}installed${N}" | tee -a "$LOG_FILE"
  fi
done
