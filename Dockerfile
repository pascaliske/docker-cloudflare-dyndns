# final image
FROM ghcr.io/pascaliske/alpine-curl-jq:0.0.1
LABEL maintainer="info@pascaliske.dev"

# set timezone
ENV TZ=UTC
RUN apk update && apk add --no-cache tzdata

# copy script
COPY ./updater.sh /usr/local/bin/cf-updater

# setup script
CMD [ "/usr/local/bin/cf-updater" ]
