#!/bin/sh
set -e

# Initialize runtime configuration and database, then start the server.

# Create .env from the example when missing.
if [ ! -f .env ]; then
    cp .env.example .env
fi

# Generate an application key when none is configured.
if ! grep -q '^APP_KEY=.\+' .env; then
    php artisan key:generate --force
fi

# Ensure the SQLite database file exists.
# DB_DATABASE defaults to a path inside a persisted volume (see compose.yaml).
DB_FILE="${DB_DATABASE:-/app/storage/database/database.sqlite}"
DB_DIR=$(dirname "$DB_FILE")
mkdir -p "$DB_DIR"
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

# Run migrations and seeders on every start so a recreated
# container is usable without rebuilding the image.
php artisan migrate --force --seed

# Serve Laravel on all interfaces so it is reachable from the host.
exec php artisan serve --host=0.0.0.0 --port=8000
