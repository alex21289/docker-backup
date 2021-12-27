FROM       golang:1.15

WORKDIR	/go/src/github.com/alex21289/docker-backup
COPY go.* ./
RUN	go mod tidy
COPY . .
RUN go install

FROM	busybox
COPY	--from=0 /go/bin/docker-backup /bin/
ENTRYPOINT [ "/bin/docker-backup" ]
