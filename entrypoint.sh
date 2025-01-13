#!/bin/bash

set -e -o pipefail

JAVA_OPTS=${JAVA_OPTS:-"-Xmx512M"}

# shellcheck disable=SC2086
java \
  --add-opens java.base/java.lang=ALL-UNNAMED \
  --add-opens java.base/java.time=ALL-UNNAMED \
  --add-opens java.base/sun.security.util=ALL-UNNAMED \
  --add-opens java.base/java.io=ALL-UNNAMED \
  --add-opens java.rmi/sun.rmi.transport=ALL-UNNAMED \
  $JAVA_OPTS \
  -Dlogback.configurationFile=${0%/*}/logback.xml \
  -jar lib/ace.jar \
  start
