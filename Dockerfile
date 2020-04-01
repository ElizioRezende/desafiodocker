FROM golang:alpine as builder

RUN apk add bash

WORKDIR $GOPATH/src/helloworld

COPY ./hello.go .
RUN go build hello.go

FROM scratch
COPY --from=builder /go/src/helloworld .
CMD ["/hello"]