# Example FastAPI server with nginx

## Set up

Needs Docker and Nginx installed in the host.

The `nginx-conf` file has the configuration that needs to be added to the domain's
configuration in nginx.

## Running

```sh
$ docker build -t fastapi-example .
$ docker run -d -p 8000:8000 -e API_PATH="/api" \
    --restart unless-stopped \
    --name fastapi_app \
    fastapi-example
```

If you want a path other than `api`, change it in the `docker run` command and in
the nginx config.

To test:

```sh
$ curl https://domain/api
{"message":"Hello, World!"}
```

HTTPS should be configured in the nginx server (e.g. using certbot). It should be
transparent to the server here, but I'm not sure.
