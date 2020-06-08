#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# pylint: disable-msg=C0103, C0111

from flask import Flask, render_template
from datetime import timezone, datetime
import os

BASEDIR = os.environ.get("BASEDIR", "")  # nginx等でlocationに書くパス

app = Flask(__name__)

def now():
    return datetime.now(timezone.utc)

@app.route(f"{BASEDIR}/hello")
def hello():
    return render_template("hello.jinja2", now=now())


if __name__ == "__main__":
    app.run(
        host="127.0.0.1", port=4044, debug=True, use_reloader=True, use_debugger=True
    )
    # 開発用設定。"./app.py &"で debug & reloadモードで起動する
