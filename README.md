# mel.board.portal2.sr

Challenge Mode Leaderboard for Portal 2 Mods.

- [Local Development](#local-development)
  - [Caveats](#caveats)
  - [Overview of .env](#overview-of-env)
  - [Overview of .config.json](#overview-of-configjson)
- [Production](#production)
  - [Reverse Proxy (recommended)](#reverse-proxy-recommended)
- [Credits](#credits)
- [License](#license)

## Local Development

Requirements:

- [Docker Engine] | [Reference](https://docs.docker.com/compose/reference/)
- [mkcert]
- [Steam Web API Key]

[Docker Engine]: https://docs.docker.com/engine/install
[mkcert]: https://github.com/FiloSottile/mkcert
[Steam Web API Key]: https://steamcommunity.com/dev

Steps:

- Project setup with `./setup dev`
- Copy `cp docker/compose/board.portal2.local.yml docker-compose.yml`
- Start the containers with `docker compose up`
- Add the host entry `127.0.0.1 board.portal2.local` to `/etc/hosts`

The server should now be available at: `https://board.portal2.local`

### Caveats

- Permissions have to be managed manually for mounted volumes, see [moby#2259]
- MySQL 8 container leaks memory, see [containerd#6707]

[moby#2259]: https://github.com/moby/moby/issues/2259
[containerd#6707]: https://github.com/containerd/containerd/issues/6707

### Overview of .env

This is used by Dockerfile and docker-compose.yml.

| Variable            | Description                                                                                                                                                                                                           |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PROJECT_NAME        | This name is used as a prefix for the containers.                                                                                                                                                                     |
| SERVER_NAME         | The domain name which should be set before building the image. Docker will use it to mount the correct apache config file which links to the SSL certificates.                                                        |
| HTTP_PORT           | The unsafe HTTP port of the local host. Change it if a different port is needed e.g. [reverse proxy](#reverse-proxy-optional)                                                                                         |
| HTTPS_PORT          | The safe HTTPS port of the local host. Change it if a different port is needed e.g. [reverse proxy](#reverse-proxy-optional)                                                                                          |
| DATABASE_PORT       | The MySQL database port of the local host. NOTE: Make sure that the docker compose file does not expose the server to an unwanted address. By default it's mapped to `127.0.0.1`.                                     |
| MYSQL_ROOT_PASSWORD | The root's password of the MySQL database.                                                                                                                                                                            |
| APT_PACKAGES        | Optional apt-packages to build the server image. The image should be kept as small as possible but sometimes it is useful to install some packages (e.g. `vim`, `htop` etc.) in order to debug problems more quickly. |
| UID                 | User Identifier of host to map to `www-data` inside the container. Only relevant on Linux.                                                                                                                            |
| GID                 | Group Identifier of host to map to `www-data` inside the container. Only relevant on Linux.                                                                                                                           |

### Overview of .config.json

This is used by the server.

| Key                 | Description                                                                                 |
| ------------------- | ------------------------------------------------------------------------------------------- |
| database_host       | Address of the database. Docker creates a link to the container under the `database` alias. |
| database_user       | User login name for database.                                                               |
| database_pass       | User password for database access.                                                          |
| database_name       | The database name.                                                                          |
| discord_webhook_wr  | Discord webhook URL for sending world record updates to a Discord channel.                  |
| discord_webhook_mdp | Discord webhook URL for sending [mdp] data to a Discord channel.                            |
| steam_api_key       | The Steam Web API Key for fetching profile data.                                            |

[mdp]: https://github.com/p2sr/mdp

## Production

Mostly the same as in [development](#with-docker#) but use `./setup prod`
instead.

- Open `.env` file and set `SERVER_NAME` to the server domain
- Copy `cp docker/compose/mel.board.portal2.sr.yml docker-compose.yml`
- Finally use `docker compose up -d`

### Reverse Proxy (recommended)

A host might use a reverse proxy like Nginx for managing other web applications.
This makes managing sub-domains and SSL certificates much easier. Of course this
part can also be inside a docker container but it is left out in this example.

Make sure that the docker composer file uses a local address that can only be
reached within the host's network, or the container ports might get exposed to
the public. The example below assumes that nobody will call the container from
the outside and the inside except Nginx. Otherwise enable apache mod `remoteip`
and add `RemoteIPHeader` with `RemoteIPTrustedProxy` to the apache config. This
will verify if the requests are coming from the reverse proxy only.

```bash
~/$ cat .env
PROJECT_NAME=board
SERVER_NAME=mel.board.portal2.sr

HTTP_PORT=8880
HTTPS_PORT=8443
DATABASE_PORT=3306

MYSQL_ROOT_PASSWORD=root
MYSQL_USER=board
MYSQL_PASSWORD=board
MYSQL_DATABASE=board

APT_PACKAGES=
UID=1001
GID=1001
```

<details>
<summary>View example Nginx config file</summary>

```bash
~/$ cat /etc/nginx/sites-available/mel.board.portal2.sr
server {
    listen 80;
    server_name mel.board.portal2.sr;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name mel.board.portal2.sr;

    ssl_certificate /etc/letsencrypt/live/mel.board.portal2.sr/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/mel.board.portal2.sr/privkey.pem;
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

    location /uploadDemo {
        proxy_pass http://127.0.0.1:8443$request_uri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
        client_max_body_size 16M;
    }

    location /submitChange {
        proxy_pass http://127.0.0.1:8443$request_uri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
        client_max_body_size 16M;
    }

    location /api-v2/auto-submit {
        proxy_pass http://127.0.0.1:8443$request_uri;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
        client_max_body_size 16M;
    }
}
```

</details>

### Testing

Regression tests are written in TypeScript and require the
[Deno runtime](https://deno.com). Make sure to fill out the `AUTH_HASH` and
`COOKIE` constants.

```bash
just test
```

## Credits

- Originally developed and designed by [ncla] (2014-2015)
- Further development by [iVerb] (2016-2020)

[ncla]: https://github.com/ncla/Portal-2-Leaderboard
[iVerb]: https://github.com/iVerb1/Portal2Boards

## License

Software licensed under CC Attribution - Non-commercial license.
https://creativecommons.org/licenses/by-nc/4.0/legalcode
