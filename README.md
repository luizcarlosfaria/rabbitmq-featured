# rabbitmq-featured

Featured RabbitMQ Docker Image

## Prometheus

Enable per queue metrics

## Plugins

* rabbitmq_mqtt
* rabbitmq_web_mqtt

* rabbitmq_stomp
* rabbitmq_web_stomp

* rabbitmq_federation
* rabbitmq_federation_management

* rabbitmq_shovel
* rabbitmq_shovel_management 

* rabbitmq_stream

* rabbitmq_prometheus


Analisar metricas

```sh
while true; do
    clear && curl http://localhost:15692/metrics/per-object | grep rabbitmq_queue_messages_ready | grep asdasdasd;
    sleep 0.5; 
done
```
