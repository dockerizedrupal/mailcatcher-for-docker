# docker-mailcatcher

A Docker container for [MailCatcher](http://mailcatcher.me/)

## MailCatcher 0.5.12

### Stable release

#### Run the container

Using the `docker` command:

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 1080:1080 \
      -p 1025:1025 \
      -d \
      simpledrupalcloud/mailcatcher:0.5.12
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.5.12 \
      && fig up

#### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.5.12 \
      && sudo docker build -t simpledrupalcloud/mailcatcher:0.5.12 . \
      && cd -

### Development release

#### Run the container

Using the `docker` command:

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 1080:1080 \
      -p 1025:1025 \
      -d \
      simpledrupalcloud/mailcatcher:0.5.12-dev
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.5.12-dev \
      && fig up

#### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.5.12-dev \
      && sudo docker build -t simpledrupalcloud/mailcatcher:0.5.12-dev . \
      && cd -

## License

**MIT**
