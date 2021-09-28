BRANCH := $(shell printenv BRANCH || git rev-parse --abbrev-ref HEAD)
HASH := $(shell printenv HASH || git rev-parse HEAD)
IMAGE_TAG := $(shell printenv IMAGE_TAG || echo $(BRANCH) | sed -e 's/\//\-/g' | awk '{print tolower($$0)}')

build:
	docker build --pull -t heymoon/wialon-retranslator:$(IMAGE_TAG) . \
		--label "git.hash=$(HASH)" \
		--label "git.branch=$(BRANCH)"

push: build
	docker push heymoon/wialon-retranslator:$(IMAGE_TAG)

run: build
	docker run -p20163:20163 heymoon/wialon-retranslator:$(IMAGE_TAG)
