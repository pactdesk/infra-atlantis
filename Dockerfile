FROM ghcr.io/runatlantis/atlantis:latest

# Switch to root for installing packages
USER root

# Install minimal required packages
RUN apk add --no-cache \
    jq \
    bash \
    curl

ENV ATLANTIS_PORT=4141

WORKDIR /atlantis

# Make sure permissions are set correctly
RUN chown -R atlantis:atlantis /atlantis

ENTRYPOINT ["atlantis", "server"]

CMD ["--config", "/atlantis/atlantis.yaml"]

# Switch back to the atlantis user
USER atlantis

EXPOSE 4141
