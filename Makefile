test:
	tox

.ONESHELL:
setup_build:
	python3 -m pip install --upgrade poetry
	poetry self add "poetry-dynamic-versioning[plugin]"  

.PHONY: build
build: setup_build
	rm -rf dist/* && poetry build && ./rename-wheel.sh

install: setup_build
	poetry install

frontend_build:
	yarn webui:install && yarn webui:build

release: build
	twine upload dist/*

build_docs:
	sphinx-build -b html docs/ docs/_build/

changelog:
	@echo "Not supported any more. Run ./generate_changelog.py <version_number> instead!"
