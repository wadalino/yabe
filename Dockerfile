# Frontend assets build stage.
FROM node:20-slim AS frontend

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# Runtime image with PHP and the built assets.
FROM php:8.4-cli

ENV COMPOSER_ALLOW_SUPERUSER=1

# System dependencies and PHP extensions required by Laravel with SQLite.
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    curl \
    sqlite3 \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Install PHP dependencies first to leverage Docker layer caching.
# Scripts are skipped here because artisan is not copied yet.
# All dependencies (including dev) are installed because the database
# seeder relies on faker via the model factories.
COPY composer.json composer.lock ./

RUN composer install --no-interaction --no-progress --prefer-dist --optimize-autoloader --no-scripts

# Copy application source and built frontend assets.
COPY . .

COPY --from=frontend /app/public/build ./public/build

# Regenerate the autoloader now that the full source (including artisan) is present.
RUN composer dump-autoload --optimize

COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]
