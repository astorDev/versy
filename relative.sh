#! /bin/bash

. ./suffix.sh

calver() {
    suffix

    echo "Calculating version (RUN='$RUN', SUFFIX='$SUFFIX')"

    if [ "$RUN" = "" ]; then
        echo "Required variable RUN is empty. exiting..."
        exit 1
    fi

    VERSION=$(date +'%Y.1%m.1%d').$RUN$SUFFIX
    echo "Calculated version: $VERSION"
}

nuget() {
    if [ "$VERSION" = "" ]; then
    echo "Required variable VERSION is empty. exiting..."
    exit 1
    fi

    if [ "$PROJECT" = "" ]; then
        echo "Required variable PROJECT is empty. exiting..."
        exit 1
    fi

    if [ "$NUGET_API_KEY" = "" ]; then
        echo "Required variable NUGET_API_KEY is empty"
        exit 1
    fi

    if [ "$NUGET_SOURCE" = "" ]; then
        echo "Setting NUGET_SOURCE to default value 'https://api.nuget.org/v3/index.json'"
        NUGET_SOURCE="https://api.nuget.org/v3/index.json"
    fi

    echo "Packing project with: 'dotnet pack ./$PROJECT.csproj /p:PackageVersion=$VERSION -o ./'"
    dotnet pack ./$PROJECT.csproj /p:PackageVersion=$VERSION -o ./

    echo "Extracting project name with: 'PROJECT_NAME=\${PROJECT##*/}'"
    PROJECT_NAME=${PROJECT##*/}

    echo "Publishing package with: 'dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY'"
    dotnet nuget push $PROJECT_NAME.$VERSION.nupkg -s $NUGET_SOURCE -k $NUGET_API_KEY
}

calver_nuget() {
    calver
    nuget
}

ACTION=${1}
echo "Executing action '$ACTION'"
$ACTION