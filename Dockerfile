FROM telegraf:latest
USER root

LABEL maintainer="elevul" \
      name="Telegraf-SNMP" \
      version="0.10"

# Enable non-free packages, update package index, and install SNMP packages
RUN sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    snmp-mibs-downloader \
    snmp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER telegraf
