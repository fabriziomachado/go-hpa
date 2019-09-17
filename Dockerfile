FROM golang:1.11-alpine AS base
RUN apk add --update --no-cache gcc git build-base

ADD ./src/app /go/src/app

WORKDIR /go/src/app
RUN CGO_ENABLED=0 go build -o /bin/app .

#RUN chmod +x /bin/sqrt

FROM scratch AS build
WORKDIR /go/src/app

COPY --from=base /bin/app /bin/app

EXPOSE 80

ENTRYPOINT ["/bin/app"]
