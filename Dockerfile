FROM golang:1.13-alpine
RUN apk update \
    && apk add --no-cache bash mc git protobuf-dev \
    && go get -u -v -ldflags '-w -s' \
        github.com/Masterminds/glide \
        github.com/golang/protobuf/protoc-gen-go \
        github.com/gogo/protobuf/protoc-gen-gofast \
        github.com/gogo/protobuf/protoc-gen-gogo \
        github.com/gogo/protobuf/protoc-gen-gogofast \
        github.com/gogo/protobuf/protoc-gen-gogofaster \
        github.com/gogo/protobuf/protoc-gen-gogoslick \
        github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger \
        github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
        github.com/johanbrandhorst/protobuf/protoc-gen-gopherjs \
        github.com/pseudomuto/protoc-gen-doc \
        github.com/ckaznocha/protoc-gen-lint \
        github.com/mwitkow/go-proto-validators/protoc-gen-govalidators \
        moul.io/protoc-gen-gotemplate \
    && install -c $GOPATH/bin/protoc-gen* /usr/bin/ \
    && mkdir /protobuf \
    && chmod -R a+rw /protobuf \
    && cd /protobuf \
    && git clone https://github.com/googleapis/googleapis
