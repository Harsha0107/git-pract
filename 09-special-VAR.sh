#!bin/bash
# Special Variables in Bash

echo "all vaiables: passed to the scipt: $@"
echo "num of variables passed: $#"
echo "script name: $0"
echo "last command exit status: $?"
echo "process id of current script: $$"
echo "current working directory: $PWD"
echo "home directory of current user: $HOME"
echo "current user: $USER"
echo "shell being used: $SHELL"
echo "operating system: $OSTYPE"
echo "path variable: $PATH"
echo "current date and time: $(date +%F-%T)"
echo "current logged in users: $(who)"
echo "current logged in users: $(uptime)"
echo "current memory usage: $(free -h)"
echo "current disk usage: $(df -h)"
echo "current running processes: $(ps -aux)"

