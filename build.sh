#/bin/bash

SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd ${SCRIPT_HOME}

    source .env
    
    TAG=${1:-$TAG}

    source $VOL_NODE_CPP/ops/make-version-header.sh
    docker build -f ./volition-base/Dockerfile -t volition-build-base .
    docker build -f ./Dockerfile --no-cache -t $TAG $VOL_NODE_CPP
    docker push $TAG
popd
