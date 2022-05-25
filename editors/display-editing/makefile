
default: display-editing.pdf display-editing.txt

display-editing.pdf: display-editing.ms
	groff -Tpdf -ms -t display-editing.ms > display-editing.pdf

display-editing.txt: display-editing.ms
	nroff -c -ms -t display-editing.ms > display-editing.txt
