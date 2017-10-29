#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/../common/enforce_root.sh


$DIR/docker-host.sh &&

ansible-playbook $DIR/../common/ansible/jenkins_server.yaml &&

/usr/local/bin/docker-compose -t 30 -f $DIR/../common/docker-compose/jenkins/docker-compose.yaml up