FROM golang:1.9-alpine as build

RUN set -x \
 && apk add --update --no-cache git \
 && go get -u github.com/kazeburo/chocon

FROM alpine:3.6
COPY --from=build /go/bin/chocon /usr/local/bin/chocon
ENTRYPOINT ["/usr/local/bin/chocon"]

EXPOSE 3000

