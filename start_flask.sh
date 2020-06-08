#!/bin/sh
# Flaskのデバックモードで起動する。
# debuggerとautoreloadが有効になる
# あと複数リクエストは処理できない(--with-threads)
# 止めるときは./stop_flask.sh

SCRIPT_DIR=$(
	cd $(dirname $0)
	pwd
)
. $SCRIPT_DIR/app.conf

export FLASK_ENV=development
export FLASK_APP=app.py

flask run --port "$FLASKPORT" &

sleep 0.5
ps xf | fgrep "flask run" | fgrep -v grep

echo "----"
echo "Pleas access http://127.0.0.1:${FLASKPORT}${BASEDIR}/hello"
echo "----"
