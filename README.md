# next_rails_sample-
Next(ts) & Railsのサンプルアプリ

next_rails_sample/rails/entrypoint.sh
# 当ファイルが存在している=railsサーバーが起動していると判定
# rails/Dockerfileの最終行ENTRYPOINT ["entrypoint.sh"]で設定

## Docker command
### 新規作成時
docker compose run --rm rails rails new . --force --api --database=mysql --skip-action-cable --skip-sprockets --skip-turbolinks --skip-webpack-install --skip-test --skip-bundle
