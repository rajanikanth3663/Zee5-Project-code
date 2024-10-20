#! /bin/bash
gsutil cp gs://gcs-ott007-dev-solr-artifacts/solr-as1-playback/solr.in.sh /etc/default/solr.in.sh
service solr start
# Give time for Solr to startup
sleep 10
mkdir -p /var/solr/install_collections
cd /var/solr/install_collections
gsutil cp -R gs://gcs-ott007-dev-solr-artifacts/configset/* .
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"ott007_collections-configset.zip" "http://localhost:8983/api/cluster/configs/ott007_collections"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"ott007_main_collection_v2-configset.zip" "http://localhost:8983/api/cluster/configs/ott007_main_collection_v2"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"ott007_main_collection-configset.zip" "http://localhost:8983/api/cluster/configs/ott007_main_collection"
curl -X PUT --header "Content-Type:application/octet-stream" --data-binary @"ott007_seo-configset.zip" "http://localhost:8983/api/cluster/configs/ott007_seo"
chmod +x createSolrCollections.sh
./createSolrCollections.sh ${data.google_compute_address.intip_ott007_dev_primary_as1_solr_playback_tlog["vm-ott007-dev-primary-as1-solr-playback-tlog01"].address} ott007_collections
./createSolrCollections.sh ${data.google_compute_address.intip_ott007_dev_primary_as1_solr_playback_tlog["vm-ott007-dev-primary-as1-solr-playback-tlog02"].address} ott007_main_collection_v2
./createSolrCollections.sh ${data.google_compute_address.intip_ott007_dev_primary_as1_solr_playback_tlog["vm-ott007-dev-primary-as1-solr-playback-tlog03"].address} ott007_main_collection
./createSolrCollections.sh ${data.google_compute_address.intip_ott007_dev_primary_as1_solr_playback_tlog["vm-ott007-dev-primary-as1-solr-playback-tlog01"].address} ott007_seo