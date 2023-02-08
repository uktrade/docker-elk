FROM fluent/fluentd:v1.15.3-1.0

USER root

RUN apk update && \
    apk upgrade && \
    apk add make gcc

RUN gem install google-protobuf -v 3.21.12 && \
    gem install fluent-plugin-kinesis -v 3.4.2

USER fluent

COPY fluent.conf /fluentd/etc

EXPOSE 9880
