#!/bin/sh
echo "Starting calver script (BRANCH='$BRANCH', MAIN='$MAIN', RUN='$RUN')"
printf "Calculating suffix..."

# if [ "$BRANCH" = "" ]; then
#     echo "Required variable BRANCH is empty. exiting..."
#     exit 1
# fi

# if [ "${MAIN}" = "" ]; then
#     MAIN="main"
# fi

# if [ "$BRANCH" = "$MAIN" ]; then
#     echo "Branch is main - no suffix"
#     echo "SUFFIX="
# else
#     echo "Branch '$BRANCH' is not main - calculating suffix..."
#     #NORMALIZED=${BRANCH//\//-}
#     #echo "SUFFIX=-$NORMALIZED"
# fi

echo "Checking normalization"
NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
echo "Normalized ($NORMALIZED)"

curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh
# export SUFFIX=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/suffix.sh | sh)
# echo "Suffix is '$SUFFIX'"
# echo "Calculating version..."
# export VERSION=$(curl -sSL https://raw.githubusercontent.com/astorDev/versy/powerful-calver/calver/.sh | sh)
# echo "Version is '$VERSION'"