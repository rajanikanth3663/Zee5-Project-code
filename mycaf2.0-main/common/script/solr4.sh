#!/bin/bash
gsutil cp gs://gcs-xx77-dev-solr-artifacts/solr-as1-playback/solr.in.sh /etc/default/solr.in.sh
# Give time for network to bootstrap
sleep 10
service solr restart
# Give time for Solr to startup
sleep 10
xx77_collections=" xx77_collections xx77_main_collection_v2 xx77_main_collection xx77_seo "
#https://solr.apache.org/guide/solr/latest/deployment-guide/replica-management.html#addreplica-parameters
for solr_collection in $xx77_collections
do
solrCloudHost=$(hostname -i)
url="http://$solrCloudHost:8983/solr/admin/collections?action=addreplica&collection=$solr_collection&shard=shard1&type=pull&node=$solrCloudHost:8983_solr"
echo "$url"
curl -XGET "$url"
done