#!/usr/bin/env bash

echo "Starting provisioning"

# Stop if we install ready
test -d /opt/rubystack-2.2.3-2 &&
{ echo "rubystack already installed. Provisioning completed."; exit 0; }


apt-get -y install build-essential


# REM this section if you had an installer ready in root folder.
echo "Downloading rubystack installer"
wget https://bitnami.com/redirect/to/74445/bitnami-rubystack-2.2.3-2-dev-linux-x64-installer.run \
                    -O /vagrant/bitnami-rubystack-2.2.3-2-dev-linux-x64-installer.run
# wget http://192.168.1.121/bitnami-rubystack-2.2.3-2-dev-linux-x64-installer.run \
#                     -O /vagrant/bitnami-rubystack-2.2.3-2-dev-linux-x64-installer.run


echo "Running rubystack installer. It can take many minutes to install."
/vagrant/bitnami-rubystack-2.2.3-2-dev-linux-x64-installer.run \
                    --unattendedmodeui none --mode unattended --launchbch 0 \
                    --postgres_password 123456 \
                    --mysql_password 123456 \
                    --base_password 123456


echo "Setup startup script"
touch /etc/init.d/rubystack
echo "/opt/rubystack-2.2.3-2/ctlscript.sh start" > /etc/init.d/rubystack
chmod ugo+x /etc/init.d/rubystack
update-rc.d -f rubystack defaults
update-rc.d -f rubystack enable


echo "Setup path environment"
echo ". /opt/rubystack-2.2.3-2/scripts/setenv.sh" >> /etc/bash.bashrc


echo "Provisioning completed."
