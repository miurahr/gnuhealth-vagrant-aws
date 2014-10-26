GNU Health install recipe
=============================


This repository shares recipe to install GNU Health into
your AWS virtual machine.

Requirement
-------------

* AWS account


Pre-requisite
-----------


You need to prepare following settings on AWS.

* select your region and setup in Vagrantfile
* create VPC and setup subnet id in Vagrantfile
* create security group on your VPC and edit Vagrantfile
* select Ubuntu 14.10 64bit hvm AMI id for your region
* copy credential.rb.template to credential.rb and edit for your 
  credentials


RUN
----------------

You can run 

```
vagrant up --provider=aws
```

installation may be failed because gnuhealth
ask users about several parameters.

connect
----------

1.Create ssh config


```
 vagrant ssh-config > vagrant.ssh.config
```

2. edit ssh config

add it to forwarding X to local

```
ForwardX11 yes
```

3. connect server

```
ssh -F vagrant.ssh.config default
```

4. start client

```
gnuhealth
```

You will see tryton client on your screen.

