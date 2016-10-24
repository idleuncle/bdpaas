#!/bin/bash

ZOO_CFG=/opt/zookeeper/conf/zoo.cfg
ZOO_LOG=/opt/log/zookeeper

# wait until docker-compose gets all of the zookeeper containers running
# partially to start up the zookeeper cluster.

#for host in '${ADDITIONAL_ZOOKEEPER_1}' '${ADDITIONAL_ZOOKEEPER_2}' '${ADDITIONAL_ZOOKEEPER_3}' '${ADDITIONAL_ZOOKEEPER_4}' '${ADDITIONAL_ZOOKEEPER_5}' '${ADDITIONAL_ZOOKEEPER_6}' '${ADDITIONAL_ZOOKEEPER_7}' '${ADDITIONAL_ZOOKEEPER_8}' '${ADDITIONAL_ZOOKEEPER_9}'

#do
    ## http://stackoverflow.com/questions/6118948/bash-loop-ping-successful
    #((count = 10))
    #while [[ $count -ne 0 ]] ; do
        #ping -c 1 $host > /dev/null 2> /dev/null
        #rc=$?
        #if [[ $rc -eq 0 ]] ; then
            #((count = 1))
        #fi
        #sleep 1
        #((count = count - 1))
    #done

    #if [[ $rc -ne 0 ]] ; then
        #echo $host never ready for zookeeper$MYID
        #exit 1
    #fi
#done

echo "myid: ${MYID}" 
echo "${MYID}" > /var/lib/zookeeper/myid

echo "${ADDITIONAL_ZOOKEEPER_1}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_2}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_3}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_4}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_5}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_6}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_7}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_8}" >> ${ZOO_CFG}
echo "${ADDITIONAL_ZOOKEEPER_9}" >> ${ZOO_CFG}

/opt/zookeeper/bin/zkServer.sh start-foreground
