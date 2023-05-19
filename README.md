# board.portal2.sr

The community driven leaderboard for Portal 2 speedrunners.

## Requirements

- PHP 8.0+
- composer
- apache2
- mysql-server

## Setup

- Install dependencies `composer install`
- Create folders `mkdir cache demos secret`
- Configure `VirtualHost` [conf file](#example---apache2-vhost--https)
- Enable a2enmod `rewrite`, `expires`, `headers`.
- Connect to the mysql instance and create the database once `create database iverborg_leaderboard;`
- Import the database `sudo mysql -u root -p iverborg_leaderboard < data/leaderboard.sql`
- Run all migrations in `migrations/`
- Create [secret files](#secret)
- Update cache once with `php api/refreshCache.php`
- Schedule a cronjob for `api/refreshCache.php` to run every minute
- Schedule a cronjob for `api/fetchNewScores.php` to run every 15 minutes
- Configure apache2 permissions with `chown -R ...` etc.

### Example - Apache2 VHost + HTTPS

Create a new file `/etc/apache2/sites-enabled/board.portal2.local.conf`.

Set the document root to the `public` folder and alias `demos` path for demo downloads.

SSL certs go into `/etc/apache2/ssl/`.

```conf
<VirtualHost board.portal2.local:443>
    DocumentRoot "/var/www/board.portal2.local/public"
    ServerName board.portal2.local

    SSLEngine on
    SSLCertificateFile "ssl/server.crt" 
    SSLCertificateKeyFile "ssl/server.key"

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

### Secret

#### database.json

Used to connect to the database instance.

```.json
{
    "host": "127.0.0.1",
    "user": "root",
    "password": "root",
    "database": "iverborg_leaderboard"
}
```

#### discord.json

Used to send Discord webhook messages for world record updates.

```.json
{
    "id": "",
    "token": "",
    "mdp": ""
}
```

#### steam_api_key.json

Used to fetch Steam profile data via [Steam's Web API].

[Steam's Web API]: https://steamcommunity.com/dev/apikey

```.json
{
    "key": ""
}
```

## TODO
- Look at old pull requests
  - Prevent potential attacks
    - Fix potential XSS attack and limit comment length
    - Escape all input forms
    - Prevent users deleting their Steam scores
    - Escape YouTube id
    - Look at older pull requests
    - Use https instead of http for external links
    - Prevent self ban and check if ban status is numeric
    - hasDate
  - World record submission warning and other fixes
    - Warn user when submitting a world record
    - Capitalized notes
  - New changelog parameters
    - Expose/implement `hasDate`, `id`, `wos`, `top`
    - Remove empty parameters from URL
    - Changelog id tooltip?
    - Tooltip for lost x points?
- Fix license?
- Add docker image?

## Done

- Improve privacy by removing tracking
- Improve privacy by setting a referrer policy
- Improve security by introducing Content-Security-Policy
- Fix insecure project structure which allowed file leaks
- Fix insecure cookies which allowed account takeover via XSS
- Fix insecure demo folder configuration which allowed XSS
- Fix missing integrity checks for CDN links
- Fix potential mime sniffing attacks
- Fix potential click-jacking attacks
- Fix sending user to "null" profile when login fails
- Fix announcement not disappearing
- Fix resolving usernames which do not exist
- Fix resolving chambers which do not exist
- Fix invalid date warning in activity chart
- Allow @ usernames for YouTube channels
- Clean up .htaccess/.gitignore
- Remove committed vendor files
- Remove unused composer dependencies
- Remove broken call to old Twitch API
- Switch to HTML 5
- Audit dependencies
- Audit recent code changes
- Rewrite README.md

## Out of scope

- Simplify code
- Optimize code
- Fix typos like "Requirments" etc.
- Remove old and useless TODOS, comments and unused code like least portals
- Unify secret files into a single file
- Unify global hard-coded values into a single file
- Rewrite queries to eliminate any potential SQL injections
- Respect ratelimit of Steam API
- Validation for correct Steam IDs
- Fix inline scripts/styles for CSP
- Improve and optimize routing
- Set `Content-Type` to `application/javascript` for `/json` endpoints
- Set status code to `404` for "not found" cases
- Changelog needs a maximum limit and pagination
- Remove YouTube inline player for better creditability and privacy (or make it a setting)
- Fix all PHP 8.0 warnings
- Fix potential issues in mdp

## Regression

- Small HTMl5 rendering issues with slider animations

## Credits

Originally developed and designed by [ncla].

[ncla]: https://github.com/ncla/Portal-2-Leaderboard

## License

Software licensed under CC Attribution - Non-commercial license.
https://creativecommons.org/licenses/by-nc/4.0/legalcode
