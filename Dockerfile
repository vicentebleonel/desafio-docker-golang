FROM golang:alpine as build

WORKDIR /app

COPY . .

RUN GOOS=linux go build -ldflags="-w -s" -o /app/desafio

FROM scratch

WORKDIR /app

COPY --from=build /app/desafio .

ENTRYPOINT ["./desafio"]

