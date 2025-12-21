default: antora

antora:
	npx antora antora-playbook.yml --log-level warn
	cp CNAME build/site/
	cp -r static/* build/site/ 2>/dev/null || true

.PHONY: default antora
