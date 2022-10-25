#!/bin/bash

/opt/sh/elasticsearch/bin/elasticsearch -Ediscovery.type=single-node -Enetwork.host=0.0.0.0
tail -f /dev/null
