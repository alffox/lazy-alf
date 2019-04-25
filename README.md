# lazyAlf

A script that automates common patching and cleanup operations on Liferay DXP Tomcat bundles.

## Requirements
- Liferay EE 6.2+ Tomcat bundle
- Patching Tool 2.0.12+ version. To download it: click [here](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191019&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191066) (Liferay Enterprise Customers only)
- For the download through terminal function: Liferay.com employee credentials

## Usage
1) Get a copy of [lazyAlf.sh](https://github.com/alffox/lazy-alf/raw/master/lazyAlf.sh) and make it executable

2) Place it in the `$LIFERAY_HOME/patching-tool` folder

3) The script is ready to go. Here are all the features:

* **(no option)** or **&nbsp;--help**: prints an info message
* **&nbsp;--init**: runs `./patching-tool.sh auto-discovery` automatically if Patching Tool is not configured, `./patching-tool.sh info`, prompts for patches to download, installs them
* **&nbsp;--soft**: deletes `$LIFERAY_HOME/work`, `$LIFERAY_HOME/osgi/state`, all `.jar`'s in `$LIFERAY_HOME/osgi/modules`, all `.war`'s in `$LIFERAY_HOME/osgi/war`, `$TOMCAT_HOME/work` and `$TOMCAT_HOME/temp` folders 
* **&nbsp;--hard**: deletes everything in `$LIFERAY_HOME/data` except the `license` folder
* **&nbsp;--start**: starts the server with the `./catalina.sh run` command

## Compatibility
Linux OS, MacOS
