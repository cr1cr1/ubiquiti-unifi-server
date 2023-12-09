# Ubiquiti UniFi Network Server container image

- Source repo: <https://github.com/cr1cr1/ubiquiti-unifi-server>
- Docker image repo: <https://hub.docker.com/r/cr1cr1/ubiquiti-unifi-server>

## Description

This container image is based on the official [Debian 11](https://hub.docker.com/_/debian/tags/?page=1&name=11-slim) image and provides the [UniFi Network Server](https://www.ui.com/software/) software.

## Usage

```bash
CONTAINER_NAME="unifi-server"
docker run \
    -d \
    --name "$CONTAINER_NAME" \
    --env JAVA_OPTS="-Xmx768M -Duser.timezone=Europe/Bucharest" \
    -p 8080:8080 \
    -p 8443:8443 \
    -p 10001:10001/udp \
    -p 1900:1900/udp \
    -v "$CONTAINER_NAME-data:/UniFi/data" \
    docker.io/cr1cr1/ubiquiti-unifi-server:latest
```

## License

[MIT](LICENSE)
