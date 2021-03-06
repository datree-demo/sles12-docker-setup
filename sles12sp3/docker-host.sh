#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/../common/enforce_root.sh

zypper refresh &&

ansible-playbook $DIR/../common/ansible/install_docker.yaml
