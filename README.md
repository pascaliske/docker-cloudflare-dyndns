# [`pascaliske/docker-cloudflare-dyndns`](https://pascaliske.github.io/docker-cloudflare-dyndns/)

> Simple container image to update a dynamic DNS record using the Cloudflare API.

[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/pascaliske/cloudflare-dyndns/latest?style=flat-square)](https://hub.docker.com/r/pascaliske/cloudflare-dyndns) [![Docker Image Size (tag)](https://img.shields.io/docker/image-size/pascaliske/cloudflare-dyndns/latest?style=flat-square)](https://hub.docker.com/r/pascaliske/cloudflare-dyndns) [![Docker Pulls](https://img.shields.io/docker/pulls/pascaliske/cloudflare-dyndns?style=flat-square)](https://hub.docker.com/r/pascaliske/cloudflare-dyndns) [![GitHub Tag](https://img.shields.io/github/v/tag/pascaliske/docker-cloudflare-dyndns?style=flat-square)](https://github.com/pascaliske/docker-cloudflare-dyndns) [![Build Status](https://img.shields.io/github/workflow/status/pascaliske/docker-cloudflare-dyndns/Image/master?label=build&style=flat-square)](https://github.com/pascaliske/docker-cloudflare-dyndns/actions) [![GitHub Last Commit](https://img.shields.io/github/last-commit/pascaliske/docker-cloudflare-dyndns?style=flat-square)](https://github.com/pascaliske/docker-cloudflare-dyndns) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](https://opensource.org/licenses/MIT) [![Awesome Badges](https://img.shields.io/badge/badges-awesome-green.svg?style=flat-square)](https://github.com/Naereen/badges)

## Image

| Registry   | Image                                                                                                                             |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------- |
| GitHub     | [`ghcr.io/pascaliske/cloudflare-dyndns`](https://github.com/pascaliske/docker-cloudflare-dyndns/pkgs/container/cloudflare-dyndns) |
| Docker Hub | [`pascaliske/cloudflare-dyndns`](https://hub.docker.com/r/pascaliske/cloudflare-dyndns)                                           |

The following platforms are available for this image:

```bash
$ docker run --rm mplatform/mquery ghcr.io/pascaliske/cloudflare-dyndns:latest
Image: ghcr.io/pascaliske/cloudflare-dyndns:latest
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - linux/arm/v7
   - linux/arm64
```

## Usage

To use this image pull it from one of the following registries:

```bash
# github container registry
docker pull ghcr.io/pascaliske/cloudflare-dyndns

# docker hub
docker pull pascaliske/cloudflare-dyndns
```

Then run it using the following command:

```bash
# github container registry
docker run --rm -e CF_API_TOKEN=xyz -e DOMAIN=domain.com -e NAME=my ghcr.io/pascaliske/cloudflare-dyndns

# docker hub
docker run --rm -e CF_API_TOKEN=xyz -e DOMAIN=domain.com -e NAME=my pascaliske/cloudflare-dyndns
```

This will update the subdomain record `my.domain.com` in the DNS zone `domain.com` with your current IP address.

## Configuration

You can configure the container with the following additional environment variables:

| Variable       | Required | Default       | Description                                       |
| -------------- | :------: | ------------- | ------------------------------------------------- |
| `TZ`           |    No    | `UTC`         | Adjust the time zone inside the container         |
| `IP_SERVICE`   |    No    | `ifconfig.co` | The IP service to retrieve your public IP address |
| `DOMAIN`       |   Yes    | -             | Your DNS zone within Cloudflare                   |
| `NAME`         |   Yes    | -             | Your Subdomain record to update                   |
| `CF_API_TOKEN` |   Yes    | -             | Your Cloudflare API token                         |

## Kubernetes

If you want to use this tool as an `CronJob` inside of a Kubernetes cluster [check out my ready to deploy Helm chart](https://charts.pascaliske.dev/charts/cloudflare-dyndns/)!

## License

[MIT](LICENSE.md) – © 2022 [Pascal Iske](https://pascaliske.dev)
