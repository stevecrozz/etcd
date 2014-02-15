#!/bin/sh -e

. ./build

for i in `seq 1 10`; do
	go test -i ./tests/functional
	ETCD_BIN_PATH=$(pwd)/bin/etcd go test -v ./tests/functional -timeout 60s -run TestRemoveNode || exit
done
