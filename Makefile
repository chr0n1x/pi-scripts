default: install

install-scripts:
	@for script in $(shell ls scripts); do   \
      scriptFile="$(shell pwd)/systemd/$$script"; \
      scriptPath="/lib/systemd/system/$$script"; \
      ln -vs $$scriptFile $$scriptPath || \
      echo "Failed to link $$scriptPath"; \
    done

install-systemd:
	@for unit in $(shell ls systemd); do   \
      unitFile="$(shell pwd)/systemd/$$unit"; \
      systemdPath="/lib/systemd/system/$$unit"; \
      ln -vs $$unitFile $$systemdPath || \
      echo "Failed to link $$systemdPath"; \
    done
	systemctl daemon-reload

install: install-scripts install-systemd
