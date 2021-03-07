# Base image, default node image
FROM node:13.10-slim

# Environment configuration
ENV GITBOOK_VERSION4_LATEST="4.0.0-alpha.6" \
    GITBOOK_VERSION3_LATEST="3.2.3"
    

# Install gitbook
RUN npm install --global gitbook-cli \
  && gitbook fetch ${GITBOOK_VERSION4_LATEST} \
  && gitbook fetch ${GITBOOK_VERSION3_LATEST} \
  && npm install --global markdownlint-cli \
  && apt-get update \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    sudo \
    git \
    vim \
    calibre \
    fonts-roboto \
    bzip2 \
    ghostscript \
    jpegoptim \
    optipng \
    ca-certificates \
  && npm install svgexport -g --unsafe-perm \
  && npm cache clear --force \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/*
