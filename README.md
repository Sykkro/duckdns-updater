# docker-rpi-duckdns
Multiarch alpine-based image that updates a configured DuckDNS at a fixed interval.


## Build

> ___
> **NOTE:** Requires Docker's BuildX to build multiarch image
> ___
```bash
docker buildx build \
--platform=linux/amd64,linux/arm/v5,linux/arm/v6,linux/arm/v7,linux/arm64 \
--output "type=image,push=false" \
-t sykkro/duckdns-updater:latest .
```


## Run

`docker run --name duckdns-updater -e DUCK_ENV_DOMAINS=<domain(s)> -e DUCK_ENV_TOKEN=<token> [-e DUCK_ENV_INTERVAL=<seconds>] -d sykkro/duckdns-updater:latest`

- `DUCK_ENV_DOMAINS` - comma separated list of domains to be updated
- `DUCK_ENV_TOKEN` - the auth token for the DuckDNS account
- `DUCK_ENV_INTERVAL` (optional; defaults to 300s) - the interval, in seconds, to wait before updating the DNS entry


