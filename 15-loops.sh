USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"

CHECK_ROOT(){
    if [USERID -ne 0]
    then 
        echo "please un this script as root privileges"
        exit 1
    fi 
}

VALIDATE(){
    if [$1 -ne 0]
    then 
        echo -e "$2 is ....$R FAILED $M"
        exit 1
    else
        echo -e "$2 is ....$G SUCCESS $M"
    fi
} 


CHECK_ROOT

#sh 15-loops.sh git mysql postfix nginx docker httpd vsftpd ssh 

for package in $@ #$@ is special variable which takes all the arguments passed to the script
do 
    dnf list installed $package 
    if [$? -ne 0]
    then 
        echo "$package is not installed, going to installing it now"
        dnf install $package -y
        VALIDATE $? "$package installation"
else
    echo "$package is already installed"
    fi
    
done