# Introduction

Example project to introduce vagrant with ansible provisioner and docker containers

## Pre-requisites

Python 3 and Ruby 2.5 installed and added to the PATH environment variable

Install the following additional packages:

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)

## Provisioning

```bash
git clone <repo url>
cd vagrant-ansible-docker
ansible-galaxy install -r requirements.yml
vagrant up
```

Visit http://192.168.56.10

## Testing

```bash
sudo gem install bundle
bundle
rake spec
```
