FROM docker.elastic.co/apm/apm-server:7.7.1

COPY apm-server.yml /usr/share/apm-server/apm-server.yml
COPY entrypoint.sh bin/entrypoint.sh

USER root
RUN mkdir /usr/share/apm-server/config
RUN chown root:apm-server /usr/share/apm-server/apm-server.yml
RUN chown root:apm-server bin/entrypoint.sh && chmod 0750 bin/entrypoint.sh
RUN chown apm-server:apm-server /usr/share/apm-server/config
USER apm-server

EXPOSE 8200

ENTRYPOINT ["/bin/bash"]
CMD ["bin/entrypoint.sh"]
