docker-mailcatcher-0.5.12
=========================

Run the container
-----------------

    sudo docker run \
      --name mailcatcher \
      --net host \
      -d \
      simpledrupalcloud/mailcatcher

Build the image
---------------

  TMP=$(mktemp -d) \
    && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git "${TMP}" \
    && cd "${TMP}" \
    && git checkout 0.5.12 \
    && sudo docker build -t simpledrupalcloud/mailcatcher:0.5.12 . \
    && cd -