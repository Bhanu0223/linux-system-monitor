FROM ubuntu:22.04

RUN apt-get update && apt-get install -y 

RUN apt install -y \
# it is install below packagesusing apt install command
    gawk \
    curl \
    procps \
    cron 


WORKDIR /app

COPY system_stats.sh /app/system_stats.sh
COPY exporter.sh /app/exporter.sh
COPY cronjob /etc/cron.d/system-stats-cron
# above command will copy cronjob file to /etc/cron.d/ directory. 
#This file contains the schedule and command to run system_stats.sh or exporter.sh periodically


RUN chmod +x /app/system_stats.sh /app/exporter.sh \
    && chmod 644 /etc/cron.d/system-stats-cron \
    && crontab /etc/cron.d/system-stats-cron
# The above command will set the appropriate permissions for the scripts and cronjob file.

CMD cron && tail -f /var/log/cron.log