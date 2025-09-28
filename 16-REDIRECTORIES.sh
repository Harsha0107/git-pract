LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
M="\e[35m"
C="\e[36m"
W="\e[37m"


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

for package in $@ #$@ is special variable which takes all the arguments passed to the script
do 
    dnf list installed $package  &>>$LOG_FILE
    if [$? -ne 0]
    then 
        echo "$package is not installed, going to installing it now" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package installation" 
else
    echo "$package is already $Y installed $N" &>>$LOG_FILE
    fi
done

