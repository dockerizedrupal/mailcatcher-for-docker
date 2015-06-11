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
      -d \
      viljaste/mailcatcher:latest
      
Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker-compose up

## Build the image

    TMP="$(mktemp -d)" \
      && GIT_SSL_NO_VERIFY=true git clone https://git.beyondcloud.io/viljaste/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/mailcatcher:latest . \
      && cd -

## License

**MIT**
