#!/bin/bash -e
# ./start_flask.shで起動したflaskを止める
ps xf | fgrep "flask run" | fgrep -v grep
pkill -f "flask run"

sleep 0.5
ps xf | fgrep "flask run" | fgrep -v grep
