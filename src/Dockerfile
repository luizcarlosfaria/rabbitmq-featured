ARG  BASE_TAG=xxx-unknow-not-defined-name-xxx
FROM rabbitmq:$BASE_TAG
ARG BASE_TAG

RUN if [ "${BASE_TAG#*alpine}" != "$BASE_TAG" ]; then \
        apk update && apk add curl; \
    else \
        apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*; \
    fi

RUN rabbitmq-plugins enable --offline \
rabbitmq_mqtt rabbitmq_web_mqtt \
rabbitmq_shovel rabbitmq_shovel_management \
rabbitmq_prometheus \
rabbitmq_stream \
rabbitmq_management

ADD ./rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

# rabbitmq_stomp rabbitmq_web_stomp \
# rabbitmq_federation rabbitmq_federation_management \
