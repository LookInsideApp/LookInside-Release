SHELL := /bin/bash
.SHELLFLAGS := -o pipefail -c

.PHONY: publish test

publish:
	./Scripts/build_and_publish.py

test:
	./Scripts/test-sign-and-notarize-app.sh
	./Scripts/test-auth-server-release-workflow.sh
	./Scripts/test-sdk-release-workflow.sh
	python3 ./Scripts/test-build-and-publish.py
