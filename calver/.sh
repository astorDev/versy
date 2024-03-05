#!/bin/sh

if [ "$RUN" = "" ]; then
    echo "Required variable RUN is empty. exiting..."
    exit 1
fi

echo $(date +'%Y.1%m.1%d').$RUN$SUFFIX