fakes3
======

[![Build Status](https://travis-ci.org/ndench/ansible-role-fakes3.svg?branch=master)](https://travis-ci.org/ndench/ansible-role-fakes3)

Ansible role to install [fakes3](https://github.com/jubos/fake-s3) as a Systemd service.
Also installs s3cmd and creates a bucket.

Requirements
------------

* Systemd

Role Variables
--------------

All variables are listed below, along with their default values in [defaults/main.yml](defaults/main.yml):

```yaml
fakes3_bucket: s3_dev # for some reason if the bucket name doesn't have an underscore, s3cmd will fail
fakes3_root: /mnt/fakes3_root
```

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: dev
      roles:
         - { role: ndench.fakes3 }

License
-------

MIT

Author Information
------------------

This role was created in 2017 by [Nathan Dench](https://www.linkedin.com/in/nathandench/).

TODO
----

* use the s3_bucket ansible module instead of s3cmd
