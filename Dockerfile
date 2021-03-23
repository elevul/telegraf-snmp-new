FROM telegraf
USER root
WORKDIR /root

LABEL   maintainer="elevul" \
        name="Telegraf-SNMP" \
        version="0.10"

RUN apt-get update && apt-get install -y snmp-mibs-downloader snmp && \
                apt-get clean && \
                rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER telegraf