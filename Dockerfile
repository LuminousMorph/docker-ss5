FROM centos:centos7

MAINTAINER 冰糕Luminous HeavenArk Ltd.

ENV S5_USER default
ENV S5_USER default

RUN yum install -y make cmake gcc openldap-devel pam-devel openssl-devel nano sudo net-tools
RUN mkdir -p /ss5/ && touch /etc/sysconfig/network

ADD ./source.tar.xz /

RUN chmod -R 777 /ss5/
WORKDIR /ss5
RUN ./configure && make && make install

RUN chmod u+x /etc/rc.d/init.d/ss5

EXPOSE 1080

WORKDIR /

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
