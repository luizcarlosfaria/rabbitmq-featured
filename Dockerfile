ARG  BASE_TAG=management
FROM rabbitmq:$BASE_TAG

ADD ./rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

RUN rabbitmq-plugins enable --offline \
rabbitmq_mqtt rabbitmq_web_mqtt \
rabbitmq_stomp rabbitmq_web_stomp \
rabbitmq_federation rabbitmq_federation_management \
rabbitmq_shovel rabbitmq_shovel_management 

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*