#!/bin/bash
gsutil cp gs://gcs-ott007-dev-solr-artifacts/solr-as1-playback/solr.in.sh /etc/default/solr.in.sh
# Give time for network to bootstrap
sleep 10
service solr restart
# Give time for Solr to startup
sleep 10
ott007_collections=" ott007_collections ott007_main_collection_v2 ott007_main_collection ott007_seo "
#https://solr.apache.org/guide/solr/latest/deployment-guide/replica-management.html#addreplica-parameters
for solr_collection in $ott007_collections
do
solrCloudHost=$(hostname -i)
url="http://$solrCloudHost:8983/solr/admin/collections?action=addreplica&collection=$solr_collection&shard=shard1&type=pull&node=$solrCloudHost:8983_solr"
echo "$url"
curl -XGET "$url"
done