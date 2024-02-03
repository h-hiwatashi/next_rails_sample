#!/bin/bash
set -e

# railsのpidが存在している場合に削除する」処理
rm -f /myapp/tmp/pids/server.pid

exec "$@"