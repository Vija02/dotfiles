#!/bin/sh

set -e -- discrete.tar.gz
base=https://storage.cloud.google.com/vija02-background
for tar; do
    curl "$base/$tar" | tar -xvzf -
done
