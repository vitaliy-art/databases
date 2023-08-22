#!/bin/bash

cargo install diesel_cli --no-default-features --features sqlite
diesel migration run
