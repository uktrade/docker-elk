FROM docker.elastic.co/beats/metricbeat:7.6.2

COPY modules.d /usr/share/metricbeat/modules.d
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml

COPY entrypoint.sh bin/entrypoint.sh

USER root
RUN mkdir /usr/share/metricbeat/config
RUN chown root:metricbeat /usr/share/metricbeat/metricbeat.yml
RUN chmod go-w /usr/share/metricbeat/metricbeat.yml
RUN chown -R  root:metricbeat /usr/share/metricbeat/modules.d/
RUN chmod -R go-w /usr/share/metricbeat/modules.d/
RUN chown root:metricbeat bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
RUN chown metricbeat:metricbeat /usr/share/metricbeat/config
USER metricbeat

ENTRYPOINT ["/bin/bash"]
CMD ["bin/entrypoint.sh"]
