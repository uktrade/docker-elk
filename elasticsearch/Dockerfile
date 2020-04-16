FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.1

RUN bin/elasticsearch-plugin install --batch discovery-ec2
RUN bin/elasticsearch-plugin install --batch repository-s3

RUN mkdir /usr/share/elasticsearch/config/saml/ && chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/saml/

ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

COPY entrypoint.sh bin/entrypoint.sh
USER root
RUN chown elasticsearch:elasticsearch bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
USER elasticsearch

CMD ["/bin/bash", "bin/entrypoint.sh"]
