## raspberrypi-fluentd-ansible

This script make below to your Raspberry Pi.

- Configure basic Linux settings ([Ansible](http://www.ansible.com/)).
- Install [fluentd](http://www.fluentd.org/) ([Ansible](http://www.ansible.com/)).
- Test ([Serverspec](http://serverspec.org/)).

### Prepare

1. Install RASPBIAN(JESSIE) to your Raspberry Pi.
1. Configure public key authentication.
1. Clone this repository. 
1. Rename `raspberry_pi.sample` to `raspberry_pi` and edit ssh host, port and user. If you need Mackerel, edit `mackerel_api_key`.
1. Install `ansible` / `serverspec` by below command.

```shell
$ pip install ansible
$ bundle install
```

### Execute

Execute below commands on your PC.

```shell
$ ansible-playbook -i raspberry_pi site.yml
$ bundle exec rake serverspec:iot
```
