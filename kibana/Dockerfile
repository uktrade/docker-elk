FROM docker.elastic.co/kibana/kibana:7.8.0

COPY kibana.yml /usr/share/kibana/config

COPY entrypoint.sh bin/
USER root
RUN chmod +x bin/entrypoint.sh
USER kibana

CMD ["/usr/share/kibana/bin/entrypoint.sh"]
