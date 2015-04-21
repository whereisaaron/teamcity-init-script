# JetBrains Teamcity init script
Init script for JetBrains TeamCity following SysV and LSB conventions and tested on CentOS 6.

To install on CentOS 6 you could copy `teamcity.sh` to `/etc/init.d/teamcity` and ensure it is executable. Then use `chkconfig --add teamcity` to create the appropriate runlevel links.

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

