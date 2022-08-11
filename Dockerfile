FROM alpine

ENV VERSION 1.3
ENV VERLITE 1.3.5

WORKDIR /etc/elmtool

RUN set -xe && \
    UNAME=$(uname -m) && LONG_BIT=$(getconf LONG_BIT) && echo ${UNAME} && echo ${LONG_BIT} && if [ "$UNAME" = "x86_64" ];then export PLATFORM=amd64; else if [ "$LONG_BIT" = "64" ];then export PLATFORM=arm64; else export PLATFORM=arm; fi fi && \
    apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    wget https://github.com/zelang/elm-release/releases/download/${VERSION}/elm-${VERLITE}-linux-${PLATFORM}.tar.gz && \
    tar -xvf elm-${VERLITE}-linux-${PLATFORM}.tar.gz && rm -rf elm-${VERLITE}-linux-${PLATFORM}.tar.gz

RUN chmod +x /etc/elmtool/elm
CMD ["/etc/elmtool/elm"]