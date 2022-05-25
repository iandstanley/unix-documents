default:	troff-users-manual.pdf troff-users-manual.txt me-ref.pdf me-ref.txt using-me.txt using-me.pdf

troff-users-manual.pdf: troff-users-manual.ms
	groff -Tpdf -ms troff-users-manual.ms > troff-users-manual.pdf

troff-users-manual.txt: troff-users-manual.ms
	nroff -c -ms troff-users-manual.ms > troff-users-manual.txt

using-me.pdf: using-me.me
	groff -Tpdf -me using-me.me > using-me.pdf

using-me.txt: using-me.me
	nroff -c -me using-me.me > using-me.txt

me-ref.pdf: me-ref.me
	groff -Tpdf -me me-ref.me > me-ref.pdf

me-ref.txt: me-ref.me
	nroff -c -me me-ref.me > me-ref.txt

