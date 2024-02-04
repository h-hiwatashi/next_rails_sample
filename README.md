# next_rails_sample-
Next(ts) & Railsのサンプルアプリ

## Docker command
### 新規作成時
```
docker compose run --rm rails rails new . --force --api --database=mysql --skip-action-cable --skip-sprockets --skip-turbolinks --skip-webpack-install --skip-test --skip-bundle
```

## css開発方針
- 原則、sxプロパティでスタイル定義を行う。
- 複数の React コンポーネントで共通利用することが想定される一部スタイルのみ、emotionを利用する。

## NextのAPI関連ライブラリ
GETのときはSWR
POST, PATHC, DELETEのときはaxios