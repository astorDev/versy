#!/bin/sh

if [ "$RUN" = "" ]; then
    echo "Required variable RUN is empty. exiting..."
    exit 1
fi

source suffix.sh
export VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX
echo "Version is: $VERSION"