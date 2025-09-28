LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
R="\e[31m]"
G="\e[32m]"
Y="\e[33m]"
B="\e[34m]"

CHECK_ROOT() {
  if [ $USERID -ne 0 ]; 
  then
    echo -e "$R please run as root PRIVILAGES $N" &>>$LOG_FILE
    exit 1
  fi
}

VALIATE(){
    if [ $? -ne 0 ]; 
    then
        echo -e "${R}FAILED${N}"&>>$LOG_FILE
        exit 1
    else
        echo -e "${G}SUCCESS${N}"&>>$LOG_FILE
    fi 
}

CHECK_ROOT
