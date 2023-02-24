#!/bin/bash

NAME=${1:-nano-node}

docker tag $NAME pwojcikdev/$NAME
docker push pwojcikdev/$NAME