#!/bin/sh

# Define the project name
PROJECT_NAME="demostore"

# Custom boot script, executed by Dockware's entrypoint.sh.
# Upon initialization, entrypoint.sh checks if "/var/www/boot_start.sh" exists,
# to execute the script before any further action. Therefore, this file should be
# exposed to the APP container through the volume. Any pre-initialization action
# could / should be defined here...

# Define variables for localhost .env
ENV_VARIABLES="# Generated for localhost by Docker's boot_start.sh...
APP_DEBUG=1
APP_ENV=dev
APP_URL=http://${PROJECT_NAME}.local
APP_NAME=${PROJECT_NAME}
APP_SECRET=4d1de74237de9ef9be7c394250743cae
INSTANCE_ID=579c95cdba2243ddbe4ac8905ec72cef
COMPOSER_ROOT_VERSION=1.0.0
DATABASE_URL=mysql://root:root@db:3306/shopware
DISABLE_ADMIN_COMPILATION_TYPECHECK=1
LOCK_DSN=flock
NODE_VERSION=v20
NVM_VERSION=v0.39.0
PROJECT_ENVIRONMENT_TYPE=development
ENVIRONMENT=dev
REDIS_CACHE_DATABASE=0
REDIS_SESSION_DATABASE=2
SHOPWARE_ADMIN_BUILD_ONLY_EXTENSIONS=1
OPENSEARCH_URL=http://elasticsearch:9200
SHOPWARE_ES_ENABLED=0
SHOPWARE_ES_INDEXING_ENABLED=0
SHOPWARE_ES_INDEX_PREFIX=sw6
SHOPWARE_ES_THROW_EXCEPTION=1
SHOPWARE_HTTP_CACHE_ENABLED=1
SHOPWARE_SKIP_WEBINSTALLER=1
STOREFRONT_PROXY_PORT=9998
STOREFRONT_ASSETS_PORT=9999
STOREFRONT_PROXY_URL=http://${PROJECT_NAME}.local
PROXY_URL=http://${PROJECT_NAME}.local
BLUE_GREEN_DEPLOYMENT=0
"

# Check if .env file exists, create if not
if [ ! -f /var/www/html/.env ]; then
    touch /var/www/html/.env
fi

# Append or overwrite .env file
printf "%s" "$ENV_VARIABLES" > /var/www/html/.env
