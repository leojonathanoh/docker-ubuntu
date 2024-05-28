FROM ubuntu:18.04

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        # dnsutils iproute2 netcat net-tools \
        # rsync \
        wget; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y bats; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y curl; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y git; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y jq; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

