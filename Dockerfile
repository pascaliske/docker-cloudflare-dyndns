# final image
FROM pascaliske/alpine-curl-jq:latest
LABEL maintainer="info@pascaliske.dev"

# set timezone
ENV TZ=UTC
RUN apk update && apk add --no-cache tzdata

# copy script
COPY ./updater.sh /usr/local/bin/cf-updater

# setup script
CMD [ "/usr/local/bin/cf-updater" ]

