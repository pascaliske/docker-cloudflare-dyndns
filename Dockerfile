# final image
FROM ghcr.io/pascaliske/alpine-curl-jq:0.0.2
LABEL maintainer="info@pascaliske.dev"
WORKDIR /app

# create non-root user
RUN addgroup -S -g 911 unknown && adduser -S -u 911 -G unknown -s /bin/false unknown

# set timezone
ENV TZ=UTC
RUN apk update && apk add --no-cache tzdata

# switch to non-root user
USER unknown

# inject script
COPY --chown=unknown:unknown ./updater.sh /app/cf-updater

# let's go!
CMD [ "/app/cf-updater" ]
