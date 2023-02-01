FROM fluent/fluentd:v1.15.3-debian-1.1

USER root

RUN apt-get update && \
    apt-get install make gcc -y

RUN gem install google-protobuf -v 3.21.12 && \
    gem install fluent-plugin-kinesis -v 3.4.2

USER fluent

COPY fluent.conf /fluentd/etc

EXPOSE 9880
