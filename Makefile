default: install

link-files:
	@for path in $(shell find ./pi -type f); do \
      ln -vs $$(pwd)/$${path#*./} $${path#*/pi}; \
    done

clean-links:
	for path in $(shell find ./pi -type f); do rm $${path#*/pi}; done

install-prereqs:
	@apt update && apt install -y net-tools python3 python3-pip
	@pip3 install ansible

install-systemd:
	systemctl daemon-reload

DEVICE ?= wlan0
SCAN_BLK ?= $(shell ifconfig | grep ${DEVICE} -A1 | tail -n1 \
            | awk '{print ($$NF)}' | sed 's/\.[0-9]*$$/.*/')
hosts:
	nmap -sn ${SCAN_BLK} | grep -v Host | sort

install: link-files install-systemd
