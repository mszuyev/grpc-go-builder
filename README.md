### grpc-go-builder

Image to compile GRPC .proto files for Golang v.1.13

### How to run

basic example:

```
IMAGE_NAME=go-protoc-gen:1.13
PROJECT_DIR=my-awesome-project # subfolder of $GOPATH/src with your project

docker container run \
       -v "$GOPATH/src/$PROJECT_DIR":"/go/src/$PROJECT_DIR" \
       --rm -it \
       --name grpc-go-builder \
       mszuyev/grpc-go-builder:1.13 \
       /bin/sh -c "cd /go/src/$PROJECT_DIR && ./generate.sh"
```

**generate.sh** example:

```
#!/bin/bash

PROTO_DIR=protos # subfolder with .proto files
PROTO_FILES=$(find -L ./$PROTO_DIR -type f -name "*.proto") # if you want to compile all .proto files from $PROTO_DIR
OUT_DIR=subdir-with-result # specify here where to place generated files

protoc -I/protobuf/googleapis -I. --go_out=plugins=grpc:./$OUT_DIR $PROTO_FILES
protoc -I/protobuf/googleapis -I. --grpc-gateway_out=logtostderr=true:./$OUT_DIR $PROTO_FILES

# move generated files from subdirectory && delete subdirectory
cp $OUT_DIR/protos/*.go $OUT_DIR/ && rm -rf $OUT_DIR/protos
```
