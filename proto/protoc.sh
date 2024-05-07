#!/bin/sh
#set -x

src=$(dirname $0)
dst=$src/pkg.go

# ensure target dir exists
mkdir -p $dst

protoc -I $src \
  --go_opt=paths=source_relative --go_out=$dst \
  $src/chat/messages/*.proto

protoc -I $src \
  --go_opt=paths=source_relative --go_out=$dst \
  --go-grpc_opt=paths=source_relative --go-grpc_out=$dst \
  $src/portal/*.proto

res=$? # last command execution
#echo $res
if [ $res -ne 0 ]; then
  exit $res
fi

echo "Generated Go source: $dst"