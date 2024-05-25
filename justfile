set dotenv-load
set positional-arguments

project := env_var('PROJECT_NAME')

backup_file := justfile_directory() + '/docker/volumes/backups/${MYSQL_DATABASE}_backup_latest.sql.gz'

cnf := replace_regex('[client]
user=$MYSQL_USER
password=$MYSQL_PASSWORD
[clientroot]
user=root
password=$MYSQL_ROOT_PASSWORD
[mysql]
database=$MYSQL_DATABASE', '[\n]', "\\\\n")

dump_options := '--defaults-group-suffix=root --hex-blob --net-buffer-length 100K --routines --databases $MYSQL_DATABASE'

# List available recipes.
help:
    just -lu

# Analyze all .php source files.
check:
    vendor/bin/phpstan analyse -l 9 classes util views

# Start all containers. Accepts arguments like `-d` to start in background.
up *args='':
    docker compose up $@

# Stop all containers.
down:
    docker compose down

# Build the server image.
build:
    docker compose build

# Start and recreate containers.
reload:
    docker compose up -d --force-recreate

# Refresh leaderboard cache.
cache:
    docker exec -u www-data -ti {{project}}-server php -f /var/www/html/util/refreshCache.php > /dev/null 2>&1

# Update Steam profiles.
update-profiles:
    docker exec -u www-data -ti {{project}}-server php -f /var/www/html/util/fetchImportantProfileData.php

# Open shell in server container.
debug: server-debug

# Open shell in server container.
server-debug:
    docker exec -ti {{project}}-server bash

# Restart server container.
server-restart:
    docker container restart {{project}}-server

# Stop server container.
server-stop:
    docker container stop {{project}}-server

# Connect to database.
db:
    docker exec -ti {{project}}-db bash -c 'printf {{cnf}} > /etc/my.cnf' && docker exec -ti {{project}}-db mysql

# Open shell in database container.
db-debug:
    docker exec -ti {{project}}-db bash

# Restart database container.
db-restart:
    docker container restart {{project}}-db

# Stop database container.
db-stop:
    docker container stop {{project}}-db

# Dump and compress a backup of the database.
db-dump:
    docker exec -ti {{project}}-db bash -c 'mysqldump {{dump_options}} | gzip -8 > /backups/${MYSQL_DATABASE}_dump_$(date +%Y-%m-%d-%H.%M.%S).sql.gz'

# Only dump a backup of the database.
db-dump-raw:
    docker exec -ti {{project}}-db bash -c 'mysqldump {{dump_options}} > /backups/${MYSQL_DATABASE}_dump_$(date +%Y-%m-%d-%H.%M.%S).sql'

# Backup and upload database.
backup:
    docker exec {{project}}-db bash -c 'mysqldump {{dump_options}} | gzip -8 > /backups/${MYSQL_DATABASE}_backup_latest.sql.gz'
    deno run --allow-env --allow-read --allow-net backup.ts {{backup_file}} \
        --filename=${MYSQL_DATABASE}_backup_latest.sql.gz \
        --user-agent=${SERVER_NAME}
