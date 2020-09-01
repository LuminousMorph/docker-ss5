FROM centos:centos7

MAINTAINER 冰糕Luminous
MAINTAINER luminous@ice-luminous.com
MAINTAINER HeavenArk Ltd.

RUN yum install -y make cmake gcc openldap-devel pam-devel openssl-devel nano sudo net-tools
RUN mkdir -p /ss5/

ADD ./source.tar.xz /ss5/
COPY docker-entrypoint.sh /

RUN chmod -R 777 /ss5/
RUN /ss5/configure
RUN make -C /ss5
RUN make install -C /ss5

RUN chmod u+x /etc/rc.d/init.d/ss5

EXPOSE 1080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["service","ss5","start"]