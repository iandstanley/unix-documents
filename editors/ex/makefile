
default: ex-tut.pdf ex-tut.txt ex-ref.pdf ex-ref.txt

ex-tut.pdf: ex-tut.ms
	groff -Tpdf -ms -t ex-tut.ms > ex-tut.pdf

ex-tut.txt: ex-tut.ms
	nroff -c -ms -t ex-tut.ms > ex-tut.txt

ex-ref.pdf: ex-ref.ms
	groff -Tpdf -ms -t ex-ref.ms > ex-ref.pdf

ex-ref.txt: ex-ref.ms
	nroff -c -ms -t ex-ref.ms > ex-ref.txt
