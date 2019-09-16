FROM golang:1.11-alpine AS build

RUN apk add --update --no-cache gcc git build-base

WORKDIR /go/src/app
ADD ./src /go/src/app
# COPY main*.go go.* /go/src/app
RUN CGO_ENABLED=0 go build -o /bin/demo

EXPOSE 80

CMD ["go", "test", "-v"]
# CMD ["go", "run", "main.go"]
