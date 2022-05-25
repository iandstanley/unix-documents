
default: csh.pdf csh.txt

csh.pdf: csh.ms
	groff -Tpdf -ms csh.ms > csh.pdf

csh.txt: csh.ms
	nroff -c -ms csh.ms > csh.txt
