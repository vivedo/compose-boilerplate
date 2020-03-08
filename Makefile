PROJECT_NAME=DockerStd

COMPOSE=docker-compose --project-name=$(PROJECT_NAME) -f docker/docker-compose.yml
DEVCOMPOSE=$(COMPOSE) -f docker/docker-compose.dev.yml
PRODCOMPOSE=$(COMPOSE) -f docker/docker-compose.prod.yml

.PHONY: info
info:
	@clear
	@echo "\e[32m        _               _       ";
	@echo "       (_)             | |      ";
	@echo " __   _____   _____  __| | ___  ";
	@echo " \ \ / / \ \ / / _ \/ _\` |/ _ \ ";
	@echo "  \ V /| |\ V /  __/ (_| | (_) |";
	@echo "   \_/ |_| \_/ \___|\__,_|\___/ ";
	@echo "                                \e[39m";
	@echo " Running \e[31m\e[1m$(PROJECT_NAME)\e[0m Makefile...";
	@echo "";
	@echo "";
	@echo " \e[31mDEVCOMPOSE CMD:\e[0m $(DEVCOMPOSE)";
	@echo " \e[31mPRODCOMPOSE CMD:\e[0m $(PRODCOMPOSE)";
	@echo "--------------------------------";

.PHONY: gitremote
gitremote:
ifdef $(url)
	git remote set-url origin $(url)
else
	@echo "Error: remote url not specified."
	@echo "Usage:"
	@echo "       make gitremote url=<repo-url>"
	@echo ""
endif

###############
# PRODCOMPOSE #
###############

.PHONY: produp
produp: info
	$(PRODCOMPOSE) up

.PHONY: produpd
produpd: info
	$(PRODCOMPOSE) up -d

.PHONY: proddown
proddown: info
	$(PRODCOMPOSE) down

.PHONY: prodbuild
prodbuild: info
	$(PRODCOMPOSE) build

##############
# DEVCOMPOSE #
##############

.PHONY: devup
devup: info
	$(DEVCOMPOSE) up

.PHONY: devupd
devupd: info
	$(DEVCOMPOSE) up -d

.PHONY: devdown
devdown: info
	$(DEVCOMPOSE) down

.PHONY: devbuild
devbuild: info
	$(DEVCOMPOSE) build

#############
#   EXECs   #
#############

#.PHONY: exampleexec
#exampleexec:
#	docker exec -it <container-name> <cmd>
