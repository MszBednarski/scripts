#!/bin/bash
echo "Available drives."
lsblk
echo "Going to partition the disk."
# THIS DOESNT WORK AS A SCRIPT RN
# TODO NEXT TIME TRY TO DO IT WITHOUT PARTED
if [ -z ${TARGET+x} ]; then echo "SET TARGET ENV VAR FIRST"; exit; fi
sudo parted -a optimal $TARGET
mklabel gpt
mkpart primary 0% 100%
quit
lsblk
echo "Making a filesystem ext4 on partition."
sudo mkfs.ext4 "${TARGET}p1"
echo "${TARGET}p1 /home/ubuntu/ssd0 ext4 defaults 0 0" | sudo tee -a /etc/fstab
cat /etc/fstab