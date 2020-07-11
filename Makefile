help: ## Help File
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build-base: ## To create and push base image for application
	docker build . -f Dockerfile.base -t registry.gitlab.com/avneeshroks/musical-cms:base
	docker push registry.gitlab.com/avneeshroks/musical-cms:base

build-app:
	docker build . -t registry.gitlab.com/avneeshroks/musical-cms
	docker push registry.gitlab.com/avneeshroks/musical-cms

run:
	docker run --rm -p 1337:1337 musical-cms

deploy:
	kubectl apply -f deployment.yaml

run-latest:
	docker pull registry.gitlab.com/avneeshroks/musical-cms
	docker run --rm -p 1337:1337 registry.gitlab.com/avneeshroks/musical-cms