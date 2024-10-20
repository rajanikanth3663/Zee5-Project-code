#! /bin/bash
gsutil cp gs://gcs-xx77-dev-solr-artifacts/solr-as1-playback/solr.in.sh /etc/default/solr.in.sh
service solr start
# Give time for Solr to startup
sleep 10
mkdir -p /var/solr/install_collections
cd /var/solr/install_collections
gsutil cp -R gs://gcs-xx77-dev-solr-artifacts/configset/* .
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"xx77_collections-configset.zip" "http://localhost:8983/api/cluster/configs/xx77_collections"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"xx77_main_collection_v2-configset.zip" "http://localhost:8983/api/cluster/configs/xx77_main_collection_v2"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"xx77_main_collection-configset.zip" "http://localhost:8983/api/cluster/configs/xx77_main_collection"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"xx77_seo-configset.zip" "http://localhost:8983/api/cluster/configs/xx77_seo"
chmod +x createSolrCollections.sh
./createSolrCollections.sh ${data.google_compute_address.intip_xx77_dev_primary_as1_solr_playback_tlog["vm-xx77-dev-primary-as1-solr-playback-tlog01"].address} xx77_collections
./createSolrCollections.sh ${data.google_compute_address.intip_xx77_dev_primary_as1_solr_playback_tlog["vm-xx77-dev-primary-as1-solr-playback-tlog02"].address} xx77_main_collection_v2
./createSolrCollections.sh ${data.google_compute_address.intip_xx77_dev_primary_as1_solr_playback_tlog["vm-xx77-dev-primary-as1-solr-playback-tlog03"].address} xx77_main_collection
./createSolrCollections.sh ${data.google_compute_address.intip_xx77_dev_primary_as1_solr_playback_tlog["vm-xx77-dev-primary-as1-solr-playback-tlog01"].address} xx77_seo