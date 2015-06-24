#!/bin/bash

if ! hash docker; then
    wget -qO- https://get.docker.com/ | sh
    sudo usermod -aG docker matt
fi
