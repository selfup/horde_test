set -e

GOOS=linux GOARCH=amd64 go build main.go

docker-compose up --build
