FROM debian:11-slim

ARG UNIFI_VERSION=9.0.108 \
  MONGODB_VERSION=4.4

RUN apt-get update \
  && apt-get install --no-install-recommends -y curl unzip gnupg systemctl openjdk-17-jdk \
  && curl -fsSL https://pgp.mongodb.com/server-${MONGODB_VERSION}.asc | gpg -o /usr/share/keyrings/mongodb-server-${MONGODB_VERSION}.gpg --dearmor \
  && echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-${MONGODB_VERSION}.gpg ] http://repo.mongodb.org/apt/debian buster/mongodb-org/${MONGODB_VERSION} main" | tee /etc/apt/sources.list.d/mongodb-org-${MONGODB_VERSION}.list \
  && apt-get update \
  && apt-get install --no-install-recommends -y mongodb-org-server \
  && curl -sSLO https://dl.ui.com/unifi/${UNIFI_VERSION}/UniFi.unix.zip \
  && unzip UniFi.unix.zip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* UniFi.unix.zip

ADD --chmod=755 entrypoint.sh /UniFi/entrypoint.sh
ADD logback.xml /UniFi/logback.xml

## https://help.ui.com/hc/en-us/articles/218506997-UniFi-Network-Required-Ports-Reference
EXPOSE 8080 8443 3478/udp 1900/udp 10001/udp 5514/udp

WORKDIR /UniFi

ENTRYPOINT [ "/UniFi/entrypoint.sh" ]
