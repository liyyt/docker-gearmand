ACCOUNT ?= liyyt
REPOSITORY ?= gearmand
VERSION ?= latest

all:
	-docker build --pull --tag $(ACCOUNT)/$(REPOSITORY):$(VERSION) .

clean:
	-@docker rmi $(ACCOUNT)/$(REPOSITORY):$(VERSION)

distclean:
	-@grep -Eo "^FROM\s([a-z0-9\/\:_-]+)" Dockerfile | grep -Eo "([a-z0-9\/\:_-]+)" | xargs -I % sh -c 'docker rmi %;'
	-@docker rmi $(ACCOUNT)/$(REPOSITORY):$(VERSION)
