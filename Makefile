default: install

link-files:
	@for path in $(shell find ./pi -type f); do \
      ln -vs $$(pwd)/$${path#*./} $${path#*/pi}; \
    done

install-prereqs:
	@apt update && apt install -y net-tools python3 python3-pip
	@pip3 install ansible

install-systemd:
	systemctl daemon-reload

install: link-files install-systemd
