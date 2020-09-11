FROM docker.elastic.co/logstash/logstash:7.8.0

RUN cd /usr/share/logstash && \
	bin/logstash-plugin install logstash-input-kinesis && \
	bin/logstash-plugin install logstash-codec-cloudwatch_logs && \
	bin/logstash-plugin install logstash-input-google_cloud_storage && \
	bin/logstash-plugin install logstash-input-exec && \
	bin/logstash-plugin install logstash-input-google_pubsub

#COPY *.gem /usr/share/logstash/
#RUN cd /usr/share/logstash && ls *.gem | xargs bin/logstash-plugin install

COPY logstash.yml /usr/share/logstash/config
COPY entrypoint.sh /usr/share/logstash/bin/entrypoint.sh
COPY pipelines/* /usr/share/logstash/config/pipelines/
COPY pipelines.yml /usr/share/logstash/config/pipelines.yml
USER root
RUN chown logstash:logstash bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
RUN chown logstash:logstash /usr/share/logstash/config/logstash.yml && chmod 0750 /usr/share/logstash/config/logstash.yml
USER logstash

EXPOSE 3332

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/share/logstash/bin/entrypoint.sh"]
