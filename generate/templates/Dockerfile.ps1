@"
FROM $( $VARIANT['_metadata']['distro'] ):$( $VARIANT['_metadata']['distro_version'] )

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y \
    ca-certificates \
    # dnsutils iproute2 netcat net-tools \
    # rsync \
    wget;


"@

$VARIANT['_metadata']['components'] | % {
    $component = $_

    switch( $component ) {

        { $_ -in 'bats', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y bats


"@
        }

        { $_ -in 'curl', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y curl


"@
        }

        { $_ -in 'jq', 'ci' } {
        @"
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y jq


"@
        }

        default {
            throw "No such component: $component"
        }
    }
}
