FROM golang:1.12-alpine AS base

RUN apk add \
      --update \
      --no-cache \
      ca-certificates git gcc libc-dev g++

WORKDIR /go/src/github.com/KamilLelonek/skeleton-api

ENV GO111MODULE=on

COPY go.mod .
COPY go.sum .

RUN go mod download

FROM base AS builder

COPY . .

RUN CGO_ENABLED=1 \
    GOOS=linux \
    GOARCH=amd64 \
    go build -a -installsuffix cgo -o /go/bin/skeleton-api .

FROM alpine AS runner

RUN apk add \
      --update \
      --no-cache \
      ca-certificates

COPY --from=builder /go/bin/skeleton-api .

EXPOSE 8080

CMD ["./skeleton-api"]
