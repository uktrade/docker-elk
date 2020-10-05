FROM docker.elastic.co/beats/filebeat:7.9.0

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY entrypoint.sh /usr/share/filebeat/entrypoint.sh


USER root
RUN chown -R root:filebeat /usr/share/filebeat
RUN chown root:filebeat /usr/share/filebeat/entrypoint.sh && chmod 0750 /usr/share/filebeat/entrypoint.sh
RUN chmod go-w /usr/share/filebeat/filebeat.yml

USER filebeat

ENTRYPOINT ["/bin/bash"]
CMD ["/usr/share/filebeat/entrypoint.sh"]
