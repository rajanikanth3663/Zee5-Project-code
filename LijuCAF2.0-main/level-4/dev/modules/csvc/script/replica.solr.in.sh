#SOLR_JAVA_HOME=""

SOLR_HEAP="8g"
ZK_HOST="0.0.0.0:2181,0.0.0.0:2181,0.0.0.0:2181/solr"
ZK_CREATE_CHROOT=true
ZK_CLIENT_TIMEOUT="30000"
SOLR_TIMEZONE="IST"
# mount data directory on /var/solr/data
SOLR_HOME=/var/solr/data
SOLR_LOGS_DIR=/var/solr/logs
SOLR_REQUESTLOG_ENABLED=true
SOLR_PORT=8983
SOLR_JETTY_HOST="0.0.0.0"

# Environment should come from config dev, test,stage, prod
SOLR_OPTS="$SOLR_OPTS -Dsolr.environment=dev"