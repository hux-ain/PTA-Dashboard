#!/usr/bin/env bash

set -Eeuo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$APP_DIR"

PHP_BIN="${PHP_BIN:-php}"
COMPOSER_BIN="${COMPOSER_BIN:-composer}"
NPM_BIN="${NPM_BIN:-npm}"
GIT_BIN="${GIT_BIN:-git}"
BUILD_FRONTEND="${BUILD_FRONTEND:-false}"

maintenance_enabled=false
cleanup() {
    if [[ "$maintenance_enabled" == true ]]; then
        "$PHP_BIN" artisan up || true
    fi
}
trap cleanup EXIT

if ! command -v "$GIT_BIN" >/dev/null 2>&1; then
    echo "Error: Git was not found. Install Git before deploying." >&2
    exit 1
fi

echo "Pulling latest code from origin/main..."
"$GIT_BIN" pull --ff-only origin main

if [[ ! -f .env ]]; then
    echo "Error: .env file not found. Configure the production environment first." >&2
    exit 1
fi

if ! command -v "$PHP_BIN" >/dev/null 2>&1; then
    echo "Error: PHP was not found. Set PHP_BIN to the PHP executable." >&2
    exit 1
fi

if ! command -v "$COMPOSER_BIN" >/dev/null 2>&1; then
    echo "Error: Composer was not found. Set COMPOSER_BIN to the Composer executable." >&2
    exit 1
fi

echo "Putting application into maintenance mode..."
"$PHP_BIN" artisan down --render="errors::503" --retry=60
maintenance_enabled=true

echo "Installing PHP dependencies..."
"$COMPOSER_BIN" install --no-dev --prefer-dist --optimize-autoloader --no-interaction

echo "Running database migrations..."
"$PHP_BIN" artisan migrate --force

if [[ "$BUILD_FRONTEND" == true ]]; then
    if ! command -v "$NPM_BIN" >/dev/null 2>&1; then
        echo "Error: npm was not found. Install Node.js/npm or run without BUILD_FRONTEND=true." >&2
        exit 1
    fi

    echo "Installing frontend dependencies and building assets..."
    if [[ -f package-lock.json ]]; then
        "$NPM_BIN" ci --no-audit --no-fund
    else
        "$NPM_BIN" install --no-audit --no-fund
    fi
    "$NPM_BIN" run build
else
    if [[ ! -f public/build/manifest.json ]]; then
        echo "Error: public/build/manifest.json is missing. Run with BUILD_FRONTEND=true." >&2
        exit 1
    fi
    echo "Skipping frontend build; using tracked public/build assets."
fi

echo "Linking public storage..."
"$PHP_BIN" artisan storage:link || true

echo "Refreshing Laravel caches..."
"$PHP_BIN" artisan optimize:clear
"$PHP_BIN" artisan config:cache
"$PHP_BIN" artisan route:cache
"$PHP_BIN" artisan view:cache

echo "Deployment completed successfully."
