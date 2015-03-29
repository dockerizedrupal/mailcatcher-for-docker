# docker-mailcatcher

A [Docker](https://docker.com/) container for [MailCatcher](http://mailcatcher.me/).

## Run the container

Using the `docker` command:

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 80:80 \
      -p 25:25 \
      -d \
      viljaste/mailcatcher:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t viljaste/mailcatcher:latest . \
      && cd -

## License

**MIT**
