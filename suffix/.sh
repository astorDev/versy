suffix() {
    echo >&2 "Calculating suffix (BRANCH='$BRANCH', MAIN='$MAIN')"

    if [ "$BRANCH" = "" ]; then
        echo >&2 "Required variable BRANCH is empty. exiting..."
        exit 1
    fi

    if [ "${MAIN}" = "" ]; then
        echo >&2 "MAIN is empty - assigning default value 'main'"
        MAIN="main"
    fi

    if [ "$BRANCH" = "$MAIN" ]; then
        echo >&2 "Current branch is main. No suffix needed."
        echo ""
    else
        echo "Branch '$BRANCH' is not main - calculating suffix..."
        NORMALIZED=$(echo "$BRANCH" | sed 's/\//-/g')
        echo "-$NORMALIZED"
    fi
}