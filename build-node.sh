#!/bin/bash

NAME=${1:-nano-node}

docker build -f docker/node/Dockerfile -t $NAME .