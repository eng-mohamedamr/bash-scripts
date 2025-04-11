#!/bin/sh

# to insure that the gzip is installed
sudo apt install gzip -y
path="/var/log"
dir="/var/log/backup"
#check if the dir exists
if [ -d $dir ]; then
    echo "The Dir $dir Exists."
else
    sudo mkdir $dir
    echo "The Dir has been created Succesfully"
fi
compress(){
for i in $(sudo find "$path" -type f -name "*.log" -mtime +7 );do 
    gzip "$i"
    mv "$i".gz $dir
    echo "mission compeleted"
done
}
compress
