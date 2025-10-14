# Ubiquiti UniFi Network Application container image

- Source repo: <https://github.com/cr1cr1/ubiquiti-unifi-server>
- Docker image repo: <https://hub.docker.com/r/cr1cr1/ubiquiti-unifi-server>

## Description

This container image is based on the official [Debian 13](https://hub.docker.com/_/debian/tags/?page=1&name=13-slim) image and provides the [UniFi Network Application](https://ui.com/download/unifi) software.

> [!WARNING]
>
> Coming versions before 9.5.21-1, you must export the settings before upgrading, as Mongo was bumped from 4 to 8. The upgrade will not migrate the database.

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
