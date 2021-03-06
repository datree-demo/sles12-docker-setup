#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/../common/enforce_root.sh

echo "Preparing environment for SLES12 SP3 Docker machine..." &&

echo "Adding repositories..." &&

zypper addrepo -fc http://download.opensuse.org/repositories/openSUSE:/Backports:/SLE-12/standard/openSUSE:Backports:SLE-12.repo
zypper addrepo -fc http://download.opensuse.org/repositories/openSUSE:/Backports:/SLE-12-SP1/standard/openSUSE:Backports:SLE-12-SP1.repo
zypper addrepo -fc http://download.opensuse.org/repositories/openSUSE:/Backports:/SLE-12-SP2/standard/openSUSE:Backports:SLE-12-SP2.repo
zypper addrepo -fc http://download.opensuse.org/repositories/openSUSE:/Backports:/SLE-12-SP3/standard/openSUSE:Backports:SLE-12-SP3.repo
zypper addrepo http://download.opensuse.org/repositories/devel:languages:python/SLE_12_SP3/devel:languages:python.repo



echo "Please answer with 'a' to trust all repos..." &&

zypper refresh &&

echo "SUSE zypper tool sucks and thats why its going to present you with a nice conflict." &&
echo "Do not be scared and take first resolution possible and proceed with the install." &&

zypper install ansible

echo  -n "Installed " &&
ansible-playbook --version



