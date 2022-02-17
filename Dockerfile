# builder image
FROM --platform=${BUILDPLATFORM} alpine AS builder
LABEL maintainer="info@pascaliske.dev"

# arguments
ARG TARGETOS
ARG TARGETARCH

# build
# RUN OS=${TARGETOS} ARCH=${TARGETARCH} build

# final image
FROM alpine:latest
LABEL maintainer="info@pascaliske.dev"

# environment
# ENV key=value

# volumes
# VOLUME [  ]

# copy built files
# COPY --from=builder /from/builder/image /to/final/image

# setup entrypoint
# ENTRYPOINT [  ]
