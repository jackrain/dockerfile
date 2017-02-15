#pull down centos image
FROM registry.acs.aliyun.com/open/tomcat8:4.0.0
MAINTAINER jackrain@hotmail.com
#define entry point which will be run first when the container starts up
ENTRYPOINT /acs/bin/start.sh
