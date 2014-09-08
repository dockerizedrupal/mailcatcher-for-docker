docker-mailcatcher
==================

Run the container
-----------------

    sudo docker run \
      --name mailcatcher \
      --net host \
      -d \
      simpledrupalcloud/mailcatcher

Build the image yourself
------------------------

    sudo docker build -t mailcatcher http://git.simpledrupalcloud.com/simpledrupalcloud/docker-mailcatcher.git