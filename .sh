#! /bin/bash

suffix() {
    echo "Calculating suffix (BRANCH='$BRANCH', MAIN='$MAIN')"

    if [ "$BRANCH" = "" ]; then
        echo "Required variable BRANCH is empty. exiting..."
        exit 1
    fi

    if [ "${MAIN}" = "" ]; then
        echo "MAIN is empty - assigning default value 'main'"
        MAIN="main"
    fi

    if [ "$BRANCH" = "$MAIN" ]; then
        echo "This is main branch suffix is empty"
        echo "SUFFIX is"
    else
        echo "Branch '$BRANCH' is not main - calculating suffix..."
        NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
        echo "SUFFIX is -$NORMALIZED"
    fi   
}

calver() {
    x

    echo "Calculating version (RUN='$RUN', SUFFIX='$SUFFIX')"

    if [ "$RUN" = "" ]; then
        echo "Required variable RUN is empty. exiting..."
        exit 1
    fi

    VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX
}

ACTION=${1}

case $ACTION in
    "suffix")
        suffix
        ;;
    "calver")
        calver
        ;;
    *)
        echo "Unknown action: $ACTION"
        exit 1
        ;;
esac