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
echo "PID of the script executing now : $$"
sleep 100 &
echo "PID of the last background command : $!"


#important note:
#1. Special variables are read-only and cannot be modified.
#2. They provide useful information about the script's execution environment.
#3. They are commonly used in shell scripting for various purposes, such as error handling, logging, and process management.
#4. Some special variables are specific to certain shells, so their behavior may vary.
#5. Always refer to the shell's documentation for a comprehensive list of special variables and their meanings. 
#6. Special variables can be combined with other shell features, such as conditionals and loops, to create more complex scripts.
#7. Understanding and utilizing special variables effectively can enhance the functionality and robustness of shell scripts.
