FROM centos:centos7

MAINTAINER 冰糕Luminous
MAINTAINER luminous@ice-luminous.com
MAINTAINER HeavenArk Ltd.

RUN yum install -y make cmake gcc openldap-devel pam-devel openssl-devel nano sudo net-tools
RUN mkdir -p /ss5t/

ADD ./source.tar.xz /ss5
COPY docker-entrypoint.sh /

RUN chmod -R 777 /ss5t/
RUN /ss5t/configure
RUN make -C /ss5t
RUN make install -C /ss5t

RUN chmod u+x /etc/rc.d/init.d/ss5

EXPOSE 1080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["service","ss5","start"]