# flask-test-nginx-reverse-proxy

uWSGIでなく
revese proxyでアクセスできるようにした
デバッグ用のコード。

`app.conf`で`BASEDIR`の値をいじる。

```sh
./start_flask.sh
```
で開始。
デバッグモード & オートリロード。ログは標準出力

```sh
./test_flask.sh
```
でテスト。簡単なHTMLが帰る。

オートリロードなので`run.py`を編集すると再読込してくれる
(モジュールに関しては不明)。

```sh
./stop_flask.sh
```
で終了


# nginxとの連携

Debian/Ubuntuの場合`/etc/nginx/proxy_params`がある

```
  location /test1 {
    include /etc/nginx/proxy_params;
    proxy_pass http://localhost:4044/test1;
  }
```

TIPS: `proxy_pass`の最後に`/`を入れない

`nginx -t`でテストして、
`systemctl restart nginx`でリロード。

ブラウザからアクセスしてみる。


# これを書いた理由

FlaskのSSLの設定に自信がなかったから。
