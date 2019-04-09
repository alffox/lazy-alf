# lazyAlf

A script that automates common patching and cleanup operations on Liferay DXP Tomcat bundles.

## Usage
1) Get a copy of [lazyAlf.sh](https://github.com/alffox/lazy-alf/raw/master/lazyAlf.sh) and make it executable

2) Place it in the `$LIFERAY_HOME/patching-tool` folder

3) The script is ready to go. Here are all the features:

* **(no option)** or **&nbsp;--help**: prints an info message
* **&nbsp;--init**: runs `./patching-tool.sh auto-discovery`, `./patching-tool.sh info`, prompts for patches to download, installs them
* **&nbsp;--clean-soft**: deletes `$LIFERAY_HOME/work`, `$LIFERAY_HOME/osgi/state`, all `.jar`'s in `$LIFERAY_HOME/osgi/modules`, `$TOMCAT_HOME/work` and `$TOMCAT_HOME/temp` folders 
* **&nbsp;--clean-hard**: deletes everything in `$LIFERAY_HOME/data` except the `license` folder
* **&nbsp;--start**: starts the server with the `./catalina.sh run` command

## Compatibility
Linux OS
