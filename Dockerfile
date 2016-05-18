FROM debian:jessie-backports

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -t jessie-backports -qy socat \
  && rm -rf /var/lib/apt/lists/*
COPY ["hosts.allow", "/etc/hosts.allow"]
COPY ["hosts.deny", "/etc/hosts.deny"]
ENTRYPOINT ["/usr/bin/socat"]
