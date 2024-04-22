$local:VARIANTS_DISTRO_VERSIONS = @(
    '24.04'
    '22.04'
    '20.04'
    '18.04'
    '16.04'
)
# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    foreach ($v in $local:VARIANTS_DISTRO_VERSIONS) {
        @{
            distro = 'ubuntu'
            distro_version = $v
            subvariants = @(
                @{ components = @( 'ci' ); tag_as_latest = if ($v -eq $local:VARIANTS_DISTRO_VERSIONS[0]) { $true } else { $false } }
            )
        }
    }
)

$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    distro = $variant['distro']
                    distro_version = $variant['distro_version']
                    platforms = 'linux/amd64', 'linux/arm/v7', 'linux/arm64/v8', 'linux/ppc64le', 'linux/s390x'
                    components = $subVariant['components']
                    job_group_key = $variant['distro_version']
                }
                # Docker image tag. E.g. '3.8-curl'
                tag = @(
                        $variant['distro_version']
                        $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ( $subVariant.Contains('tag_as_latest') ) {
                                    $subVariant['tag_as_latest']
                                } else {
                                    $false
                                }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
