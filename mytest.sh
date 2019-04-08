#!/bin/bash

print_help () {
echo -e "\033[1;36mlazyAlf for DXP - Usage & Info:\n\n"
echo -e "\033[0;94mno option\033[0m or \033[0;94m--help\033[0m: prints this info message"
echo -e "\033[0;94m --init\033[0m: runs ./patching-tool.sh auto-discovery, ./patching-tool.sh info, prompts for patches to download, installs them"
echo -e "\033[0;94m --clean-soft\033[0m: deletes \$LIFERAY_HOME/work, \$LIFERAY_HOME/osgi/state, all .jars in \$LIFERAY_HOME/osgi/modules, \$TOMCAT_HOME/work and \$TOMCAT_HOME/temp folders"
echo -e "\033[0;94m --clean-hard\033[0m: deletes everything in \$LIFERAY_HOME/data except the \"license\" folder"
echo -e "\033[0;94m --start\033[0m: starts the server with ./catalina.sh run command"
echo
}

initialize () {
    echo -e "\033[0;33mRunning auto-discovery and patching-tool info commands ...\033[0m"
    ./patching-tool.sh auto-discovery
    ./patching-tool.sh info

    echo -e "\033[33mDone. Type the fixpack or hotfix name you want to download and hit ENTER (e.g. de-78-7010,dxp-9-7110,hotfix-120-7010). Press enter to skip\e[0m"
    read patch_fixpack
    ./patching-tool.sh download $patch_fixpack
    ./patching-tool.sh install

    echo -e "\033[0;32mInitialization done!\033[0m"
}

clean_soft () {
    echo -e "\033[0;33mStarting soft clean operation ...\033[0m"
    
    echo "Deleting \$LIFERAY_HOME/work folder ..."
    rm -rf ../work/*

    echo "Deleting the content of \$LIFERAY_HOME/osgi/state folder ..."
    rm -rf ../osgi/state/*

    echo "Deleting *.jar in \$LIFERAY_HOME/osgi/modules folder ..."
    rm -rf ../osgi/modules/*.jar

    echo "Deleting the content of \$TOMCAT_HOME\work and \temp folders ..."
    cd ../tomcat*/
    rm -rf work/*
    rm -rf temp/*

    echo -e "\033[0;32mSoft clean done!\033[0m"
}

if [[ ( "$1" == "--help" ) || ( "$1" == "" ) ]]; then
print_help

elif [[ "$1" == "--init" ]]; then
initialize
clean_soft
start_server

elif [[ "$1" == "--clean-soft" ]]; then
clean_soft

fi