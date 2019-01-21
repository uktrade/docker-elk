FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4

RUN bin/elasticsearch-plugin install --batch discovery-ec2
RUN bin/elasticsearch-plugin install --batch repository-s3
RUN bin/x-pack/syskeygen

#RUN sed -i 's/info/debug/g' /usr/share/elasticsearch/config/log4j2.properties

ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

COPY entrypoint.sh bin/entrypoint.sh
USER root
RUN chown elasticsearch:elasticsearch bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
USER elasticsearch

CMD ["/bin/bash", "bin/entrypoint.sh"]
