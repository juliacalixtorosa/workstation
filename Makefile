# ==========================================================
# Workstation
# ==========================================================

.DEFAULT_GOAL := help

BOOTSTRAP := ./bootstrap

help:
	@echo ""
	@echo "Available commands"
	@echo ""
	@echo "  make install          Install workstation"
	@echo "  make status           Show symbolic links status"
	@echo "  make check            Validate shell scripts"
	@echo "  make backup FILE=...  Backup a file"
	@echo "  make clean            Remove temporary files"
	@echo ""

install:
	@$(BOOTSTRAP)/install.sh

status:
	@$(BOOTSTRAP)/status.sh

backup:
ifndef FILE
	$(error Usage: make backup FILE=/path/to/file)
endif
	@$(BOOTSTRAP)/backup.sh "$(FILE)"

check:
	@echo "Checking shell syntax..."
	@bash -n bootstrap/*.sh
	@echo "✔ All scripts are valid."

clean:
	@find . -name "*.swp" -delete
	@find . -name "*~" -delete
	@echo "✔ Temporary files removed."