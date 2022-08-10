FROM ubuntu:latest
WORKDIR /etc/elmtool
COPY arm64/elm /etc/elmtool
RUN chmod +x /etc/elmtool/elm
CMD ["/etc/elmtool/elm"]