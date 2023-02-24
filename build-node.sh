#!/bin/bash

NAME=${1:-nano-node}
ENV_NAME=${2:-nano-env}
COMPILER=${3:-gcc}

echo "NAME: $NAME"
echo "ENV_NAME: $ENV_NAME"
echo "COMPILER: $COMPILER"

# build environment image
docker build -f docker/ci/Dockerfile-base -t $ENV_NAME:base .
docker build --build-arg ENV_REPOSITORY=$ENV_NAME -f docker/ci/Dockerfile-$COMPILER -t $ENV_NAME:$COMPILER .

# build node image
docker build --build-arg ENV_REPOSITORY=$ENV_NAME --build-arg COMPILER=$COMPILER -f docker/node/Dockerfile -t $NAME .