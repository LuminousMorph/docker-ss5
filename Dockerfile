FROM centos:centos7

MAINTAINER 冰糕Luminous
MAINTAINER luminous@ice-luminous.com
MAINTAINER HeavenArk Ltd.

RUN yum install -y make cmake gcc openldap-devel pam-devel openssl-devel nano sudo net-tools
RUN mkdir -p /ss5/

ADD ./source.tar.xz /

RUN chmod -R 777 /ss5/
WORKDIR /ss5
RUN ./configure && make && make install

RUN chmod u+x /etc/rc.d/init.d/ss5
RUN chmod u+x /etc/rc.d/init.d/ss5

EXPOSE 1080

WORKDIR /

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["service","ss5","start"]