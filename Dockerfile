# based on https://github.com/firefly-cpp/alpine-container-data-science
FROM alpine:3.18

ENV NAME=data-science-basic VERSION=0 ARCH=x86_64

LABEL org.label-schema="$NAME" \
     name="$FGC/$NAME" \
     version="$VERSION" \
     architecture="$ARCH" \
     run="podman run -it IMAGE" \
     url="https://github.com/firefly-cpp/succulent-container" \
     summary="A basic container image for running succulent framework." \
     description="A basic container image for running succulent framework."

# set a workdir where we will also collect the results of python scripts
WORKDIR /var/ds/

# INSTALL succulent framework
ENV PACKAGES="\
    py3-succulent \
"

RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk update \
    && apk upgrade && apk add --no-cache \
    python3 \
    python3-dev \
    $PACKAGES \
    && rm -rf /var/cache/apk/*

# copy our Python script and configuration file in yaml
COPY run.py .
# start optimization
RUN python3 run.py

CMD ["/bin/sh"]
