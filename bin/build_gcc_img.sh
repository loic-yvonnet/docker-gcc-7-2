#!/bin/bash

bash_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker build -t loic-yvo/ubuntu/gcc:7.2 $bash_directory