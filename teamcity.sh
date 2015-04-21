#!/bin/bash
#
# teamcity        Startup script for JetBarins TeamCity.
#
# chkconfig: 2345 99 10
# description: TeamCity is a deamon and web application that provides \
# Continuous Integration builds.
### BEGIN INIT INFO
# Provides: teamcity
# Required-Start: $local_fs $network
# Required-Stop: $local_fs $network
# Default-Start:  2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: TeamCity Continuous Integration build system
# Description: TeamCity is a deamon and web application that provides
#              Continuous Integration builds.
### END INIT INFO

# Source function library.
. /etc/init.d/functions

RETVAL=0

prog=teamcity
exec=/opt/teamcity/bin/teamcity-server.sh
lockfile=/var/lock/subsys/$prog
user=teamcity

# Source config
if [ -f /etc/sysconfig/$prog ] ; then
    . /etc/sysconfig/$prog
fi

# For SELinux we need to use 'runuser' not 'su'
if [ -x /sbin/runuser ]
then
    SU=runuser
else
    SU=su
fi

start() {
        [ -x $exec ] || exit 5

        umask 077

        if [ -f $lockfile ] ; then
            echo -n $"Lock file exists, not starting TeamCity ($lockfile)"
            RETVAL=1
            echo
        else
            echo -n $"Starting TeamCity: "
            $SU -l "$user" -c "$exec start"
            RETVAL=$?
            echo
            [ $RETVAL -eq 0 ] && touch $lockfile
        fi
        return $RETVAL
}
stop() {
        echo -n $"Shutting down TeamCity: "
        $SU -l "$user" -c "$exec stop"
        RETVAL=$?
        echo
        [ $RETVAL -eq 0 ] && rm -f $lockfile
        return $RETVAL
}
restart() {
        stop
        start
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        restart
        ;;
  reload)
        exit 3
        ;;
  force-reload)
        restart
        ;;
  status)
        exit 4
        ;;
  condrestart|try-restart)
        exits 3
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|force-reload}"
        exit 3
esac

exit $?
