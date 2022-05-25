
default: dc.pdf dc.txt

dc.pdf: dc.ms
	groff -Tpdf -ms dc.ms > dc.pdf

dc.txt: dc.ms
	nroff -c -ms dc.ms > dc.txt
