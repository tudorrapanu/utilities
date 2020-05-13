echo 'Installing apps...'
sudo apt install network-manager-openvpn-gnome
sudo apt install freetds-bin
sudo apt install freetds-dev
sudo apt install python-setuptools
sudo apt install python-egenix-mxdatetime
sudo apt install git
sudo apt install nginx
sudo apt install nodejs
sudo apt install nodejs-legacy
sudo apt install npm
sudo apt install unixodbc
sudo apt install unixodbc-dev
sudo apt install tdsodbc
sudo apt install python-pip
sudo apt install google-cloud-sdk
sudo apt install kubectl
sudo apt install apt-transport-https
sudo apt install ca-certificates
sudo apt install aufs-tools
sudo apt install cgroup-lite
sudo apt install openjdk-8-jre
sudo dpkg -i packs/dbvis_linux_9_5_8.deb
sudo dpkg -i packs/gopenvpn_0.8-ds-1_amd64.deb
sudo mkdir /opt/DbVisualizer/jdbc/sybase
sudo cp packs/jconn3.jar /opt/DbVisualizer/jdbc/sybase/
sudo cp packs/dbvis.license /home/user1/.dbvis/
sudo cp packs/dbvis.xml /home/user1/.dbvis/config70/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
sudo apt install build-essential
sudo apt install glusterfs-client
sudo apt install cgroup-lite
sudo apt install libnss3
sudo apt install sysv-rc-conf
sudo apt install python-software-properties
sudo apt install python3-uno
sudo apt install hipchat4
sudo apt install python-psutil

echo 'Copying config files...'


sudo cp conf_files/remote-to-gce /etc/NetworkManager/system-connections/
sudo cp conf_files/ca.crt /etc/NetworkManager/system-connections/
sudo cp conf_files/freetds.conf /etc/freetds/
sudo cp conf_files/odbc.ini /etc/odbc.ini
sudo cp conf_files/odbcinst.ini /etc/
sudo rm /etc/hosts
sudo cp conf_files/hosts /etc/
sudo cp conf_files/remote-to-gce.conf /etc/openvpn/
sudo cp conf_files/remote-to-gce-dev.conf /etc/openvpn/
sudo cp conf_files/two_vpn /etc/NetworkManager/dispatcher.d/
sudo cp conf_files/remote-to-gce.conf /home/user1/
sudo cp conf_files/remote-to-gce.up /home/user1/
sudo cp packs/gsettings.sh /home/user1/
sudo mkdir /etc/resolvconf/resolv.conf.d/
sudo cp packs/head /etc/resolvconf/resolv.conf.d/
sudo cp conf_files/sshd_config /etc/ssh/

# echo 'Copying ssh keys...'
# sudo mkdir /home/autossh
# sudo mkdir /home/autossh/.ssh

# sudo cp ssh_keys/id_rsa /home/autossh/.ssh
# sudo cp ssh_keys/id_rsa.pub /home/autossh/.ssh
# sudo cp ssh_keys/known_hosts /home/autossh/.ssh

echo 'Installing python modules...'
pip install -r python_reqs.txt


# cd .ssh/
# ssh-keygen
