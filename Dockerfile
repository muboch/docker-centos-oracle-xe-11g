FROM centos:latest

MAINTAINER muboch

ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 5555

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -Dddd
