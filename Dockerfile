FROM golang:1.14 as builder

WORKDIR /go/src/app
COPY . .    
RUN go build -ldflags "-s -w" hello_world.go

FROM scratch
COPY --from=builder /go/src/app/ .
ENTRYPOINT ["./hello_world"]  