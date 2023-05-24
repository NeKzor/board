# board.portal2.sr

The community driven leaderboard for Portal 2 speedrunners.

- [What's new](#whats-new)
- [Out of scope (for now)](#out-of-scope-for-now)
- [Regression](#regression)
- [Local development](#local-development)
  - [With Docker](#with-docker)
  - [Without Docker](#without-docker)
    - [Example - Apache2 VHost + HTTPS](#example---apache2-vhost--https)
- [Production](#production)
- [Credits](#credits)
- [License](#license)

## What's new

- Privacy
  - Removed tracking
  - Added referrer policy
- Security
  - Added Content Security Policy
  - Fixed insecure embedding of changelog filter values
  - Fixed insecure embedding of usernames on several pages
  - Fixed insecure HTTP links
  - Fixed insecure project structure which allowed file leaks
  - Fixed insecure cookies which allowed account takeover via XSS
  - Fixed insecure demo folder configuration which allowed XSS
  - Fixed missing integrity checks for CDN links
  - Fixed potential mime sniffing attacks
  - Fixed potential click-jacking attacks
- Bugfixes
  - Fixed sending user to null-profile when login fails
  - Fixed announcement not disappearing
  - Fixed resolving usernames which do not exist
  - Fixed resolving chambers which do not exist
  - Fixed invalid date warning in activity chart
  - Removed broken call to old Twitch API
- Features
  - Allow @ usernames for YouTube channels
  - Render page in HTML 5
- Meta
  - Removed committed vendor files
  - Removed unused composer dependencies
  - Cleaned up .htaccess/.gitignore
  - Audited dependencies
  - Audited recent code changes
  - Updated README.md
  - Added support for Docker

## Out of scope (for now)

- Bug fixes
  - Fix pending filter value switching between 0, 1 and 2
  - Fix UI in changelog showing point loss
- Clean up
  - ~~Unify secret files into a single file~~
  - Unify global hard-coded values into a single file
  - Fix typos like "Requirments" etc.
  - Remove old and useless TODOs, comments and unused code like least portals
  - Fix all PHP 8.0+ warnings
  - Remove redundant `wr_gain` column in changelog
  - Remove unnecessary synchronization between `changelog` and `scores` tables
  - Move code folders and files into a single `src`folder
  - Move mdp files into a folder
- Code quality
  - Simplify and optimize update code
  - Improve and optimize routing
  - Set `Content-Type` to `application/javascript` for `/json` endpoints
  - Set status code to `404` for "not found" cases
- Potential issues
  - Rewrite queries to eliminate any potential SQL injections
  - Respect ratelimit of Steam API
  - Validation for correct Steam IDs
  - Fix inline scripts/styles for CSP
  - Changelog needs a maximum limit and pagination
  - Limit comment length
  - Prevent users deleting their Steam scores
  - Fix potential issues in mdp
- Features
  - Remove YouTube inline player for better creditability and privacy (or make it a setting)
  - Add ability to filter banned times

## Regression

- Small HTMl5 rendering issues with slider animations

## Local development

### With Docker

Requirements:

- [Docker Engine] | [Reference](https://docs.docker.com/compose/reference/)
- [mkcert]

[Docker Engine]: https://docs.docker.com/engine/install
[mkcert]: https://github.com/FiloSottile/mkcert

Configure `.env` and `.config.json` files:

```bash
cp .config.example.json .config.json
cp .example.env .env
```

Create log files:

```bash
touch docker/logs/access.log docker/logs/error.log docker/logs/debug.txt
```

Create self-signed certificates with mkcert:

```bash
site=board.portal2.local mkcert -cert-file docker/ssl/$site.crt -key-file docker/ssl/$site.key $site
```

Extract the database dump:

```bash
echo 'USE iverborg_leaderboard;' > docker/initdb/_init.sql
gunzip -c data/leaderboard.gz >> docker/initdb/_init.sql
```

Build the image once with `docker compose build` and then start the containers with `docker compose up`.

Volumes should automatically mount to `docker/volumes`.
Only the folders `cache`, `demos` and `sessions` require group `www-data`.

```bash
chown -R www-data:www-data docker/volumes/cache docker/volumes/demos docker/volumes/sessions docker/logs
```

Containers can be stopped with `docker compose down`.

### Without Docker

Requirements:

- curl
- php8.1-cli
- php8.1-curl
- apache2
- libapache2-mod-php
- php-mysql
- mysql-server
- composer

Setup:

- Enable php mods `a2enmod rewrite expires headers ssl`
- Install dependencies `composer install`
- Create folders `mkdir cache demos logs sessions`
- Configure `VirtualHost` [conf file](#example---apache2-vhost--https)
- Connect to the mysql instance and create the database once `create database iverborg_leaderboard;`
- Import the database `sudo mysql -u root -p iverborg_leaderboard < data/leaderboard.sql`
- Run all migrations in `migrations/`
- Update cache once with `php api/refreshCache.php`
- Schedule a cronjob for `api/refreshCache.php` to run every minute
- Schedule a cronjob for `api/fetchNewScores.php` to run every 15 minutes
- Configure apache2 permissions with `chown -R ...` etc.

#### Example - Apache2 VHost + HTTPS

Create a `/etc/apache2/sites-available/board.portal2.local.conf` file and enable it `a2ensite board.portal2.local`.

Set the document root to the `public` folder and alias `demos` path for demo downloads.

SSL certs go into `/etc/apache2/ssl`.

```conf
<VirtualHost board.portal2.local:443>
    DocumentRoot "/var/www/board.portal2.local/public"
    ServerName board.portal2.local

    SSLEngine on
    SSLCertificateFile "ssl/board.portal2.local.crt"
    SSLCertificateKeyFile "ssl/board.portal2.local.key"

    <Directory "/var/www/board.portal2.local/public">
        AllowOverride all
        Require all granted
    </Directory>

    Alias "/demos" "/var/www/board.portal2.local/demos"

    <Directory "/var/www/board.portal2.local/demos">
        AllowOverride None
        Require all granted
        AddType application/octect-stream .dem
    </Directory>
</VirtualHost>
```

## Production

Same as in [local development](#local-development) except `docker-compose.prod.yml` is used:

```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up
```

Example with Nginx + letsencrypt + proxy pass:

```bash
~/$ cat .env
PROJECT_NAME=board
SERVER_NAME=board.portal2.sr

HTTP_PORT=8880
HTTPS_PORT=8443

PHP_VERSION=php81
DATABASE_VERSION=mysql8

MYSQL_ROOT_PASSWORD=root
```

```bash
~/$ cat /etc/nginx/sites-available/board.portal2.sr
server {
    listen 80;
    server_name board.portal2.sr;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name board.portal2.sr;

    ssl_certificate /etc/letsencrypt/live/board.portal2.sr/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/board.portal2.sr/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    location / {
        proxy_pass http://127.0.0.1:8443$request_uri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
    }
}
```

## Credits

Originally developed and designed by [ncla].

[ncla]: https://github.com/ncla/Portal-2-Leaderboard

## License

Software licensed under CC Attribution - Non-commercial license.
https://creativecommons.org/licenses/by-nc/4.0/legalcode
