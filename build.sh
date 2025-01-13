#!/bin/env bash

TAG=${PWD##*/}

docker build -t "$TAG" .
docker image ls "$TAG"
