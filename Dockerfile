FROM golang:1.17 AS builder

WORKDIR /app

COPY go.mod main.go ./

RUN go build -o go-app

FROM scratch

WORKDIR /app

COPY --from=builder /app/go-app . 

CMD ["./go-app"]
