# FROM docker.elastic.co/logstash/logstash:6.8.6
FROM docker.elastic.co/logstash/logstash:7.17.8

RUN cd /usr/share/logstash && bin/logstash-plugin install logstash-output-kinesis

COPY entrypoint.sh /usr/share/logstash/bin/entrypoint.sh
COPY logstash.yml /usr/share/logstash/config
USER root
RUN chown logstash:logstash /usr/share/logstash/config/logstash.yml && chmod 0750 /usr/share/logstash/config/logstash.yml
USER logstash
RUN rm /usr/share/logstash/pipeline/*
COPY pipeline/ /usr/share/logstash/pipeline

EXPOSE 3332
ENTRYPOINT ["/bin/bash"]
CMD ["/usr/share/logstash/bin/entrypoint.sh"]

