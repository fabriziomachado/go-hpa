FROM golang:1.11-alpine AS build

RUN apk add --update --no-cache gcc git build-base

WORKDIR /go/src/sqrt
ADD ./src /go/src/sqrt
# COPY main*.go go.* /go/src/sqrt
RUN CGO_ENABLED=0 go build -o /bin/sqrt

EXPOSE 80

CMD ["go", "test", "-v"]
# CMD ["go", "run", "main.go"]
