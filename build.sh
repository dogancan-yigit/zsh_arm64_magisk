#!/usr/bin/env bash
# for MSYS2 bash
# change

docker build -t zsh_magisk -f Dockerfile .
docker run --rm -t -v $(pwd -W):/zsh_magisk zsh_magisk
