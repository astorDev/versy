if [ "$BRANCH" = "" ]; then
    echo "Required variable BRANCH is empty. exiting..."
    exit 1
fi

source main.sh

if [ "$BRANCH" = "$MAIN" ]; then
    echo "This is the main branch (named $MAIN). No suffix."
    export SUFFIX=""
else
    NORMALIZED=${BRANCH//\//-}
    export SUFFIX="-$NORMALIZED"
    echo "Not the main branch. Suffix (with branch name normalized): $SUFFIX"
fi