FROM golang:alpine AS build

RUN apk add git

ENV GO111MODULE=on CGO_ENABLED=0 APP=horde_test

COPY . $GOPATH/src/github.com/selfup/$APP

WORKDIR $GOPATH/src/github.com/selfup/$APP

RUN go mod download && go build -o /go/bin/$APP

FROM scratch

EXPOSE 8080

COPY --from=build /go/bin/horde_test /go/bin/horde_test

CMD ["/go/bin/horde_test"]
