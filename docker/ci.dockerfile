# CI variant of the dev image.
#
# Identical to the dev image except that it runs as an unprivileged user whose
# UID/GID match the GitHub-hosted runner user. This lets GitHub Actions write to
# the mounted workspace (/__w) without running the container as root, which
# bitbake refuses to allow.
ARG BASE_IMAGE=ghcr.io/husqvarnagroup/smart-garden-gateway-public/dev:latest
FROM ${BASE_IMAGE}

# UID/GID of the "runner" user on GitHub-hosted ubuntu-24.04 images.
ARG CI_UID=1001
ARG CI_GID=1001
ARG CI_USER=ciuser

USER root

RUN groupadd -g ${CI_GID} ${CI_USER} \
    && useradd -u ${CI_UID} -g ${CI_GID} -m -s /bin/bash ${CI_USER}

USER ${CI_USER}
