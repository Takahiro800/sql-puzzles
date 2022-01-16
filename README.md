# sql-puzzles
SQLパズルの学習用ディレクトリ。Google BigQuery用

## 設定
dataset名：dataset

# Projectを切り替える

### project一覧

```bash
bq ls -p
```

### デフォルトプロジェクトの確認

```bash
gcloud config list
```

### デフォルトプロジェクトの切り替え

```bash
gcloud config set project <project-name>
```
