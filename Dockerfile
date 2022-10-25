FROM ttbb/elasticsearch:nake AS elasticsearch

FROM ttbb/kibana:nake

COPY --chown=sh --from=elasticsearch /opt/sh/elasticsearch /opt/sh/elasticsearch

COPY --chown=sh source /opt/sh

WORKDIR /opt/sh

ENV ELASTICSEARCH_HOME /opt/sh/elasticsearch

ENV KIBANA_HOME /opt/sh/kibana

USER sh

EXPOSE 5601 9200 9300

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/sh/scripts/start.sh"]
