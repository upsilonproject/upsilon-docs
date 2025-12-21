default: graphviz-diagrams sync-images antora

graphviz-diagrams:
	mkdir -p images/diagrams/
	mkdir -p modules/ROOT/images/diagrams/
	dot -Tpng graphviz-diagrams/drone-custodian-web-architecture.gv -o images/diagrams/drone-custodian-web-architecture.png -Nfontname=helvetica -Nlabelloc=b -Nlabeldistance=200 -Efontname=helvetica -Elabelfontsize=5
	cp images/diagrams/drone-custodian-web-architecture.png modules/ROOT/images/diagrams/

sync-images:
	@# Ensure all images from root images/ directory are synced to modules/ROOT/images/
	@if [ -d images ]; then \
		mkdir -p modules/ROOT/images; \
		rsync -a images/ modules/ROOT/images/ 2>/dev/null || cp -r images/* modules/ROOT/images/ 2>/dev/null || true; \
	fi

antora:
	npx antora antora-playbook.yml --log-level warn
	cp CNAME build/site/
	cp -r static/* build/site/ 2>/dev/null || true

.PHONY: default graphviz-diagrams sync-images antora
