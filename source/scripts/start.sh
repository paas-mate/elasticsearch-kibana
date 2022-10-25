#!/bin/bash

mkdir -p /opt/sh/logs
nohup $ELASTICSEARCH_HOME/bin/elasticsearch -Ediscovery.type=single-node -Enetwork.host=0.0.0.0 >>/opt/sh/logs/elasticsearch.stdout.log 2>>/opt/sh/logs/elasticsearch.stderr.log &
echo '' > $KIBANA_HOME/config/kibana.yml
echo -e 'server.host: "0.0.0.0"' > $KIBANA_HOME/config/kibana.yml
nohup $KIBANA_HOME/bin/kibana >>/opt/sh/logs/kibana.stdout.log 2>>/opt/sh/logs/kibana.stderr.log &
tail -f /dev/null
