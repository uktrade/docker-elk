FROM docker.elastic.co/beats/filebeat:7.7.0

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml

USER filebeat

RUN ["/bin/bash", "-c", "echo $GSUITE_KEY_FILE | base64 --decode > /usr/share/filebeat/credentials_file.json"]
