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
