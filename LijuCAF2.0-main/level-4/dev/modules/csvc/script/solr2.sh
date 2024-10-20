#! /bin/bash
log_disk=${each.value.log_disk}
log_disk_mount_path=/var/solr/logs
log_disk_owner=solr
data_disk=${each.value.data_disk}
data_disk_mount_path=/var/solr/data
data_disk_owner=solr
if [ $(ls -1 /dev/disk/by-id|grep -ic google-$data_disk) -eq 1 ]
then
disk_uuid=$(blkid /dev/disk/by-id/google-$data_disk|grep UUID|awk '{print $2}'|awk -F'"' '{print $2}')
if [ $(grep -ic $disk_uuid /etc/fstab) -eq 0 ]
then
mkdir -p $data_disk_mount_path
echo "UUID=$disk_uuid $data_disk_mount_path ext4 discard,defaults 0 0" >> /etc/fstab
fi
fi
if [ $(ls -1 /dev/disk/by-id|grep -ic google-$log_disk) -eq 1 ]
then
disk_uuid=$(blkid /dev/disk/by-id/google-$log_disk|grep UUID|awk '{print $2}'|awk -F'"' '{print $2}')
if [ $(grep -ic $disk_uuid /etc/fstab) -eq 0 ]
then
log
mkdir -p $log_disk_mount_path
echo "UUID=$disk_uuid $log_disk_mount_path ext4 discard,defaults 0 0" >> /etc/fstab
fi
fi
mount -a
chown -R $data_disk_owner:$data_disk_owner $data_disk_mount_path
chmod -R 755 $data_disk_mount_path
chown -R $log_disk_owner:$log_disk_owner $log_disk_mount_path
chmod -R 755 $log_disk_mount_path
gsutil cp gs://gcs-ott007-dev-solr-artifacts/solr-as1-playback/solr.in.sh /etc/default/solr.in.sh
service solr start