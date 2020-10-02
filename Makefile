default: graphviz-diagrams
	asciidoctor -a stylesheet=style.css README.adoc

graphviz-diagrams:
	mkdir -p images/diagrams/
	dot -Tpng graphviz-diagrams/drone-custodian-web-architecture.gv -o images/diagrams/drone-custodian-web-architecture.png -Nfontname=helvetica -Nlabelloc=b -Nlabeldistance=200 -Efontname=helvetica -Elabelfontsize=5

.PHONY: default graphviz-diagrams
