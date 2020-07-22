# duckdns-updater

Multiarch alpine-based image that updates a configured DuckDNS at a fixed interval.

<div align="center">

![duckdns-updater](.res/logo.png "duckdns-updater")

[![buildx](https://github.com/Sykkro/duckdns-updater/workflows/buildx/badge.svg)](https://github.com/Sykkro/duckdns-updater/actions?query=workflow%3Abuildx)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/sykkro/duckdns-updater)](https://hub.docker.com/repository/docker/sykkro/duckdns-updater)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/sykkro/duckdns-updater)](https://hub.docker.com/repository/docker/sykkro/duckdns-updater)
[![Docker Pulls](https://img.shields.io/docker/pulls/sykkro/duckdns-updater)](https://hub.docker.com/repository/docker/sykkro/duckdns-updater)

</div>

---

## Build

> **NOTE:** Requires Docker's BuildX to build multiarch image

```bash
docker buildx build \
--platform=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 \
--output "type=image,push=false" \
-t sykkro/duckdns-updater:latest .
```

---

## Run

```bash
docker run --name duckdns-updater -e DUCK_ENV_DOMAINS=<domain(s)> -e DUCK_ENV_TOKEN=<token> [-e DUCK_ENV_INTERVAL=<seconds>] -d sykkro/duckdns-updater:latest
```

With:
- `DUCK_ENV_DOMAINS` - comma separated list of domains to be updated
- `DUCK_ENV_TOKEN` - the auth token for the DuckDNS account
- `DUCK_ENV_INTERVAL` (optional; defaults to 300s) - the interval, in seconds, to wait before updating the DNS entry


