# synology-znc-autostart
Script which ensures [ZNC](http://wiki.znc.in/ZNC) is started during Synology DiskStation boot procedure.

### Problem

After installation of [ZNC package from SynoCommunity](https://synocommunity.com/package/znc) on DSM (>= 6). ZNC will fail to start from "Package Center" due to ["Failed to run the package service" error.](https://hodzic.org/img/znc/znc%20package%20center%20start%20fail.png). And 

To resolve this problem you need to manually run ZNC binary by SSH-ing to your Synology and running:

```bash
/var/packages/znc/scripts/start-stop-status start
```

as root user.

However, problem with this is that every time your Synology is restarted to update or any other reason, you'll have to remember to manually SSH and run the ZNC binary, or run it via "Package Center". Needless to say, by default updates are scheduled to run in middle of night ...

### Solution

Place ```znc_autostart.sh``` script under admin user home dir (```/var/services/homes/admin```)

In "Task Scheduler" of "Control Center":

* create "Triggered Task > User-defined script"

![Triggered Task > User-defined script](https://hodzic.org/img/znc/create%20triggered%20task.png)

* with following settings for:

**General Settings:**

![General Settings](https://hodzic.org/img/znc/general%20settings.png)

**Task Settings:**

![Task Settings](https://hodzic.org/img/znc/task%20settings.png)


With this setup, you don't have to think about manually starting ZNC anymore. Every time your DiskStation is restarted, ```znc_autostart.sh``` will make sure ZNC is started during boot procedure.

### Technical

When run, ```znc_autostart.sh``` will check if there are any ZNC processes running. If there aren't any ZNC related processes running, it will run the ZNC binary. 
