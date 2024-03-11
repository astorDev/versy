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