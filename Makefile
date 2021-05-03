.PHONY: setup
setup:
	ansible-playbook -i hosts playbooks/setup.yml --ask-become

.PHONY: env
env:
	@if [ ! -f env.yml ]; then \
        cp env.yml.dist env.yml; \
        printf "File env.yml created.\n"; \
    fi

.PHONY: requirements
requirements:
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy role install -r requirements.yml
