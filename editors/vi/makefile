
default: vi-joy.pdf vi-joy.txt

vi-joy.pdf: vi-joy.ms
	groff -Tpdf -ms -t vi-joy.ms > vi-joy.pdf

vi-joy.txt: vi-joy.ms
	nroff -c -ms -t vi-joy.ms > vi-joy.txt
