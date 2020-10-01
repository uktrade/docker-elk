FROM docker.elastic.co/beats/metricbeat:7.6.2


COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
COPY entrypoint.sh bin/entrypoint.sh

USER root
RUN mkdir /usr/share/metricbeat/config &&\
chown root:metricbeat /usr/share/metricbeat/metricbeat.yml &&\ 
chmod go-w /usr/share/metricbeat/metricbeat.yml &&\
chown -R  root:metricbeat /usr/share/metricbeat/modules.d/ &&\
chmod -R go-w /usr/share/metricbeat/modules.d/ &&\
chown root:metricbeat bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh &&\
chown metricbeat:metricbeat /usr/share/metricbeat/config 

USER metricbeat

ENTRYPOINT ["bin/entrypoint.sh"]