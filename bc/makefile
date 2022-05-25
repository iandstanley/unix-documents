
default: bc.pdf bc.txt

bc.pdf: bc.ms
	groff -Tpdf -ms bc.ms > bc.pdf

bc.txt: bc.ms
	nroff -c -ms bc.ms > bc.txt
