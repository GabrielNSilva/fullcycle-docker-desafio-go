FROM golang:1.22-alpine AS builder

WORKDIR /go/src/app

COPY *go* .

RUN go build -v

FROM scratch

COPY --from=builder /go/src/app/hello .

CMD ["./hello"]