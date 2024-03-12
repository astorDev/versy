#! /bin/bash

source() {
    . ./$1.sh
}

source suffix
source calver/
source nuget/

calver_nuget() {
    calver
    nuget
}

ACTION=${1}
echo "Executing action '$ACTION'"
$ACTION