#!/bin/bash

# Directories
export shells_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export workspace_directory=${shells_directory}/../..
export src_directory=${workspace_directory}/src
export build_directory=${workspace_directory}/build
export tools_directory=${workspace_directory}/tools
export docker_directory=${tools_directory}/docker

# Docker
export docker_image=loic-yvo/ubuntu/gcc
export docker_image_version=${docker_image}:7-2
export container_alias=devenv
export docker_compose_path=${docker_directory}/compose.yml

# Others
export target_program_name=hello_world
export target_program_path=${build_directory}/bin/${target_program_name}
