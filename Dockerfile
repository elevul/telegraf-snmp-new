# Start from the Telegraf image based on Debian Bookworm
FROM telegraf:latest
USER root

LABEL maintainer="elevul" \
      name="Telegraf-SNMP" \
      version="0.10"

# Install SNMP packages
RUN apt-get update && apt-get install -y \
    snmp-mibs-downloader \
    snmp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to the telegraf user
USER telegraf
