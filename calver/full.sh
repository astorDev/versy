#!/bin/sh
echo "Starting calver script (BRANCH='$BRANCH', MAIN='$MAIN', RUN='$RUN')"
printf "Calculating suffix..."
curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh
# export SUFFIX=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh)
# echo "Suffix is '$SUFFIX'"
# echo "Calculating version..."
# export VERSION=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/calver/.sh | sh)
# echo "Version is '$VERSION'"