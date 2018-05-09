#!/bin/sh

check_and_install curl
check_and_install unzip
check_and_install git
check_and_install wget

wget -o terraform.zip 'https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip'
unzip -o terraform.zip
sudo mv terraform /usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform

curl -o bosh 'https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64'
sudo mv bosh /usr/local/bin/bosh
sudo chmod +x /usr/local/bin/bosh

wget -o bbl 'https://github.com/cloudfoundry/bosh-bootloader/releases/download/v6.6.7/bbl-v6.6.7_linux_x86-64'
sudo mv bbl /usr/local/bin/bbl
sudo chmod +x /usr/local/bin/bbl
