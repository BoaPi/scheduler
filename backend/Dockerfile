# build stage
FROM golang:1.18.1-alpine3.15 AS build
WORKDIR /
COPY . .
RUN go build -o main main.go

# run stage
FROM alpine:3.15.4
WORKDIR /
COPY --from=build /main .

EXPOSE 8080
CMD ["/main"]