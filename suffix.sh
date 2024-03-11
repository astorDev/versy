if [ "$BRANCH" = "" ]; then
    echo "Required variable BRANCH is empty. exiting..."
    exit 1
fi

if [ "${MAIN}" = "" ]; then
    MAIN="main"
fi

if [ "$BRANCH" = "$MAIN" ]; then
    echo "Branch is main - no suffix"
    echo "SUFFIX="
else
    echo "Branch is not main - replacing / with - and adding - as suffix"
    NORMALIZED=${BRANCH//\//-}
    echo "SUFFIX=-$NORMALIZED"
fi