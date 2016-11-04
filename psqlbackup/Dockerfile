FROM postgres:9.5.4
MAINTAINER Alex Walker <alex@hook.ee>

USER root
RUN apt-get update
RUN apt-get -y install build-essential libssl-dev libffi-dev python-dev --fix-missing
RUN apt-get install -q -y --force-yes cron gnupg python-pip

# AWS Command Line Interface
RUN pip install awscli

WORKDIR /

ADD backup.sh /backup.sh
ADD run.sh /run.sh
ADD .pgpass /.pgpass

RUN chmod 755 /*.sh

CMD ["/run.sh"]