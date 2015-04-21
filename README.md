# JetBrains Teamcity init script
Init script for JetBrains TeamCity following SysV and LSB conventions and tested on CentOS 6 with TeamCity 9.

To install, first edit the `teamcity.sh` script and check these configuration items are correct for your install and distro.

```
exec=/opt/teamcity/bin/teamcity-server.sh
lockfile=/var/lock/subsys/$prog
user=teamcity
```

Then copy `teamcity.sh` to `/etc/init.d/teamcity` and ensure it is executable. Then use `chkconfig --add teamcity` to create the appropriate runlevel links.

```
sudo cp teamcity.sh /etc/init.d/teamcity
sudo chmod a+x /etc/init.d/teamcity
sudo chkconfig --add teamcity
```

To test it, stop and then start TeamCity

```
sudo service teamcity stop
sudo service teamcity start
```

Now reboot and ensure TeamCity does indeed start on boot.

## Known Issues
* This is not a proper LSB init script yet as it does not support the 'status' action.
* Only tested on CentOS 6 though will likely work on other distros, please let me know if you test it
