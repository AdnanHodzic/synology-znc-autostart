# synology-znc-autostart
Script which ensures [ZNC](http://wiki.znc.in/ZNC) is started during Synology DiskStation boot procedure.

### Problem

After installation of [ZNC package from SynoCommunity](https://synocommunity.com/package/znc) on DSM (>= 6). ZNC will fail to start from "Package Center" with following [error.](http://hodzic.org/img/znc/znc%20package%20center%20start%20fail.png)

To resolve this problem you can manually run ZNC binary by SSH-ing to your Synology and running:

```bash
/volume1/@appstore/znc/bin/znc
```
However, problem with this is that every time your Synology is restarted to update or any other reason, you'll have to remember to manually SSH and run the ZNC binary. 

### Solution

Place ```znc_autostart.sh``` script under admin user home dir (/var/services/homes/admin)

In "Task Scheduler" of "Control Center":

* create [Triggered Task > User-defined script](http://hodzic.org/img/znc/create%20triggered%20task.png)

	* with following settings for:
	* [General Setings](http://hodzic.org/img/znc/general%20settings.png)
	* [Task Settings](http://hodzic.org/img/znc/task%20settings.png)


### Technical

When run, ```znc_autostart.sh``` will check if there are any ZNC processes running. If there aren't any ZNC related processes running, it will run the ZNC binary. 

Since this script is desigend to be run as root user. And running ZNC as root is too much of a security risk, additional wrapper has been written to run the main script function/logic as "admin" user.  
