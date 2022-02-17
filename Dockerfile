# final image
FROM pascaliske/alpine-curl-jq:latest
LABEL maintainer="info@pascaliske.dev"

# copy script
COPY ./updater.sh /usr/local/bin/cf-updater

# setup script
CMD [ "/usr/local/bin/cf-updater" ]

