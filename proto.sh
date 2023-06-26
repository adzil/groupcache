#! /bin/sh

# Make sure the script fails fast.
set -e
set -u
set -x

PROTO_DIR=groupcachepb
TESTPB_DIR=testpb

protoc -I=$PROTO_DIR \
    --go_out=paths=source_relative:$PROTO_DIR \
    $PROTO_DIR/groupcache.proto

protoc -I=$PROTO_DIR \
   --go_out=paths=source_relative:. \
    $PROTO_DIR/example.proto

protoc -I=$TESTPB_DIR \
   --go_out=paths=source_relative:$TESTPB_DIR \
    $TESTPB_DIR/test.proto
