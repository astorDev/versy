export BRANCH=feature/one && echo "BRANCH=$BRANCH => SUFFIX='$(sh .sh)'"
export BRANCH=main && echo "BRANCH=$BRANCH => SUFFIX='$(sh .sh)'"