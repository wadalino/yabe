# Frontend assets build stage.
FROM node:20-slim AS frontend

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build

# Runtime image with PHP and the built assets.
FROM php:8.3-cli

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
COPY composer.json composer.lock ./

RUN composer install --no-dev --no-interaction --no-progress --prefer-dist --optimize-autoloader

# Copy application source and built frontend assets.
COPY . .

COPY --from=frontend /app/public/build ./public/build

COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["docker-entrypoint.sh"]
