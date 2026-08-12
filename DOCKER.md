# Docker（WSL Ubuntu）での起動

Docker Desktop の Settings > Resources > WSL Integration で Ubuntu を有効にしてから、
WSL Ubuntu のターミナルで以下を実行します。

```bash
cd /home/takuma/projects/ruby/furima-41465
docker compose up --build
```

初回起動時にデータベースの作成とマイグレーションが自動実行されます。
起動後は http://localhost:3000 を開いてください。

停止は `Ctrl+C`、コンテナの削除は `docker compose down` です。
データベースも初期化する場合は `docker compose down -v` を実行します。

決済機能を試す場合は `.env.example` を `.env` にコピーし、Pay.jp のテスト用キーを設定してください。
