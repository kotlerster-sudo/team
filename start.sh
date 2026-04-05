#!/bin/sh
set -e

if [ -z "$DATABASE_URL" ]; then
  echo "ERROR: DATABASE_URL is not set"
  exit 1
fi

echo "Running database migrations..."
DATABASE_URL="$DATABASE_URL" npx prisma migrate deploy

echo "Starting Next.js..."
exec npx next start
