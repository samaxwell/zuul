#!/bin/sh

echo "***************************************"
echo "Waiting for the eureka server to start"
echo "***************************************"
while ! `nc -z eurekaserver  $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"

echo "**********************************************"
echo "Waiting for the configuration server to start"
echo "**********************************************"
while ! `nc -z configserver $CONFIGSERVER_PORT `; do sleep 3; done
echo ">>>>>>>>>>>> Configuration Server has started"

echo "**********************"
echo "Starting Zuul Service"
echo "**********************"
java -Djava.security.egd=file:/dev/./urandom \
	 -Dserver.port=$SERVER_PORT \
     -Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI \
     -Dspring.cloud.config.uri=$CONFIGSERVER_URI \
     -Dspring.profiles.active=$PROFILE \
	 -jar /usr/local/app/app.jar