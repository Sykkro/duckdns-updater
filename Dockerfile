
FROM --platform=$BUILDPLATFORM alpine:3.12 AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM

FROM alpine:3.12
RUN apk add --no-cache curl
RUN apk add --no-cache bind-tools

COPY duckdns-updater.sh /duckdns-updater.sh
RUN chmod +x /duckdns-updater.sh
ENTRYPOINT ["/duckdns-updater.sh"]