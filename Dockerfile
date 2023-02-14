FROM ttbb/elasticsearch:nake-7 AS elasticsearch

FROM ttbb/kibana:nake-7

COPY --chown=sh --from=elasticsearch /opt/elasticsearch /opt/elasticsearch

COPY --chown=sh source /opt

WORKDIR /opt

ENV ELASTICSEARCH_HOME /opt/elasticsearch

ENV KIBANA_HOME /opt/kibana

USER sh

EXPOSE 5601 9200 9300

CMD ["/usr/bin/dumb-init", "bash", "-vx","/opt/scripts/start.sh"]
