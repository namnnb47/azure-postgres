#!/bin/bash

PG_HOST="pgflexible-server.postgres.database.azure.com"
PG_PORT=5432
PG_USER="devuser"
PG_DB="mydb"


read -s -p "🔐 Nhập mật khẩu cho $PG_USER: " PG_PASSWORD
echo ""

PGPASSWORD=$PG_PASSWORD psql \
  -h $PG_HOST \
  -p $PG_PORT \
  -U $PG_USER \
  -d $PG_DB \
  "sslmode=$SSL_MODE"
