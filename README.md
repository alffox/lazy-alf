# lazyAlf

A script that automates common patching and cleanup operations on Liferay DXP Tomcat bundles.

## Requirements
- Liferay EE 6.2+ Tomcat bundle
- Patching Tool 2.0.12+ version
- For the download through terminal function: Liferay.com employee credentials

## Usage
1) Get a copy of [lazyAlf.sh](https://github.com/alffox/lazy-alf/raw/master/lazyAlf.sh) and make it executable

2) Place it in the `$LIFERAY_HOME/patching-tool` folder

3) The script is ready to be used. Here are all the features:

* **(no option)** or **&nbsp;--help**: prints an info message
* **&nbsp;--quickstart**: runs `./patching-tool.sh auto-discovery` automatically if Patching Tool is not configured, `./patching-tool.sh info`, installs patches, deletes `$LIFERAY_HOME/work`, `$LIFERAY_HOME/osgi/state`, all `.jar`'s in `$LIFERAY_HOME/osgi/modules`, all `.war`'s in `$LIFERAY_HOME/osgi/war`, `$TOMCAT_HOME/work` and `$TOMCAT_HOME/temp` folders, starts the server with the `./catalina.sh run` command
* **&nbsp;--init**: runs `./patching-tool.sh auto-discovery` automatically if Patching Tool is not configured, `./patching-tool.sh info`, prompts for patches to download, installs them
* **&nbsp;--soft**: deletes `$LIFERAY_HOME/work`, `$LIFERAY_HOME/osgi/state`, all `.jar`'s in `$LIFERAY_HOME/osgi/modules`, all `.war`'s in `$LIFERAY_HOME/osgi/war`, `$TOMCAT_HOME/work` and `$TOMCAT_HOME/temp` folders 
* **&nbsp;--hard**: deletes everything in `$LIFERAY_HOME/data` except the `license` folder
* **&nbsp;--start**: starts the server with the `./catalina.sh run` command

## Compatibility
Linux
