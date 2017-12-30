FROM golang
ADD . /go/src/myapp
RUN go install myapp
ENTRYPOINT /go/bin/myapp
EXPOSE 8888