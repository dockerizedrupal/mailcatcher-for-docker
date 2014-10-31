# docker-mailcatcher-0.5.12

## Run the container

    CONTAINER="mailcatcher" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 1080:1080 \
      -p 1025:1025 \
      -d \
      simpledrupalcloud/mailcatcher:0.5.12

## Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 0.5.12 \
      && sudo docker build -t simpledrupalcloud/mailcatcher:0.5.12 . \
      && cd -
