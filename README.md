# docker-mailcatcher

A [Docker](https://docker.com/) container for [MailCatcher](http://mailcatcher.me/).

## MailCatcher (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 1080:1080 \
      -p 1025:1025 \
      -d \
      simpledrupalcloud/mailcatcher:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo fig up

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/mailcatcher:latest . \
      && cd -

## License

**MIT**
