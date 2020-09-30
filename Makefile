PWD=$(shell pwd)
ROLE_NAME=ndench.fakes3
ROLE_PATH=/etc/ansible/roles/$(ROLE_NAME)
TEST_VERSION=ansible --version
TEST_DEPS=ansible-galaxy install geerlingguy.ruby
TEST_SYNTAX=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml --syntax-check
TEST_PLAYBOOK=ansible-playbook -vv -i 'localhost,' -c local $(ROLE_PATH)/tests/main.yml
TEST_CMD=$(TEST_VERSION) && $(TEST_DEPS) && $(TEST_SYNTAX) && $(TEST_PLAYBOOK)

.PHONY: test
test:
	docker run -it --rm -e "ROLE_NAME=$(ROLE_NAME)" -v $(PWD):$(ROLE_PATH) williamyeh/ansible:ubuntu16.04 /bin/bash -c "$(TEST_CMD)"
