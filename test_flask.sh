#!/bin/bash -ex
# ./start_flask.sh
# のあとに実行

SCRIPT_DIR=$(
	cd $(dirname $0)
	pwd
)
. $SCRIPT_DIR/app.conf

curl -v "http://127.0.0.1:${FLASKPORT}${BASEDIR}/hello"
