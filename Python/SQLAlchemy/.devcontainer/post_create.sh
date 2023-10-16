#!/bin/bash

sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install build-essential libssl-dev libffi-dev python3-dev
poetry install
