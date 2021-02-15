#!/bin/bash

##Translating color codes into human-readable variables
RESET=$(echo -en '\033[0m')
BLUE=$(echo -en '\033[0;94m')
BOLD_CYAN=$(echo -en '\033[1;36m')
YELLOW=$(echo -en '\033[0;33m')
ORANGE=$(echo -en '\033[33m')
GREEN=$(echo -en '\033[0;32m')


print_help () {
    echo "${BOLD_CYAN}lazyAlf for DXP - Usage & Info${RESET}"
    echo
    echo "Requirements: Patching Tool 2.0.12+"
    echo
    echo "${BLUE}no option${RESET} or ${BLUE}--help${RESET}: prints this info message"
    echo "${BLUE} --quickstart${RESET}: runs ./patching-tool.sh auto-discovery automatically if Patching Tool is not configured, runs ./patching-tool.sh info, installs patches, deletes \$LIFERAY_HOME/work, \$LIFERAY_HOME/osgi/state, \$TOMCAT_HOME/work and \$TOMCAT_HOME/temp folders, starts the server"
    echo "${BLUE} --init${RESET}: runs ./patching-tool.sh auto-discovery automatically if Patching Tool is not configured, ./patching-tool.sh info, prompts for patches to download, installs them"
    echo "${BLUE} --soft${RESET}: deletes \$LIFERAY_HOME/work, \$LIFERAY_HOME/osgi/state, \$TOMCAT_HOME/work and \$TOMCAT_HOME/temp folders"
    echo "${BLUE} --hard${RESET}: deletes everything in \$LIFERAY_HOME/data except the \"license\" folder"
    echo "${BLUE} --start${RESET}: starts the server with ./catalina.sh run command"
    echo
}

get_info () {
    echo "${YELLOW}Running auto-discovery and patching-tool info commands ...${RESET}"
    ./patching-tool.sh info
}

initialize () {
    echo "${ORANGE}Done. Type the fixpack or hotfix name you want to download and hit ENTER (e.g. de-78-7010,dxp-9-7110,hotfix-120-7010). Press enter to skip${RESET}"
    read patch_fixpack
    ./patching-tool.sh download $patch_fixpack
}

install () {
    ./patching-tool.sh install
}

clean_soft () {
    echo "${YELLOW}Starting soft clean operation ...${RESET}"
    
    echo "Deleting \$LIFERAY_HOME/work folder ..."
    rm -rf ../work/*
    
    echo "Deleting the content of \$LIFERAY_HOME/osgi/state folder ..."
    rm -rf ../osgi/state/*
    
    echo "Deleting the content of \$TOMCAT_HOME\work and \temp folders ..."
    cd ../tomcat*/
    rm -rf work/*
    rm -rf temp/*
    
    echo "${GREEN}Soft clean done!${RESET}"
}

clean_hard () {
    echo "${YELLOW}Starting hard clean operation ...${RESET}"
    
    echo "Cleaning up content of \$LIFERAY_HOME\data folder ..."
    cd ../data/
    find -maxdepth 1 -type d -not -name license -not -name "." -exec rm -rf {} \;
    
    echo "${GREEN}Hard clean done!${RESET}"
}

start_server () {
    echo "${YELLOW}Now starting the server ...${RESET}"
    ../tomcat*/bin/catalina.sh run
}

if [[ ( "$1" == "--help" ) || ( "$1" == "" ) ]]; then
    print_help
    
    elif [[ "$1" == "--quickstart" ]]; then
    get_info
    install
    clean_soft
    start_server
    
    elif [[ "$1" == "--init" ]]; then
    get_info
    initialize
    install
    clean_soft
    start_server
    
    elif [[ "$1" == "--soft" ]]; then
    clean_soft
    
    elif [[ "$1" == "--hard" ]]; then
    clean_soft
    clean_hard
    
    elif [[ "$1" == "--start" ]]; then
    start_server
    
fi