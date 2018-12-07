# raincloud
#
# VERSION               1.0
FROM      registry.acs.aliyun.com/open/tomcat8.0.32:5.0.0

MAINTAINER alibaba

WORKDIR /acs

RUN echo "raincloud setup"

#RUN yum clean all

#RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#RUN yum makecache

RUN rpm --rebuilddb && yum -y install python

WORKDIR /opt

RUN wget -q https://files.pythonhosted.org/packages/b0/d1/8acb42f391cba52e35b131e442e80deffbb8d0676b93261d761b1f0ef8fb/setuptools-40.6.2.zip

RUN unzip /opt/setuptools-40.6.2.zip -d /opt

WORKDIR /opt/setuptools-40.6.2

RUN python setup.py install

WORKDIR /opt

RUN wget -q https://files.pythonhosted.org/packages/02/d6/c00aac9a35972a6c0fcf55afdf2f61c9316a6b688db01185c948d9d78b26/envtpl-0.6.0.tar.gz

RUN tar zxvf /opt/envtpl-0.6.0.tar.gz -C /opt

WORKDIR /opt/envtpl-0.6.0

RUN python setup.py install

WORKDIR /acs

# Create the pesudo log file to point to stdout
RUN ln -sf /dev/stdout /acs/user/tomcat/logs/catalina.out

# Expose the default port
EXPOSE 8080

ENTRYPOINT ["/acs/acsstart"]

RUN echo "raincloud run"
