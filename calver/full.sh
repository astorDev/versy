#!/bin/sh
export SUFFIX=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/main/suffix.sh | sh)
curl -sSL https://raw.githubusercontent.com/astorDev/versy/main/calver/.sh | sh