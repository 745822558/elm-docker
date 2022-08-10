FROM alpine

ENV VERSION 1.3
ENV VERLITE 1.3.3

RUN set -xe && \
    UNAME=$(uname -m) && if [ "$UNAME" = "x86_64" ]; then export PLATFORM=amd64 ; else export PLATFORM=arm64 ; fi && \
    apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    wget https://github.com/zelang/elm-release/releases/download/${VERSION}/elm-${VERLITE}-linux-${PLATFORM}.tar.gz && \
    tar -xvf elm-${VERLITE}-linux-${PLATFORM}.tar.gz

WORKDIR /etc/elmtool
COPY elm /etc/elmtool
RUN chmod +x /etc/elmtool/elm
CMD ["/etc/elmtool/elm"]