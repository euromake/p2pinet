CTX = (w: w M w) (x: x x)

all:
	npm install
	node generate.js "$(CTX)" 1 6 >terms.txt
	node line.js abstract 150 <terms.txt >output.tsv
	node compute.js abstract 150 "$(CTX)" 1 6 >abstract.tsv
	awk -f stats.awk abstract.tsv

clean:
	-rm -fr node_modules
	-rm -f abstract.tsv terms.txt output.tsv
