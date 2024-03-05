if [ "$BRANCH" = "" ]; then
    echo "Required variable BRANCH is empty. exiting..."
    exit 1
fi

if [ "${MAIN}" = "" ]; then
    MAIN="main"
fi

if [ "$BRANCH" = "$MAIN" ]; then
    echo ""
else
    NORMALIZED=${BRANCH//\//-}
    echo "-$NORMALIZED"
fi