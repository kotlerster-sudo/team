#!/bin/sh
set -e

echo "DATABASE_URL is set: ${DATABASE_URL:+yes}${DATABASE_URL:-NO - variable is empty or missing}"

if [ -z "$DATABASE_URL" ]; then
  echo "ERROR: DATABASE_URL is not set. Cannot run migrations or start."
  exit 1
fi

echo "Running database migrations..."
DATABASE_URL="$DATABASE_URL" npx prisma migrate deploy

echo "Starting Next.js..."
exec npx next start
