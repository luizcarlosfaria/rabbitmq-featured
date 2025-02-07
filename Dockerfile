ARG  BASE_TAG=4.0-management
FROM rabbitmq:$BASE_TAG
ARG BASE_TAG

RUN if [ "${BASE_TAG#*alpine}" != "$BASE_TAG" ]; then \
        apk update && apk add curl; \
    else \
        apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*; \
    fi

ADD ./rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

ENV RABBITMQ_FEATURE_FLAGS="khepri_db,detailed_queues_endpoint,rabbit_exchange_type_local_random,rabbitmq_4.0.0,message_containers_deaths_v2,quorum_queue_non_voters,stream_filtering,feature_flags_v2"

RUN rabbitmq-plugins enable --offline \
rabbitmq_mqtt rabbitmq_web_mqtt \
rabbitmq_stomp rabbitmq_web_stomp \
rabbitmq_federation rabbitmq_federation_management \
rabbitmq_shovel rabbitmq_shovel_management \
rabbitmq_prometheus \
rabbitmq_stream

