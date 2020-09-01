FROM centos:centos7

MAINTAINER 冰糕Luminous
MAINTAINER luminous@ice-luminous.com
MAINTAINER HeavenArk Ltd.

RUN yum install -y make cmake gcc openldap-devel pam-devel openssl-devel nano sudo net-tools
RUN mkdir -p /ss5t/

COPY ./ss5-3.8.9/* /ss5t/
COPY docker-entrypoint.sh /

RUN /ss5t/configure
RUN make -C /ss5t
RUN make install -C /ss5t

EXPOSE 1080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["service","ss5","start"]