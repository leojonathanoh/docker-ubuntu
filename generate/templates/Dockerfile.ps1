@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        # dnsutils iproute2 netcat net-tools \
        # rsync \
        wget; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;


"@

$VARIANT['_metadata']['components'] | % {
    $component = $_

    switch( $component ) {

        { $_ -in 'bats', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y bats; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;


"@
        }

        { $_ -in 'curl', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y curl; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;


"@
        }

        { $_ -in 'git', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y git; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;


"@
        }

        { $_ -in 'jq', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y jq; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;


"@
        }

        default {
            throw "No such component: $component"
        }
    }
}
