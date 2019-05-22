#!/bin/bash


linuxSetup()
{
    echo $USER - "Linux Setup"
    pip3 install jupyterlab
    sudo apt-get update
    sudo apt-get install nodejs
    sudo apt-get install npm
    nodejs -v
    nodejs -v
    cp jupyter.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl start jupyter.service
    sudo systemctl status jupyter.service
    sudo systemctl enable jupyter.service
    sudo apt-get install nginx
    cp jupyter /etc/nginx/sites-available/jupyter/
    sudo ln -s /etc/nginx/sites-available/jupyter /etc/nginx/sites-enabled/jupyter
    sudo systemctl reload nginx.service
}



# Ask the user for their os
echo welcome, $USER
echo what\'s your operating system?
echo 1. Ubuntu
read os
if [[ $os == "1" || $os == "mac" ]]; then
    macSetup
    elif [[ $os == "2" || $os == "ubuntu" ]]; then
    linuxSetup
else
    echo wrong input!
    
fi

