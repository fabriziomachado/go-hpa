FROM golang:1.11-alpine AS base
RUN apk add --update --no-cache gcc git build-base

ADD ./src /go/src

WORKDIR /go/src/sqrt
RUN CGO_ENABLED=0 go build -o /bin/sqrt
RUN chmod +x /bin/sqrt

FROM scratch AS build
WORKDIR /go/src/sqrt

COPY --from=base /bin/sqrt /bin/sqrt

EXPOSE 80

ENTRYPOINT ["/bin/sqrt"]
