# teamcity-init-script
Init script for JetBrains TeamCity following SysV and LSB conventions and tested on CentOS 6

To install on CentOS 6 you could copy 'teamcity.sh' to '/etc/init.d/teamcity' and ensure it is executable. Then use 'chkconfig --add teamcity' to create the appropriate runlevel linked.

sudo cp teamcity.sh /etc/init.d/teamcity
sudo chmod a+x /etc/init.d/teamcity
sudo chkconfig --add teamcity

Then to test it, stop and then start TeamCity

sudo service stop teamcity
sudo service start teamcity

Now reboot and ensure TeamCity does indeed start on boot.

PS. Not a proper LSB script as it does not support the 'status' action.
