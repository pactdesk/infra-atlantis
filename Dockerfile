FROM ghcr.io/runatlantis/atlantis:latest

USER root

RUN apk add --no-cache \
    azure-cli \
    jq \
    bash \
    curl

ENV ATLANTIS_PORT=4141

WORKDIR /atlantis

RUN addgroup -S atlantis && \
    adduser -S -G atlantis atlantis && \
    chown -R atlantis:atlantis /atlantis

ENTRYPOINT ["atlantis", "server"]

CMD ["--config", "/atlantis/atlantis.yaml"]

USER atlantis

EXPOSE 4141
