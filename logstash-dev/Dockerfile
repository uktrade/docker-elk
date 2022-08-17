FROM docker.elastic.co/logstash/logstash:7.17.5

RUN cd /usr/share/logstash && \
				bin/logstash-plugin install logstash-codec-cloudwatch_logs && \
				bin/logstash-plugin install logstash-input-kinesis && \
				bin/logstash-plugin install microsoft-logstash-output-azure-loganalytics

COPY logstash.yml /usr/share/logstash/config
COPY entrypoint.sh /usr/share/logstash/bin/entrypoint.sh
COPY pipelines/* /usr/share/logstash/config/pipelines/
COPY pipelines.yml /usr/share/logstash/config/pipelines.yml
USER root
RUN chown logstash:logstash bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
RUN chown logstash:logstash /usr/share/logstash/config/logstash.yml && chmod 0750 /usr/share/logstash/config/logstash.yml
USER logstash

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/share/logstash/bin/entrypoint.sh"]
