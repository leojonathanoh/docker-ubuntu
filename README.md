# docker-ubuntu

[![github-actions](https://github.com/theohbrothers/docker-ubuntu/actions/workflows/ci-master-pr.yml/badge.svg?branch=master)](https://github.com/theohbrothers/docker-ubuntu/actions/workflows/ci-master-pr.yml)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-ubuntu?style=flat-square)](https://github.com/theohbrothers/docker-ubuntu/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-ubuntu/latest)](https://hub.docker.com/r/theohbrothers/docker-ubuntu)

Dockerized ubuntu with useful tools.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:24.04-ci`, `:latest` | [View](variants/24.04-ci) |
| `:22.04-ci` | [View](variants/22.04-ci) |
| `:20.04-ci` | [View](variants/20.04-ci) |
| `:18.04-ci` | [View](variants/18.04-ci) |
| `:16.04-ci` | [View](variants/16.04-ci) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```
