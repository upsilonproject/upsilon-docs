default: antora

antora:
	npx antora antora-playbook.yml --log-level warn
	cp -r static/* build/site/ 2>/dev/null || true

.PHONY: default antora
