FROM golang:1.17

WORKDIR	/docker-backup
COPY go.* ./
RUN	go mod tidy
COPY . .
RUN CGO_ENABLED=0 go build -o bin/docker-backup .

FROM	busybox
COPY	--from=0 /docker-backup/bin /bin/
ENTRYPOINT [ "/bin/docker-backup" ]