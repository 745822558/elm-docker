FROM ubuntu:latest
ARG TARGETPLATFORM
RUN echo "I'm building for $TARGETPLATFORM"
WORKDIR /etc/elmtool
COPY amd64/elm /etc/elmtool
RUN chmod +x /etc/elmtool/elm
CMD ["/etc/elmtool/elm"]