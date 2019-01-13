FROM golang:alpine AS build

RUN apk add git

ENV GO111MODULE=on CGO_ENABLED=0

COPY . $GOPATH/src/github.com/selfup/horde_test

WORKDIR $GOPATH/src/github.com/selfup/horde_test

RUN go mod download && go build -o /go/bin/horde_test

FROM scratch

COPY --from=build /go/bin/horde_test /go/bin/horde_test

CMD ["/go/bin/horde_test"]
