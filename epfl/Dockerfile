FROM debian:bookworm-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates openconnect oathtool tinyproxy \
 && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
ENTRYPOINT ["/entrypoint.sh"]
