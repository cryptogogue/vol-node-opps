#/bin/bash

SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pushd ${SCRIPT_HOME}
        source ./vol-node-cpp/ops/make-version-header.sh
	docker build --no-cache -t $1 .
	docker push cuken/volition:beta
popd
