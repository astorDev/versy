#! /bin/bash

. ./suffix.sh
. ./calver/.sh
. ./nuget/.sh

calver_nuget() {
    calver
    nuget
}

ACTION=${1}
echo "Executing action '$ACTION'"
$ACTION