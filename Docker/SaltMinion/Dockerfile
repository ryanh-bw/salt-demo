FROM debian:wheezy

MAINTAINER Ryan H <ryan.henderson@bluware.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN echo "deb http://debian.saltstack.com/debian wheezy-saltstack-2015-05 main" > /etc/apt/sources.list.d/salt.list
ADD debian-salt-team-joehealy.gpg.key /tmp/debian-salt-team-joehealy.gpg.key
RUN apt-key add /tmp/debian-salt-team-joehealy.gpg.key && \
  rm /tmp/debian-salt-team-joehealy.gpg.key

RUN apt-get update && apt-get install -yq --no-install-recommends \
  salt-minion vim ssh net-tools procps && \
  rm -rf /var/lib/apt/lists/* && apt-get clean

RUN rm /usr/sbin/policy-rc.d

#VOLUME /etc/salt
ADD minion /etc/salt/minion

CMD ["/sbin/init", "2"]