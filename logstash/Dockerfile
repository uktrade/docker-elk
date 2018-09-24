FROM docker.elastic.co/logstash/logstash:6.4.1

RUN cd /usr/share/logstash && bin/logstash-plugin install logstash-input-kinesis && bin/logstash-plugin install logstash-output-kinesis

#COPY *.gem /usr/share/logstash/
#RUN cd /usr/share/logstash && ls *.gem | xargs bin/logstash-plugin install 

COPY logstash.yml /usr/share/logstash/config
COPY entrypoint.sh /usr/share/logstash/bin/entrypoint.sh
RUN rm /usr/share/logstash/pipeline/*
COPY pipeline/* /user/share/logstash/pipeline
USER root
RUN chown logstash:logstash bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
RUN chown logstash:logstash /usr/share/logstash/config/logstash.yml && chmod 0750 /usr/share/logstash/config/logstash.yml
USER logstash

EXPOSE 3332

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/share/logstash/bin/entrypoint.sh"]
