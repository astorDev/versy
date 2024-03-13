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
        echo "Current branch is main. No suffix needed."
        SUFFIX=""
    else
        echo "Branch '$BRANCH' is not main - calculating suffix..."
        NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
        SUFFIX="-$NORMALIZED"
    fi

    echo "Result suffix is '$SUFFIX'"
}