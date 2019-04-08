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

if [[ ( "$1" == "--help" ) || ( "$1" == "" ) ]]; then
print_help