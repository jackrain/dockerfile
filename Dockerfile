# raincloud
#
# VERSION               1.0
FROM      registry.acs.aliyun.com/open/tomcat8.0.32:5.0.0

MAINTAINER alibaba

WORKDIR /acs

RUN echo "raincloud setup"
# Create the pesudo log file to point to stdout
RUN ln -sf /dev/stdout /acs/user/tomcat/logs/catalina.out

# Expose the default port
EXPOSE 8080

ENTRYPOINT ["/acs/acsstart"]

RUN echo "raincloud run"
