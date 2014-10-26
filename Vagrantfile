# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrantfile for staging of State of the Map Japan 2014 website
#

require_relative "credential"
include Credential

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# apt-fast 
$aptprepare = <<APTPREPARE
apt-get update
apt-get install -qq python-software-properties
apt-get install -qq git aria2
cd /tmp
git clone https://github.com/ilikenwf/apt-fast.git
cp apt-fast/apt-fast /usr/bin/
chmod +x /usr/bin/apt-fast
chown root.root /usr/bin/apt-fast
cp apt-fast/apt-fast.conf /etc/
cp apt-fast/completions/bash/apt-fast /etc/bash_completion.d/
chown root.root /etc/bash_completion.d/apt-fast
APTPREPARE

$dependency = <<DEPENDENCY
apt-fast update
apt-fast install -y devscripts 
apt-fast install -y postgresql
apt-fast install -y gnuhealth
DEPENDENCY

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dummy"

  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/"

  config.vm.provider :aws do |aws, override|
    # private credentials
    aws.access_key_id = Access_key_id
    aws.secret_access_key = Secret_access_key
    aws.keypair_name = SSH_Key_pair_name
    override.ssh.private_key_path = SSH_Private_key_path

    # EC2 configuration
    aws.instance_type = "t2.micro"
    aws.region = "us-west-2"
    aws.availability_zone= "us-west-2b"
    #aws.vpc_id = "vpc-edc21588"
    aws.security_groups = "sg-f387e796"
    aws.subnet_id = "subnet-7005c407"
    aws.associate_public_ip = true
    aws.tags = {'Name' => 'gnuhealth-website'}

    aws.ami = "ami-eb4608db"
    override.ssh.username = "ubuntu"
  end

  config.vm.provision "shell", inline: $aptprepare, privileged: true
  config.vm.provision "shell", inline: $dependency, privileged: true

end
