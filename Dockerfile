FROM telegraf
USER root
WORKDIR /root

LABEL   maintainer="elevul" \
        name="Telegraf-SNMP" \
        version="0.10"

RUN printf "deb http://deb.debian.org/debian stretch main contrib non-free\ndeb-src http://deb.debian.org/debian stretch main contrib non-free\ndeb http://security.debian.org/debian-security/ stretch/updates main contrib non-free\ndeb-src http://security.debian.org/debian-security/ stretch/updates main contrib non-free\ndeb http://deb.debian.org/debian stretch-updates main contrib non-free\ndeb-src http://deb.debian.org/debian stretch-updates main contrib non-free" >> /etc/apt/sources.list && \
                apt-get update && apt-get install -y snmp-mibs-downloader snmp && \
                apt-get clean && \
                rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER telegraf