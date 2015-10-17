## raspberrypi-fluentd-ansible
Configuring basic Linux settings and 
installing [fluentd](http://www.fluentd.org/) using [Ansible](http://www.ansible.com/) 
and testing using [Serverspec](http://serverspec.org/) to Raspberry Pi.

### Prepare

1. Install Rasbian OS to your Raspberry Pi.
1. Configure public key authentication.
1. Clone this repository. 
1. Rename `raspberry_pi.sample` to `raspberry_pi` and edit ssh host and port, user.
1. Install `ansible` / `serverspec` by below command.

```shell
$ pip install -r requirements.txt
$ bundle install
```

### Execute

Execute below commands on your PC.

```shell
$ ansible-playbook -i raspberry_pi site.yml
$ bundle exec rake serverspec:fluentd
```
