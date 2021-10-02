#/bin/bash

SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd ${SCRIPT_HOME}

    source .env
    
    TAG=${1:-$TAG}

    if [[ -z "$TAG" ]]; then
        echo "TAG is undefined; please specify a tag on the command line or in .env."
        exit 1
    fi

    source $VOL_NODE_CPP/ops/make-version-header.sh
    docker build -f ./volition-base/Dockerfile -t volition-build-base .
    docker build -f ./Dockerfile --no-cache -t $TAG $VOL_NODE_CPP
    docker push $TAG
popd
