# Ansible ndench.fakes3 role

[![Build Status](https://img.shields.io/travis/ndench/ansible-role-fakes3.svg)](https://travis-ci.org/ndench/ansible-role-fakes3)
[![Galaxy](http://img.shields.io/badge/galaxy-ndench.fakes3-role-blue.svg)](https://galaxy.ansible.com/ndench/fakes3)
[![GitHub Tags](https://img.shields.io/github/tag/ndench/ansible-role-fakes3.svg)](https://github.com/ndench/ansible-role-fakes3)
[![GitHub Stars](https://img.shields.io/github/stars/ndench/ansible-role-fakes3.svg)](https://github.com/ndench/ansible-role-fakes3)

> `ndench.fakes3` is an [Ansible](http://www.ansible.com) role which:
>
> * installs [fakes3](https://github.com/jubos/fake-s3)
> * configures fakes3 systemd service
> * (option) creates fakes3 bucket
> * allows development against the S3 API

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install ndench.fakes3
```

Using `requirements.yml`:

```yaml
- src: ndench.fakes3
```

Using `git`:

```shell
$ git clone https://github.com/ndench/ansible-role-fakes3.git ndench.fakes3
```

## Dependencies

* Ansible >= 2.4
* {"role"=>"geerlingguy.ruby", "become"=>true}
* geerlingguy.ruby
* python packages
    * boto3
    * botocore

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---
fakes3_gem: fakes3
fakes3_service_enabled: yes
fakes3_service_state: started
fakes3_root: /mnt/fakes3_root

# Whether to create a bucket
fakes3_create_bucket: false
# NOTE: For some reaon s3cmd only works when bucket name has an underscore
fakes3_bucket_name: s3_dev


```

## Handlers

These are the handlers that are defined in `handlers/main.yml`.

```yaml
---
- name: restart fakes3
  service:
    name: "{{ fakes3_service_name }}"
    state: restarted
  when: fakes3_service_state != 'stopped'

```


## Usage

This is an example playbook:

```yaml
---
- hosts: all
  vars:
    fakes3_root: "{{ ansible_env.HOME }}/fakes3"
    fakes3_create_bucket: true
  pre_tasks:
    - name: install pip dependencies
      pip:
        name: "{{ item }}"
      with_items:
        - boto3
        - botocore
  roles:
    - ndench.fakes3

```

# TODO

* get docker build working (vagrant works fine)
  * issue is to do with docker not being able to run systemd or upstart

## Testing

```shell
$ git clone https://github.com/ndench/ansible-role-fakes3.git
$ cd ansible-role-fakes3
$ make test
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c)  under the MIT license.
