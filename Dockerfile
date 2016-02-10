FROM debian:jessie

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qy socat \
  && rm -rf /var/lib/apt/lists/*
COPY ["hosts.allow", "/etc/hosts.allow"]
COPY ["hosts.deny", "/etc/hosts.deny"]
ENTRYPOINT [ \
  "/usr/bin/socat", \
  "OPENSSL-LISTEN:5001,tcpwrap,fork,cert=/srv/certs/private/scarlet.fusionapp.com.pem", \
  "OPENSSL:scarlet.fusionapp.com:5000,cafile=/srv/certs/public/fusion-ca.crt.pem,cert=/srv/certs/private/scarlet.fusionapp.com.pem"]
