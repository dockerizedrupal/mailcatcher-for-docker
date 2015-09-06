# docker-mailcatcher

A [Docker](https://docker.com/) container for [MailCatcher](http://mailcatcher.me/).

## Run the container

Using the `docker` command:

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 443:443 \
      -p 25:25 \
      -e SERVER_NAME="localhost" \
      -e TIMEOUT="300" \
      -e PROTOCOLS="https,http" \
      -d \
      dockerizedrupal/mailcatcher:1.0.2
      
Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.2 \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.2 \
      && sudo docker build -t dockerizedrupal/mailcatcher:1.0.2 . \
      && cd -

## License

**MIT**
