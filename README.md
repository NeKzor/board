# board.portal2.sr

The community driven leaderboard for Portal 2 speedrunners.

- [What's new](#whats-new)
- [Out of scope (for now)](#out-of-scope-for-now)
- [Local Development](#local-development)
  - [With Docker](#with-docker)
    - [Caveats](#caveats)
    - [Overview of .env](#overview-of-env)
    - [Overview of .config.json](#overview-of-configjson)
  - [Without Docker](#without-docker)
    - [Example](#example)
- [Production](#production)
  - [Reverse Proxy (optional)](#reverse-proxy-optional)
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
  - Fixed insecure embedding of demo filename which allowed XSS
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
  - Fixed alignment of usernames for broken avatars
  - Fixed submission container not working when switching between chambers
  - Fixed profile history loading icon not resetting
  - Fixed invalid CSS syntax
- Features
  - Allow @ usernames for YouTube channels
  - Render page in HTML5
- Meta
  - Removed committed vendor files
  - Removed unused composer dependencies
  - Cleaned up .htaccess/.gitignore
  - Audited dependencies
  - Audited recent code changes
  - Updated README
  - Added support for Docker

## Out of scope (for now)

- Bug fixes
  - Auto-submission icon is not aligned in many places
  - Fix pending filter value switching between 0, 1 and 2
  - Fix UI in changelog showing point loss
- Clean up
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
  - Prevent users changing their comment
  - Fix potential issues in mdp
- Features
  - Remove YouTube inline player for better creditability and privacy (or make it a setting)
  - Add ability to filter banned times

## Local Development

### With Docker

Requirements:

- [Docker Engine] | [Reference](https://docs.docker.com/compose/reference/)
- [mkcert]
- [Steam Web API Key]

[Docker Engine]: https://docs.docker.com/engine/install
[mkcert]: https://github.com/FiloSottile/mkcert
[Steam Web API Key]: https://steamcommunity.com/dev

Steps:

- Project setup with `chmod +x setup && ./setup dev`
- Build the server image once with `docker compose build`
- Start the containers with `docker compose up`
- Add the host entry `127.0.0.1 board.portal2.local` to `/etc/hosts`

The server should now be available at: `https://board.portal2.local`

#### Caveats

- Permissions have to be managed manually for mounted volumes, see [moby#2259]
- MySQL 8 container leaks memory, see [containerd#6707]

[moby#2259]: https://github.com/moby/moby/issues/2259
[containerd#6707]: https://github.com/containerd/containerd/issues/6707

#### Overview of .env

This is used by Dockerfile and docker-compose.yml.

|Variable|Description|
|---|---|
|PROJECT_NAME|This name is used as a prefix for the containers.|
|SERVER_NAME|The domain name which should be set before building the image. Docker will use it to mount the correct apache config file which links to the SSL certificates.|
|HTTP_PORT|The unsafe HTTP port of the local host. Change it if a different port is needed e.g. [reverse proxy](#reverse-proxy-optional|
|HTTPS_PORT|The safe HTTPS port of the local host. Change it if a different port is needed e.g. [reverse proxy](#reverse-proxy-optional|
|DATABASE_PORT|The MySQL database port of the local host. NOTE: Make sure that the docker compose file does not expose the server to an unwanted address. By default it's mapped to `127.0.0.1`.|
|PHP_VERSION|The name of the server container.|
|DATABASE_VERSION|The name of the database container.|
|MYSQL_ROOT_PASSWORD|The root's password of the MySQL database.|
|APT_PACKAGES|Optional apt-packages to build the server image. The image should be kept as small as possible but sometimes it is useful to install some packages (e.g. `vim`, `htop` etc.) in order to debug problems more quickly.|

#### Overview of .config.json

This is used by the server.

|Key|Description|
|---|---|
|database_host|Address of the database. Docker creates a link to the container under the `database` alias.|
|database_user|User login name for database.|
|database_pass|User password for database access.|
|database_name|The database name.|
|discord_webhook_id|The webhook ID for sending wr updates to a Discord channel.|
|discord_webhook_token|The webhook token for sending wr updates to a Discord channel.|
|discord_webhook_mdp|Discord webhook URL for sending [mdp] data to a Discord channel.|
|steam_api_key|The Steam Web API Key for fetching profile data.|

[mdp]: https://github.com/p2sr/mdp

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
- cron

Setup:

- Enable php mods `a2enmod rewrite expires headers ssl`
- Install dependencies `composer install`
- Create folders `mkdir cache demos logs sessions`
- Link apache log files to `logs`
- Configure `VirtualHost` [conf file](#example---apache2-vhost--https)
- Connect to the mysql instance and create the database once `create database iverborg_leaderboard;`
- Import the database `sudo mysql -u root -p iverborg_leaderboard < data/leaderboard.sql`
- Run all migrations in `migrations/`
- Update cache once with `php api/refreshCache.php`
- Schedule a cron job for `api/refreshCache.php` to run every minute
- Schedule a cron job for `api/fetchNewScores.php` to run every 15 minutes
- Configure apache permissions with `chown -R ...` etc.

#### Example

This mainly explains what the [docker version](/docker/apache/board.portal2.local.conf) does.

Create a `/etc/apache2/sites-available/board.portal2.local.conf` file and enable it with `a2ensite board.portal2.local`.

Set the document root to the `public` folder and alias `demos` path for demo downloads.

SSL certs go into `/etc/apache2/ssl`.

```conf
<VirtualHost board.portal2.local:80>
    ServerName board.portal2.local
    Redirect permanent / https://board.portal2.local/
</VirtualHost>

<VirtualHost board.portal2.local:443>
    ServerName board.portal2.local
    DocumentRoot "/var/www/html/public"

    SSLEngine on
    SSLCertificateFile "ssl/board.portal2.local.crt"
    SSLCertificateKeyFile "ssl/board.portal2.local.key"

    <Directory "/var/www/html/public">
        AllowOverride all
        Require all granted
    </Directory>

    Alias "/demos" "/var/www/html/demos"

    <Directory "/var/www/html/demos">
        AllowOverride none
        Require all denied

        <FilesMatch "\.dem$">
            Require all granted
            Header set Content-Type application/octect-stream
        </FilesMatch>
    </Directory>
</VirtualHost>
```

## Production

Mostly the same as in [development](#with-docker#) but use `./setup prod` instead.

Open `.env` file and set `SERVER_NAME` to the server domain.

Move or link the SSL certificates in `docker/ssl` which should match `SERVER_NAME` in `.env`:
- `docker/ssl/board.portal2.sr.cert`
- `docker/ssl/board.portal2.sr.key`

Edit compose file `docker/compose/board.portal2.sr.yml` to match the limitations of the host.

Finally use `docker compose -f docker-compose.yml -f docker/compose/board.portal2.sr.yml up`

### Reverse Proxy (optional)

A host might use a reverse proxy like Nginx for managing other web applications. This makes managing sub-domains and SSL
certificates much easier. Of course this part can also be inside a docker container but it is left out in this example.

Make sure that the docker composer file uses a local address that can only be reached within
the host's network, or the container ports might get exposed to the public. The example below assumes that nobody
will call the container from the outside and the inside except Nginx. Otherwise enable apache mod
`remoteip` and add `RemoteIPHeader` with `RemoteIPTrustedProxy` to the apache config. This
will verify if the requests are coming from the reverse proxy only.

```bash
~/$ cat .env
PROJECT_NAME=board
SERVER_NAME=board.portal2.sr

HTTP_PORT=8880
HTTPS_PORT=8443
DATABASE_PORT=3306

PHP_VERSION=php81
DATABASE_VERSION=mysql8

MYSQL_ROOT_PASSWORD=root

APT_PACKAGES=
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
