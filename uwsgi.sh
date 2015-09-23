#!/bin/sh
pid=`netstat -ntpl | grep uwsgi | awk '{print $NF}'|awk -F'/' '{print $1}'`
echo $pid
 
while [ -n "$1" ]  
do  
case "$1" in   
    start)  
        uwsgi -x django.xml
        nginx
        shift
        ;;  
    stop)  
        kill -9 $pid
        nginx -s stop
        shift  
        ;;  
    restart)  
        kill -9 $pid
        uwsgi -x django.xml
        nginx -s reload
        shift  
        ;;  
     *)  
         echo "use start|stop|restart to execute the bash script"  
        ;;  
esac
done
