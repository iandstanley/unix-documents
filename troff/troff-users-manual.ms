.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m.mac	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.if \n(mo=1 .ds mo January
.if \n(mo=2 .ds mo February
.if \n(mo=3 .ds mo March
.if \n(mo=4 .ds mo April
.if \n(mo=5 .ds mo May
.if \n(mo=6 .ds mo June
.if \n(mo=7 .ds mo July
.if \n(mo=8 .ds mo August
.if \n(mo=9 .ds mo September
.if \n(mo=10 .ds mo October
.if \n(mo=11 .ds mo November
.if \n(mo=12 .ds mo December
.if \n(dw=1 .ds dw Sunday
.if \n(dw=2 .ds dw Monday
.if \n(dw=3 .ds dw Tuesday
.if \n(dw=4 .ds dw Wednesday
.if \n(dw=5 .ds dw Thursday
.if \n(dw=6 .ds dw Friday
.if \n(dw=7 .ds dw Saturday
.\"
.bd S B 3
.ds NR "\s-1NROFF\s+1
.ds TR "\s-1TROFF\s+1
.ds Nr "N\s-2ROFF\s+2
.ds Tr "T\s-2ROFF\s+2
.nr PS 10
.hy 14
.ds u \v'-0.3m'\s-2
.ds d \s0\v'0.3m'
.nr 2C 0
.ds H
.nr a .8i
.nr b 1.6i
.nr c 2.4i
.nr d 2.9i
.nr e 0.25i
.nr p 0 1
.nr s 0 1
.af p 1
.af s 1
.nr m -1i
.nr x 0 1
.nr y 0+\nmu
.ev 1
.ps \n(PS-2
.vs \n(PS
.ll 6.5i
'in 0
.ev
.tr &.
.de xx
.sp 0.4
..
.de ht
.tl `\*(Nr/\*(Tr User's Manual``USD:21-%`
.\" .tl 'updated to May 15, 1977'''\".tl 'Version \n(mo/\n(dy/\n(yr'''
..
.de he
.tl `USD:21-%``\*(Nr/\*(Tr User's Manual`
.\" .tl 'updated to May 15, 1977'''\".tl 'Version \n(mo/\n(dy/\n(yr'''
..
.de hd
.\".tl '\(rn'''
.if \\n%>1 \{'sp |.30i
.if e .he
.if o .ht
.ps \\n(S2
.ps \\n(S1
.ft
'sp |.9i\}
.nr x 0 1
.nr y 0+\\nmu
.ch fo \\nmu
.if \\n(dn .fz
.ns
.if dmx .mx
.nr cl 0 1
.mk
..
.de fz
.fn
.nf
.fy
.fi
.ef
..
.de fx
.if \\nx .di fy
..
.de fo
.if dcx .cx
.nr dn 0
.if \\nx .xf
.nr x 0 \"disable fx
.ie \\n(2C&(\\n+(cl<2) \{\
.po +3.4i
.rt
.nr y 0+\\nmu
.ch fo \\nmu
.if \\n(dn .fz
.ns \}
.el \{\
.po 26i/27u
.nr S1 \\n(.s
.ps
.nr S2 \\n(.s
.ps 10
'bp
.\}
..
.de 2C
.br
.mk
.nr 2C 1
.ll 3.1i
.ev 1
.ll 3.1i
.ev
..
.de 1C
.br
.nr 2C 0
.ll 6.5i
.ev 1
.ll 6.5i
.ev
..
.de co
.de cx
.br
\fI(Continued next page.)\fP
.br
.rm cx
\\..
..
.de pp
'ps \\n(PS
.ft R
.\"'tl ''- % -''
'bp
..
.wh 0 hd
.wh 12i fo
.wh \nmu fx
.ch fo \nmu
.de fn
.da FN
.ev 1
.if \\n+x=1 .fs
.fi
.ti 0
..
.de xf
.ev 1
.nf
.FN
.rm FN
.di
.ev
..
.de fs
.ti 0
\l'1i'
.br
..
.de ef
.br
.ev
.di
.nr y -\\n(dn
.if \\nx=1 .nr y -2p
.ch fo \\nyu
.if \\n(nl+\\n(.v-\\n(.p-\\ny .ch fo \\n(nlu+\\n(.vu
..
.wh -.6i pp
.de h1
.xx
.ne 5
.nf
.ta \\nau \\nbu \\ncu \\ndu +\\neu
.ft I
.bd I 3
Request	Initial	If No
Form	Value\\$2	Argument	Notes\\$1	Explanation
.bd I
.ft R
.ft
.fi
.in \\ndu
..
.de bt
.ft R
.xx
.ne 1.1
.ti 0
..
.de b1
.br
.ti 0
..
.de pg
.ft R
.fi
.in 0
.xx
.ne 1.1
..
.de sc
.pg
\fI\\*H\\np.\\n+s.\|\\c
.ft R
.ul
..
.de mh
.nr s 0
.in 0
.xx
.ne 2.5
.ft B
\\*H\\n+p.
..
.de x1
.xx
.in .5i
.nf
..
.de x2
.xx
.in 0
.fi
..
.de EM
.br
\&\c
.pl 2i
..
.em EM
.de TS
.sp
..
.de TE
.sp
.ce 0
.ft R
.ps \n(PS
.ta \\nau \\nbu \\ncu \\ndu +\\neu
..
.de T&
..
.\" Hey, Emacs, edit this file in -*- nroff-fill -*- mode!
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m0	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.br
.rs
.sp |1.0i
.ce 1000
.ps 12
.ft B
\*(Nr\(sl\*(Tr User's Manual
.sp .2i
.ft I
.ps 10
Joseph F. Ossanna
(updated for 4.3BSD by Mark Seiden)
.ft R
.sp
Bell Laboratories
Murray Hill, New Jersey 07974
.ce 0
.sp 2
.ps \n(PS
.fi
.ft B
.ps +1
NOTE: This document in its current form describes the \fItroff\fP\| program
supplied with 4.4BSD.  The \fIgroff\fP\| program supplied with FreeBSD has a
number of additional features and a couple of small incompatibilities.  See
\fIgroff(1)\fP\| for more details.
.ps
.sp 1
Introduction
.pg
\*(NR and \*(TR are text processors under
the \s-1UNIX\s+1 Time-Sharing System
that format text for typewriter-like terminals and
for a \%Graphic Systems phototypesetter, respectively.
(Device-independent \*(TR, part of the Documenter's Workbench,
supports additional output devices.)
They accept lines of text interspersed with lines of
format control information and
format the text into a printable, paginated document
having a user-designed style.
\*(NR and \*(TR offer
unusual freedom in document styling,
including:
arbitrary style headers and footers;
arbitrary style footnotes;
multiple automatic sequence numbering for paragraphs, sections, etc;
multiple column output;
dynamic font and point-size control;
arbitrary horizontal and vertical local motions at any point;
and
a family of automatic overstriking, bracket construction, and
line drawing functions.
.pg
\*(NR and \*(TR are highly compatible with each other and it is almost always
possible to prepare input acceptable to both.
Conditional input is provided that enables
the user to embed input expressly destined for either program.
\*(NR can prepare output directly for a variety of terminal types and
is capable of utilizing the full resolution of each terminal.
.pg
.ft B
Usage
.pg
The general form of invoking \*(NR (or \*(TR) at \s-1UNIX\s+1 command level is
.x1
\fBnroff  \fIoptions  files\fR\
\h'|2i'(or  \fBtroff  \fIoptions  files\fR)
.x2
where \fIoptions\fR represents any of a number of option arguments
and \fIfiles\fR represents the list of files containing the document
to be formatted.
An argument consisting of a single minus (\fB\-\fR) is taken to be
a file name corresponding to the standard input.
If no file names are given input is taken from the standard input.
The options, which may appear in any order so long as they appear
before the files, are:
.sp
.ta .2i 1.0i
.ft I
.bd I 3
	Option	Effect
.br
.bd I
.ft R
.ta .3i 1.0i
.in 1.0i
.ll -.3i
.bt
	\fB\-i\fP	Read standard input after the input files are exhausted.
.bt
	\fB\-m\fIname\fR	Prepends the macro file
\fB\(slusr\(sllib\(sltmac.\fIname\fR
to the input \fIfiles\fR.
.bt
	\fB\-n\fIN\fR	Number first generated page \fIN\fR.
.bt
	\fB\-o\fIlist\fR	\
Print only pages whose page numbers appear in \fIlist\fR,
which consists of comma-separated numbers and number ranges.
A number range has the form \fIN\-M\fR
and means pages \fIN\fR through \fIM;\fR
a initial \fI\-N\fR means
from the beginning to page \fIN;\fR and a final \fIN\-\fR means
from \fIN\fR to the end.
.bt
	\fB\-q\fR	\
Invoke the simultaneous input-output mode of the \fBrd\fR request.
.bt
	\fB\-r\fIaN\fR	Number register \fIa\fR (one-character) is set to \fIN\fR.
.bt
	\fB\-s\fIN\fR	Stop every \fIN\fR pages.
\*(NR will halt prior to every \fIN\fR pages (default \fIN\fR=1)
to allow paper loading or
changing, and will resume upon receipt of a newline.
\*(TR will stop the phototypesetter every \fIN\fR pages,
produce a trailer to allow changing cassettes,
and will resume after the phototypesetter \s-1START\s+1 button is pressed.
.bt
	\fB\-z\fR	Efficiently suppress formatted output.
Only produce output to standard error (from \fBtm\fP requests or
diagnostics).
.sp
.ne 5
.ft I
.bd I 3
		\*(NR Only
.br
.bd I
.ft
.bt
	\fB\-T\fIname\fR	Specifies
the name of the output terminal type.
Currently defined names are \fB37\fR for the (default) Model 37 Teletype\(rg,
\fBtn300\fR for the GE TermiNet\ 300 (or any terminal without half-line
capabilities),
\fB300S\fR for the \s-1DASI\s+1-300S,
\fB300\fR for the \s-1DASI\s+1-300,
and
\fB450\fR for the \s-1DASI\s+1-450 (Diablo Hyterm).
.bt
	\fB\-e\fR	\
Produce equally-spaced words in adjusted
lines, using full terminal resolution.
.bt
	\fB\-h\fR	\
On output, use tabs during horizontal spacing to increase speed.
Device tabs setting are assumed to be (and input tabs are initially 
set to) every 8 character widths.
.sp
.ne 3
.ft I
.bd I 3
		\*(TR Only
.br
.bd I
.ft
.bt
	\fB\-a\fP	Send a printable \s-1(ASCII)\s+1 approximation
of the results to the standard output.
.bt
	\fB\-b\fR	\*(TR will report whether the phototypesetter
is busy or available.
No text processing is done.
.bt
	\fB\-f\fP	Refrain from feeding out paper and stopping
phototypesetter at the end of the run.
.bt
	\fB\-t\fP	Direct output to the standard output instead
of the phototypesetter.
.bt
	\fB\-w\fP	Wait until phototypesetter is available, if
currently busy.
.ll
.in 0
.xx
.pg
Each option is invoked as a separate argument;
for example,
.x1
\fBnroff  \-o\fI4,8\-10  \fB\-T\fI300S  \fB\-m\fIabc  file1  file2\fR
.x2
requests formatting of pages 4, 8, 9, and 10 of a document contained in the files
named \fIfile1\fR and \fIfile2\fR,
specifies the output terminal as a \s-1DASI\s+1-300S,
and invokes the macro package \fIabc\fR.
.pg
Various pre- and post-processors are available for use with \*(NR and \*(TR.
These include the equation preprocessors \s-1NEQN\s+1 and \s-1EQN\s+1\*u1\*d
(for \*(NR and \*(TR respectively),
and the table-construction preprocessor \s-1TBL\s+1\*u2\*d.
A reverse-line postprocessor \s-1COL\s+1\*u3\*d
is available for multiple-column \*(NR output on terminals without reverse-line ability;
\s-1COL\s+1 expects the Model 37 Teletype
escape sequences that \*(NR produces by default.
\s-1TK\s+1\*u3\*d
is a 37 Teletype simulator postprocessor for printing \*(NR output on a Tektronix 4014.
\s-1TC\s+1\*u5\*d
is a phototypesetter-simulator postprocessor
for \*(TR that produces an approximation of phototypesetter output
on a Tektronix 4014.
For example, in
.x1
\fBtbl  \fIfiles  \fB|  eqn  |  troff  \-t \fIoptions  \fB|  tc\fR
.x2
the first \|\fB|\fR\| indicates the piping of \s-1TBL\s+1's output to \s-1EQN\s+1's input;
the second the piping of \s-1EQN\s+1's output to \*(TR's input;
and the third indicates the piping of \*(TR's output to \s-1TC\s+1.
.br
.pg
The remainder of this manual consists of:
a Summary and outline;
a Reference Manual keyed to the outline;
and
a set of Tutorial Examples.
Another tutorial is [5].
.sp .4
.ps -1
.vs -1p
.pg
.ft B
References
.pg
.ta .3i
.in .3i
.ti 0
[1]	B. W. Kernighan, L. L. Cherry,
.ul
Typesetting Mathematics \(em User's Guide (Second Edition),
Bell Laboratories.
.sp .4
.ti 0
[2]	M. E. Lesk,
.ul
Tbl \(em A Program to Format Tables,
Bell Laboratories internal memorandum.
.sp .4
.ti 0
[3]	Internal on-line documentation (\fIman\fP pages) on \s-1UNIX\s+1.
.sp .4
.ti 0
[4]	B. W. Kernighan, \fIA TROFF Tutorial\fR,
Bell Laboratories.
.sp .4
.ti 0
[5]	Your site may have similar programs for more modern displays.
.in 0
.ps 10
.vs 12
.ft R
.bp
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\" 
.\"	@(#)m0a	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.br
.tr |
.ce
.ft B
SUMMARY OF REQUESTS AND OUTLINE OF THIS MANUAL
.ft R
.de mx
.ev 2
.nf
.h1
.in
.sp
.fi
.ev
.ns
..
.xx
.h1 \s-1#\s+1 *
.fn
.sp .3
*Values separated by "\fB;\fR" are for \*(NR and \*(TR respectively.
.sp .2
\s-1#\s+1Notes are explained at the end of this Summary and Index
.ef
.mh
General Explanation
.mh
Font and Character Size Control
.bt
\fB&ps\fI\|\(+-N\fR	10\|point	previous	E	Point size; also \fB\es\fI\(+-N\fR.\(dg
.b1
\fB&fz\fI|F|\(+-N\fR	off	-	E	font \fIF\fR to point size \fI\(+-N\fR.
.b1
\fB&fz|S|\fIF|\(+-N\fR	off	-	E	Special Font characters to point size \fI\(+-N\fR.
.b1
\fB&ss\fI|N\fR	12\(sl36\|em	ignored	E	Space-character size
set to \fIN\fR\(sl36\|em.\(dg
.b1
\fB&cs\fI|F\|N\|M\fR	off	-	P	Constant character
space (width)
mode (font \fIF\^\fR\^).\(dg
.b1
\fB&bd\fI|F|N\fR	off	-	P	Embolden font \fIF\fR by \fIN\fR\(mi1 units.\(dg
.b1
\fB&bd|S|\fIF|N\fR	off	-	P	Embolden Special Font when current font is \fIF\fR.\(dg
.fn
.sp .2
\(dgNo effect in \*(NR.
.ef
.b1
\fB&ft\fI|F\fR	Roman	previous	E	Change to font
\fIF\fR|= \fIx\fR, \fIxx\fR, or 1-4.
Also \fB\ef\fIx\fR,\|\fB\ef(\fIxx\fR,\|\fB\ef\fIN\fR.
.b1
\fB&fp\fI|N|F\fR	R,I,B,S	ignored	-	Font named \fIF\fR mounted on physical position 1\(<=\fIN\fR\(<=4.
.mh
Page Control
.bt
\fB&pl\fI|\(+-N\fR	11\|in	11\|in	\fBv\fR	Page length.
.b1
\fB&bp|\fI\(+-N\fR	\fIN\(eq\fR1	-	B\(dd,\fBv\fR	\
Eject current page; next page number \fIN\fR.
.fn
.sp .2
\(ddThe use of "\ \fB\'\fR\ " as control character (instead of "\fB.\fR")
suppresses the break function.
.ef
.b1
\fB&pn\fI|\(+-N	N\(eq\fR1	ignored	-	Next page number \fIN\fR.
.b1
\fB&po\fI|\(+-N\fR	0;|26\(sl27\|in	previous	\fBv\fR	Page offset.
.b1
\fB&ne\fI|N\fR	-	\fIN\(eq\fR1\fIV\fR	D,\fBv\fR	Need \fIN\fR vertical space (\fIV\fR = vertical spacing).
.b1
\fB&mk|\fIR\fR	none	internal	D	Mark current vertical place in register \fIR\fR.
.b1
\fB&rt\fI|\(+-N\fR	none	internal	D,\fBv\fR	Return \fI(upward only)\fR to marked vertical place.
.mh
Text Filling, Adjusting, and Centering
.bt
\fB&br\fR	-	-	B	Break.
.b1
.lg 0
\fB&fi\fR	\(fill	-	B,E	Fill output lines.
.lg
.b1
\fB&nf\fR	fill	-	B,E	No filling or adjusting of output lines.
.b1
\fB&ad\fI|c\fR	adj,both	adjust	E	Adjust output lines with mode \fIc\fR.
.b1
\fB&na\fR	adjust	-	E	No output line adjusting.
.b1
\fB&ce\fI|N\fR	off	\fIN\(eq\fR1	B,E	Center following \fIN\fR input text lines.
.mh
Vertical Spacing
.bt
\fB&vs\fI|N\fR	1\(sl6in;12pts	previous	E,\fBp\fR	Vertical base line spacing (\fIV\fR\^).
.b1
\fB&ls\fI|N	N\(eq\fR1	previous	E	Output \fIN\(mi\fR1 \fIV\^\fRs after each text output line.
.b1
\fB&sp\fI|N\fR	-	\fIN\(eq\fR1\fIV\fR	B,\fBv\fR	Space \
vertical distance \fIN\fR \fIin either direction\fR.
.b1
\fB&sv\fI|N\fR	-	\fIN\(eq\fR1\fIV\fR	\fBv\fR	Save vertical distance \fIN\fR.
.b1
\fB&os\fR	-	-	-	Output saved vertical distance.
.b1
\fB&ns\fR	space	-	D	Turn no-space mode on.
.b1
\fB&rs\fR	-	-	D	Restore spacing; turn no-space mode off.
.mh
Line Length and Indenting
.bt
\fB&ll\fI|\(+-N\fR	6.5\|in	previous	E,\fBm\fR	Line length.
.b1
\fB&in\fI|\(+-N\fR	\fIN\(eq\fR\^0	previous	B,E,\fBm\fR	Indent.
.b1
\fB&ti\fI|\(+-N\fR	-	ignored	B,E,\fBm\fR	Temporary indent.
.mh
Macros, Strings, Diversion, and Position Traps
.bt
\fB&de\fI|xx|yy\fR	-	\fI.yy=\fB..\fR	-	Define or redefine macro \fIxx;\fR end at call of \fIyy\fR.
.b1
\fB&am\fI|xx|yy\fR	-	\fI.yy=\fB..\fR	-	Append to a macro.
.b1
\fB&ds\fI|xx|string\fR	-	ignored	-	Define a string \fIxx\fR containing \fIstring\fR.
.b1
\fB&as\fI|xx|string\fR	-	ignored	-	Append \fIstring\fR to string \fIxx\fR.
.b1
\fB&rm\fI|xx\fR	-	ignored	-	Remove request, macro, or string.
.b1
\fB&rn\fI|xx|yy\fR	-	ignored	-	Rename request, macro, or string \fIxx\fR to \fIyy\fR.
.b1
\fB&di\fI|xx\fR	-	end	D	Divert output to macro \fIxx\fR.
.b1
\fB&da\fI|xx\fR	-	end	D	Divert and append to \fIxx\fR.
.b1
\fB&wh\fI|N|xx\fR	-	-	\fBv\fR	Set location trap; negative is w.r.t. page bottom.
.b1
\fB&ch\fI|xx|N\fR	-	-	\fBv\fR	Change trap location.
.b1
\fB&dt\fI|N|xx\fR	-	off	D,\fBv\fR	Set a diversion trap.
.b1
\fB&it\fI|N|xx\fR	-	off	E	Set an input-line count trap.
.b1
\fB&em\fI|xx\fR	none	none	-	End macro is \fIxx\fI.
.mh
Number Registers
.bt
\fB&nr\fI|R|\(+-N|M\fR	-	-	\fBu\fR	Define and set number register \fIR\fR; auto-increment by \fIM\fR.
.b1
\fB&af\fI|R|c\fR	arabic	-	-	Assign format to register \fIR\fR (\fIc=\fB1\fR, \fBi\fR, \fBI\fR, \fBa\fR, \fBA\fR).
.b1
\fB&rr\fI|R\fR	-	-	-	Remove register \fIR\fR.
.mh
Tabs, Leaders, and Fields
.bt
\fB&ta\fI|Nt|...\fR	0.8;|0.5in	none	E,\fBm\fR	Tab settings; \fIleft\fR type, unless \fIt=\fBR\fR(right), \fBC\fR(centered).
.b1
\fB&tc\fI|c\fR	none	none	E	Tab repetition character.
.b1
\fB&lc\fI|c\fR	\fB.\fR	none	E	Leader repetition character.
.b1
\fB&fc\fI|a|b\fR	off	off	-	Set field delimiter \fIa\fR and pad character \fIb\fR.
.mh
Input and Output Conventions and Character Translations
.bt
\fB&ec\fI|c\fR	\e	\e	-	Set escape character.
.b1
\fB&eo\fR	on	-	-	Turn off escape character mechanism.
.b1
\fB&lg\fI|N\fR	-;\|on	on	-	Ligature mode
on if \fIN\fR>0.
.b1
\fB&ul\fI|N\fR	off	\fIN\(eq\fR1	E	Underline (italicize in \*(TR) \fIN\fR input lines.
.b1
\fB&cu\fI|N\fR	off	\fIN\(eq\fR1	E	Continuous underline in \*(NR; like \fBul\fR in \*(TR.
.b1
\fB&uf\fI|F\fR	Italic	Italic	-	Underline font set to \fIF\fR (to be switched to by \fBul\fR).
.b1
\fB&cc\fI|c\fR	\fB.	.\fR	E	Set control character to \fIc\fR.
.b1
\fB&c2\fI|c\fR	\fB\'	\'\fR	E	Set nobreak control character to \fIc\fR.
.b1
\fB&tr\fI|abcd....\fR	none	-	O	Translate \fIa\fR to \fIb\fR, etc. on output.
.mh
Local Horizontal and Vertical Motions, and the Width Function
.mh
Overstrike, Bracket, Line-drawing, and Zero-width Functions
.mh
Hyphenation.
.bt
\fB&nh\fR	hyphenate	-	E	No hyphenation.
.b1
\fB&hy\fI|N\fR	hyphenate	hyphenate	E	Hyphenate; \fIN =\fR mode.
.b1
\fB&hc\fI|c\fR	\fB\e%	\e%\fR	E	Hyphenation indicator character \fIc\fR.
.b1
\fB&hw\fI|word1|...\fR		ignored	-	Exception words.
.mh
Three Part Titles.
.bt
\fB&tl\fI|\'left\|\'center\|\'right\|\'\fR	-	-	Three part title.
.b1
\fB&pc\fI|c\fR	\fB%\fR	off	-	Page number character.
.b1
\fB&lt\fI|\(+-N\fR	6.5\|in	previous	E,\fBm\fR	Length of title.
.mh
Output Line Numbering.
.bt
\fB&nm\fI|\(+-N|M|S|I\fR	off	E	Number mode on or off, set parameters.
.b1
\fB&nn\fI|N\fR	-	\fIN\(eq\fR1	E	Do not number next \fIN\fR lines.
.mh
Conditional Acceptance of Input
.bt
\fB&if\fI|c|anything\fR	-	-	If condition \fIc\fR true, accept \fIanything\fR as input,
.b1
				for multi-line use \fI\e{anything\|\e}\fR.
.b1
\fB&if|!\fIc|anything\fR	-	-	If condition \fIc\fR false, accept \fIanything\fR.
.b1
\fB&if\fI|N|anything\fR	-	\fBu\fR	If expression \fIN\fR > 0, accept \fIanything\fR.
.b1
\fB&if|!\fIN|anything\fR	-	\fBu\fR	If expression \fIN\fR \(<= 0, accept \fIanything\fR.
.b1
\fB&if\fI|\|\'string1\|\'string2\|\'|anything\fR	-	If \fIstring1\fR identical to \fIstring2\fR,
accept \fIanything\fR.
.b1
\fB&if|!\fI\|\'string1\|\'string2\|\'|anything\fR	-	If \fIstring1\fR not identical to \fIstring2\fR,
accept \fIanything\fR.
.b1
\fB&ie\fI|c|anything\fR	-	\fBu\fR	If portion of if-else; all above forms (like \fBif\fR).
.b1
\fB&el\fI|anything\fR		-	-	Else portion of if-else.
.mh
Environment Switching.
.bt
\fB&ev\fI|N\fR	\fIN\(eq\fR0	previous	-	Environment switched (\fIpush down\fR).
.mh
Insertions from the Standard Input
.bt
\fB&rd\fI|prompt\fR\fR	-	\fIprompt=\s-1\fRBEL\s+1	Read insertion.
.b1
\fB&ex\fR	-	-	-	\
Exit from \*(NR\(sl\*(TR.
.mh
Input\(slOutput File Switching
.bt
\fB&so\fI|filename\fR		-	-	Switch source file \fI(push down)\fR.
.b1
\fB&nx\fI|filename\fR		end-of-file	-	Next file.
.b1
\fB&pi\fI|program\fR		-	-	Pipe output to \fIprogram\fR (\*(NR only).
.mh
Miscellaneous
.bt
\fB&mc\fI|c|N\fR	-	off	E,\fBm\fR	Set margin character \fIc\fR and separation \fIN\fR.
.b1
\fB&tm\fI|string\fR	-	newline	-	Print \fIstring\fR on terminal \
(\s-1UNIX\s+1 standard error output).
.b1
\fB&ig\fI|yy\fR	-	\fI.yy=\fB..\fR	-	Ignore till call of \fIyy\fR.
.b1
\fB&pm\fI|t\fR	-	all	-	Print macro names and sizes;
.b1
				if \fIt\fR present, print only total of sizes.
.b1
\fB&ab\fI|string\fR	-	-	-	Print a message and abort.
.b1
.lg 0
\fB&fl\fR	-	-	B	Flush output buffer.
.lg
.mh
Output and Error Messages
.xx
.nf
.rm mx
.ft R
\l'\n(.lu'
.ft B
.xx
.ta .3iC .6i
	Notes-
.xx
.ft R
	B	Request normally causes a break.
	D	Mode or relevant parameters associated with current diversion level.
	E	Relevant parameters are a part of the current environment.
	O	Must stay in effect until logical output.
	P	Mode must be still or again in effect at the time of physical output.
	\fBv\fR,\fBp\fR,\fBm\fR,\fBu\fR	Default scale indicator; if not specified, scale indicators are \fIignored\fR.
.br
.nr zz 11
.de cl
.ie \\n+(cl<\n(zz \{\
.	po +\\n(.lu/\n(zzu
.	rt
.\}
.el \{\
.po 26i/27u
.\}
..
.nr cl 0 1
.di zz
.ta .3iR
.nf
.ps 8
.vs 10
ab	20
ad	4
af	8
am	7
as	7
bd	2
bp	3
br	4
c2	10
cc	10
ce	4
ch	7
cs	2
cu	10
da	7
de	7
di	7
ds	7
dt	7
ec	10
el	16
em	7
eo	10
ev	17
ex	18
fc	9
fi	4
fl	20
fp	2
ft	2
fz	2
hc	13
hw	13
hy	13
ie	16
if	16
ig	20
in	6
it	7
lc	9
lg	10
li	10
ll	6
ls	5
lt	14
mc	20
mk	3
na	4
ne	3
nf	4
nh	13
nm	15
nn	15
nr	8
ns	5
nx	19
os	5
pc	14
pi	19
pl	3
pm	20
pn	3
po	3
ps	2
rd	18
rm	7
rn	7
rr	8
rs	5
rt	3
so	19
sp	5
ss	2
sv	5
ta	9
tc	9
ti	6
tl	14
tm	20
tr	10
uf	10
ul	10
vs	5
wh	7
.di
.nr aa \n(dn/\n(zz
.ne \n(aau+10p
.sp
.ft B
Alphabetical Request and Section Number Cross Reference
.ft
.sp .3
.wh \n(nlu+\n(aau cl
.nr qq \n(nlu+\n(aau
.ps
.vs
.mk
.zz
.rt
.sp \n(.tu
.ch cl 12i
.sp
.bp
.nf
.ft B
Escape Sequences for Characters, Indicators, and Functions
.ft R
.xx
.TS
c2l
c2l2l
n2l2l.
.ft I
.bd I 3
Section	Escape
Reference	Sequence	Meaning
.ft R
.bd I
.xx
10.1	\fB\e\e\fR	\e (to prevent or delay the interpretation of \e\|)
10.1	\fB\ee\fR	Printable version of the \fIcurrent\fR escape character.
2.1	\fB\e\'\fR	\' (acute accent); equivalent to \fB\e(aa\fR
2.1	\fB\e\`\fR	\` (grave accent); equivalent to \fB\e(ga\fR
2.1	\fB\e\-\fR	\- Minus sign in the \fIcurrent\fR font
7	\fB\e\^.\fR	Period (dot) (see \fBde\fR)
11.1	\fB\e\fR(space)	Unpaddable space-size space character
11.1	\fB\e0\fR	Digit width space
.tr ||
11.1	\fB\e\||\fR	1\(sl6\|em narrow space character (zero width in \*(NR)
.tr |
11.1	\fB\e^\fR	1\(sl12\|em half-narrow space character (zero width in \*(NR)
.tr &&
4.1	\fB\e&\fR	Non-printing, zero width character
.tr &.
10.6	\fB\e!\fR	Transparent line indicator
10.7	\fB\e"\fR	Beginning of comment
7.3	\fB\e$\fIN\fR	Interpolate argument 1\(<=\fIN\fR\(<=9
13	\fB\e%\fR	Default optional hyphenation character
2.1	\fB\e(\fIxx\fR	Character named \fIxx\fR
7.1	\fB\e\(**\fIx\fR,|\fB\e\(**(\fIxx\fR	Interpolate string \fIx\fR or \fIxx\fR
9.1	\fB\ea\fR	Non-interpreted leader character
12.3	\fB\eb\fI\'abc...\|\'\fR	Bracket building function
4.2	\fB\ec\fR	Interrupt text processing
11.1	\fB\ed\fR	Forward (down) 1\(sl2\|em vertical motion (1\(sl2 line in \*(NR)
2.2	\fB\ef\fIx\fR,\fB\ef(\fIxx\fR,\fB\ef\fIN\fR	Change to font named \fIx\fR or \fIxx\fR, or position \fIN\fR
11.1	\fB\eh\fI\'N|\'\fR	Local horizontal motion; move right \fIN\fR \fI(negative left)\fR
11.3	\fB\ek\fIx\fR	Mark horizontal \fIinput\fR place in register \fIx\fR
12.4	\fB\el\fI\|\'Nc\|\'\fR	Horizontal line drawing function (optionally with \fIc\fR\|)
12.4	\fB\eL\fI\'Nc\|\'\fR	Vertical line drawing function (optionally with \fIc\fR\|)
8	\fB\en\fIx\fR,\fB\en(\fIxx\fR	Interpolate number register \fIx\fR or \fIxx\fR
12.1	\fB\eo\fI\'abc...\|\'\fR	Overstrike characters \fIa, b, c, ...\fR
4.1	\fB\ep\fR	Break and spread output line
11.1	\fB\er\fR	Reverse 1\|em vertical motion (reverse line in \*(NR)
2.3	\fB\es\fIN\fR,\|\fB\es\fI\(+-N\fR	Point-size change function
9.1	\fB\et\fR	Non-interpreted horizontal tab
11.1	\fB\eu\fR	Reverse (up) 1\(sl2\|em vertical motion (1\(sl2 line in \*(NR)
11.1	\fB\ev\fI\'N\|\|\'\fR	Local vertical motion; move down \fIN\fR \fI(negative up)\fR
11.2	\fB\ew\fI\'string\|\'\fR	Interpolate width of \fIstring\fR
5.2	\fB\ex\fI\'N\|\|\'\fR	Extra line-space function \fI(negative before, positive after)\fR
12.2	\fB\ez\fIc\fR	Print \fIc\fR with zero width (without spacing)
16	\fB\e{\fR	Begin conditional input
16	\fB\e}\fR	End conditional input
10.7	\fB\e\fR(newline)	Concealed (ignored) newline
-	\fB\e\fIX\fR	\fIX\fR, any character \fInot\fR listed above
.TE
.fi
.sp
The escape sequences
\fB\e\e\fR,
\fB\e\^.\fR,
\fB\e"\fR,
\fB\e$\fR,
\fB\e\(**\fR,
\fB\ea\fR,
\fB\en\fR,
\fB\et\fR,
and
\fB\e\fR(newline) are interpreted in \fIcopy mode\fR (\(sc7.2).
.bp
.ft B
.nf
Predefined General Number Registers
.ft
.TS
c2l
c2l2l
n2l2l.
.ft I
.bd I 3
Section	Register
Reference	Name	Description
.ft R
.bd I
.xx
3	\fB%\fR	Current page number.
19	\fBc&\fR	Number of \fIlines\fR read from current input file.
11.2	\fBct\fR	Character type (set by \fIwidth\fR function).
7.4	\fBdl\fR	Width (maximum) of last completed diversion.
7.4	\fBdn\fR	Height (vertical size) of last completed diversion.
-	\fBdw\fR	Current day of the week (1-7).
-	\fBdy\fR	Current day of the month (1-31).
11.3	\fBhp\fR	Current horizontal place on \fIinput\fR line (not in ditroff)
15	\fBln\fR	Output line number.
-	\fBmo\fR	Current month (1-12).
4.1	\fBnl\fR	Vertical position of last printed text base-line.
11.2	\fBsb\fR	Depth of string below base line (generated by \fIwidth\fR function).
11.2	\fBst\fR	Height of string above base line (generated by \fIwidth\fR function).
-	\fByr\fR	Last two digits of current year.
.TE
.sp
.ft B
Predefined Read-Only Number Registers
.ft R
.TS
c2l
c2l2l
n2l2l.
.ft I
.bd I 3
Section	Register
Reference	Name	Description
.ft R
.bd I
.xx
7.3	\fB&$\fR	Number of arguments available at the current macro level.
-	\fB&A\fR	Set to 1 in \*(TR, if \fB\-a\fR option used; always 1 in \*(NR.
11.1	\fB&H\fR	Available horizontal resolution in basic units.
5.3	\fB&L\fR	Set to current \fIline-spacing\fR (\fBls\fR) parameter
-	\fB&P\fR	Set to 1 if the current page is being printed; otherwise 0.
-	\fB&T\fR	Set to 1 in \*(NR, if \fB\-T\fR option used; always 0 in \*(TR.
11.1	\fB&V\fR	Available vertical resolution in basic units.
5.2	\fB&a\fR	Post-line extra line-space most recently utilized \
using \fB\ex\fI\'N\|\'\fR.
19	\fB&c\fR	Number of \fIlines\fR read from current input file.
7.4	\fB&d\fR	Current vertical place in current diversion; equal to \fBnl\fR, if no diversion.
2.2	\fB&f\fR	Current font as physical quadrant (1-4).
4	\fB&h\fR	Text base-line high-water mark on current page or diversion.
6	\fB&i\fR	Current indent.
4.2	\fB&j\fR	Current adjustment mode and type.
4.1	\fB&k\fR	Length of text portion on current partial output line.
6	\fB&l\fR	Current line length.
4	\fB&n\fR	Length of text portion on previous output line.
3	\fB&o\fR	Current page offset.
3	\fB&p\fR	Current page length.
2.3	\fB&s\fR	Current point size.
7.5	\fB&t\fR	Distance to the next trap.
4.1	\fB&u\fR	Equal to 1 in fill mode and 0 in nofill mode.
5.1	\fB&v\fR	Current vertical line spacing.
11.2	\fB&w\fR	Width of previous character.
-	\fB&x\fR	Reserved version-dependent register.
-	\fB&y\fR	Reserved version-dependent register.
7.4	\fB&z\fR	Name of current diversion.
.TE
.in 0
.fi
.ps 10
.vs 12
.ft R
.bp
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\"
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\"
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\"
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\"
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\"
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m1	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.nr p 0 1
.tr |
.tr ~|
.rm mx
.br
.ce
.ft B
.ps +2
.rs
.\".sp1.0i
REFERENCE MANUAL
.ft R
.ps -2
.sp
.mh
General Explanation
.sc
Form of input.
Input consists of \fItext lines\fR, which are destined to be printed,
interspersed with \fIcontrol lines\fR,
which set parameters or otherwise control subsequent processing.
Control lines begin with a \fIcontrol character\fR\(em\
normally \fB.\fR (period) or \fB\'\fR (acute accent)\(em\
followed by a one or two character name that specifies
a basic \fIrequest\fR or the substitution of
a user-defined \fImacro\fR in place of the control line.
The control character \fB\'\fR suppresses the \fIbreak\fR function\(em\
the forced output of a partially filled line\(em\
caused by certain requests.
The control character may be separated from the request/macro name by
white space (spaces and/or tabs) for \(aesthetic reasons.
Names must be followed by either
space or newline.
Control lines with unrecognized names are ignored.
.pg
Various special functions may be introduced anywhere in the input by
means of an \fIescape\fR character, normally \fB\e\fR.
For example, the function
\fB\en\fIR\fR
causes the interpolation (insertion in place) of the contents of the
\fInumber register R\fR
in place of the function;
here \fIR\fR is either a single character name
as in \fB\en\fIx\fR,
or left-parenthesis-introduced, two-character name as in \fB\en(\fIxx\fR.
.sc
Formatter and device resolution.
\*(TR internally uses 432 units\(slinch, (for historical reasons, corresponding to
the Graphic Systems phototypesetter
which had a horizontal resolution of
1\(sl432 inch and a vertical resolution
of 1\(sl144 inch.)
\*(NR internally uses 240 units\(slinch,
corresponding to the least common multiple of the
horizontal and vertical resolutions of various
typewriter-like output devices.
\*(TR rounds horizontal\(slvertical numerical parameter input to its own
internal horizontal\(slvertical resolution.
\*(NR similarly rounds numerical input to the actual resolution
of the output device indicated by the \fB\(miT\fR option
(default Model 37 Teletype).
.sc
Numerical parameter input.
Both \*(NR and \*(TR
accept numerical input with the scale
indicator suffixes
shown in the following table,
where
\fIS\fR is the current type size in points,
\fIV\fR is the current vertical line spacing in
basic units,
and
\fIC\fR is a \fInominal character width\fR in basic units.
.TS
center box;
c|c|ls
c|c|ll
c|l|l|l.
Scale		Number of basic units
Indicator	Meaning	\*(TR	\*(NR
_
\fBi\fR	Inch	432	240
\fBc\fR	Centimeter	432\(mu50\(sl127	240\(mu50\(sl127
\fBP\fR	Pica = 1\(sl6 inch	72	240\(sl6
\fBm\fR	Em = \fIS\fR points	6\(mu\fIS\fR	\fIC\fR
\fBn\fR	En = Em\(sl2	3\(mu\fIS\fR	\fIC, same as Em\fR
\fBp\fR	Point = 1\(sl72 inch	6	240\(sl72
\fBu\fR	Basic unit	1	1
\fBv\fR	Vertical line space	\fIV\fR	\fIV\fR
none	Default, see below
.TE
In \*(NR, \fIboth\fR the em and the en are taken to be equal to the \fIC\fR,
which is output-device dependent;
common values are 1\(sl10 and 1\(sl12 inch.
Actual character widths in \*(NR need not be all the same and constructed characters
such as \(mi> (\(->) are often extra wide.
The default scaling is ems for the horizontally-oriented requests
and functions
\fBll\fR,
\fBin\fR,
\fBti\fR,
\fBta\fR,
\fBlt\fR,
\fBpo\fR,
\fBmc\fR,
\fB\eh\fR,
and
\fB\el\fR;
\fIV\^\fRs
for the vertically-oriented requests and functions
\fBpl\fR,
\fBwh\fR,
\fBch\fR,
\fBdt\fR,
\fBsp\fR,
\fBsv\fR,
\fBne\fR,
\fBrt\fR,
\fB\ev\fR,
\fB\ex\fR,
and
\fB\eL\fR;
\fBp\fR for the \fBvs\fR request;
and \fBu\fR for the requests
\fBnr\fR,
\fBif\fR,
and
\fBie\fR.
\fIAll\fR other requests ignore any scale indicators.
When a number register containing an already appropriately scaled number
is interpolated to provide numerical input,
the unit scale indicator
\fBu\fR may need to be appended to prevent
an additional inappropriate default scaling.
The number, \fIN\fR, may be specified in decimal-fraction form
but the parameter finally stored is rounded to an integer number of basic units.
.pg
The \fIabsolute position\fR indicator \fB~\fR may be prefixed
to a number \fIN\fR
to generate the distance to the vertical or horizontal place \fIN\fR.
For vertically-oriented requests and functions, \fB~\|\fIN\fR
becomes the distance in basic units from the current vertical place on the page or in a \fIdiversion\fR (\(sc7.4)
to the vertical place \fIN\fR.
For \fIall\fR other requests and functions,
\fB~\|\fIN\fR
becomes the distance from
the current horizontal place on the \fIinput\fR line to the horizontal place \fIN\fR.
For example,
.x1
\&\fB.sp  ~\|3.2c\fR
.x2
will space \fIin the required direction\fR to 3.2 centimeters from the top of the page.
.sc
.tr &&
Numerical expressions.
Wherever numerical input is expected, an expression involving parentheses,
the arithmetic operators \fB\(pl\fR, \fB\(mi\fR, \fB\(sl\fR, \fB\(**\fR, \fB%\fR (mod),
and the logical operators
\fB<\fR,
\fB>\fR,
\fB<\(eq\fR,
\fB>\(eq\fR,
\fB\(eq\fR (or \fB\(eq\(eq\fR),
\fB&\fR\ (and),
\fB:\fR\ (or)
may be used.
Except where controlled by parentheses, evaluation of expressions is left-to-right;
there is no operator precedence.
In the case of certain requests, an initial \fB\(pl\fR or \fB\(mi\fR is stripped
and interpreted as an increment or decrement indicator respectively.
In the presence of default scaling, the desired scale indicator must be
attached to \fIevery\fR number in an expression
for which the desired and default scaling differ.
For example,
if the number register \fBx\fR contains 2
and the current point size is 10,
then
.br
.tr &.
.x1
.ft B
\&.ll  (4.25i\(pl\enxP\(pl3)\(sl2u
.ft R
.x2
will set the line length to 1\(sl2 the sum of 4.25 inches \(pl 2 picas \(pl 30 points.
.sc
Notation.
Numerical parameters are indicated in this manual in two ways.
\(+-\fIN\fR means that the argument may take the forms \fIN\fR, \(pl\fIN\fR, or \(mi\fIN\fR and
that the corresponding effect is to set the affected parameter
to \fIN\fR, to increment it by \fIN\fR, or to decrement it by \fIN\fR respectively.
Plain \fIN\fR means that an initial algebraic sign is \fInot\fR
an increment indicator,
but merely the sign of \fIN\fR.
Generally, unreasonable numerical input is either ignored
or truncated to a reasonable value.
For example,
most requests expect to set parameters to non-negative
values;
exceptions are
\fBsp\fR,
\fBwh\fR,
\fBch\fR,
\fBnr\fR,
and
\fBif\fR.
The requests
\fBps\fR,
\fBft\fR,
\fBpo\fR,
\fBvs\fR,
\fBls\fR,
\fBll\fR,
\fBin\fR,
and
\fBlt\fR
restore the \fIprevious\fR parameter value in the \fIabsence\fR
of an argument.
.pg
Single character arguments are indicated by single lower case letters
and
one/two character arguments are indicated by a pair of lower case letters.
Character string arguments are indicated by multi-character mnemonics.
.mh
Font and Character Size Control
.sc
Character set.
The \*(TR character set consists of a typesetter-dependent basic
character set plus a Special Mathematical Font character
set\(emeach having 102 characters.
An example of these character sets is shown in the Appendix Table|I.
All printable \s-1ASCII\s+1 characters are included,
with some on the Special Font.
With three exceptions, these \s-1ASCII\s+1 characters are input as themselves,
and non-\s-1ASCII\s+1 characters are input in the form \fB\e(\fIxx\fR where
\fIxx\fR is a two-character name given in the Appendix Table|II.
The three \s-1ASCII\s+1 exceptions are mapped as follows:
.TS
center box;
cs|cs
cc|cc
cl|cl.
\s-1ASCII\s+1 Input	Printed by \*(TR
Character	Name	Character	Name
_
\'	acute accent	'	close quote
\`	grave accent	`	open quote
\(mi	minus	-	hyphen
.TE
.tr ~~
The characters
\fB\'\fR,
\fB\`\fR,
and
\fB\-\fR
may be input
by \fB\e\'\fR, \fB\e\`\fR, and \fB\e\-\fR respectively or by their names (Table II).
The \s-1ASCII\s+1 characters \fB@\fR, \fB#\fR, \fB"\fR, \fB\(aa\fR, \fB\(ga\fR, \fB<\fR, \fB>\fR, \fB\e\fR, \fB{\fR, \fB}\fR, \fB~\fR, \fB^\fR, and \fB\(ul\fR exist
only on the Special Font and are printed as a 1-em space if that font
is not mounted.
.pg
.tr ~|
\*(NR understands the entire \*(TR character set,
but can in general print only \s-1ASCII\s+1
characters,
additional characters as may be available on
the output device,
such characters as may be able to be constructed
by overstriking or other combination,
and those that can reasonably be mapped
into other printable characters.
The exact behavior is determined by a driving
table prepared for each device.
The characters
\fB\'\fR,
\fB\`\fR,
and
\fB\(ul\fR
print
as themselves.
.sc
Fonts.
The default mounted fonts are
Times Roman (\fBR\fR),
Times Italic (\fBI\fR),
Times Bold (\fBB\fR),
and the Special Mathematical Font (\fBS\fR)
on physical typesetter positions 1, 2, 3, and 4 respectively.
These fonts are used in this document.
The \fIcurrent\fR font, initially Roman, may be changed
(among the mounted fonts)
by use of the \fBft\fR request,
or by imbedding at any desired point
either \fB\ef\fIx\fR, \fB\ef(\fIxx\fR, or \fB\ef\fIN\fR
where
\fIx\fR and \fIxx\fR are the name of a mounted font
and \fIN\fR is a numerical font position.
It is \fInot\fR necessary to change to the Special Font;
characters on that font are automatically handled.
A request for a named but not-mounted font is \fIignored\fR.
\*(TR can be informed that any particular font is mounted
by use of the \fBfp\fR request.
The list of known fonts is installation dependent.
In the subsequent discussion of font-related requests,
\fIF\fR represents either a one\(sltwo-character
font name or the numerical font position, 1-4.
The current font is available (as numerical position) in the read-only number register \fB.f\fR.
.pg
\*(NR understands font control
and normally underlines Italic characters (see \(sc10.5).
.sc
Character size.
Character point sizes available are typesetter dependent, but often include
6, 7, 8, 9, 10, 11, 12, 14, 16, 18, 20, 22, 24, 28, and 36.
This is a range of 1\(sl12 inch to 1\(sl2 inch.
The \fBps\fR request is used to change or restore the point size.
Alternatively the point size may be changed between any two characters
by imbedding a \fB\es\fIN\fR
at the desired point
to set the size to \fIN\fR,
or a \fB\es\fI\(+-N\fR (1\(<=\fIN\fR\(<=9)
to increment\(sldecrement the size by \fIN\fR;
\fB\es0\fR restores the \fIprevious\fR size.
Requested point size values that are between two valid
sizes yield the larger of the two.
The current size is available in the \fB.s\fR register.
\*(NR ignores type size control.
.h1 *
.fn
.xx
*Notes are explained at the end of the Summary and Index above.
.ef
.bt
\fB&ps\fI|\(+-N\fR	10\|point	previous	E	Point size
set to \(+-\fIN\fR.
Alternatively imbed \fB\es\fIN\fR or \fB\es\fI\(+-N\fR.
Any positive size value may be requested;
if invalid, the next larger valid size will result, with a
maximum of 36.
A paired sequence
\(pl\fIN\fR,\|\(mi\fIN\fR
will work because the previous requested value is also remembered.
Ignored in \*(NR.
.bt
\fB&fz\fI|F|\(+-N\fR	off	-	E	The characters in font \fIF\fR will be adjusted to
be in size \(+-\fIN\fR.  Characters in the Special Font encountered during the
use of font \fIF\fR will have the same size modification. (Use the \fB&fz S\fR
request if different treatment of Special Font characters is required). \fB&fz\fR
must follow any \fB&fp\fR request for the position.
.bt
\fB&fz|S|\fIF|\(+-N\fR	off	-	E	The characters in the Special Font
will be in size \(+-\fIN\fR independent of previous \fB&fz\fR requests.
.bt
\fB&ss\fI|N\fR	12\(sl36\|em	ignored	E	Space-character size
is set to \fIN\fR\(sl36\|ems.
This size is the minimum word spacing in adjusted text.
Ignored in \*(NR.
.bt
\fB&cs|\fIF\|N\|M\fR	off	-	P	Constant character space
(width) mode is
set on for font \fIF\fR (if mounted); the width of every character will be
taken to be \fIN\fR\(sl36 ems.
If \fIM\fR is absent,
the em is that of the character's point size;
if \fIM\fR is given,
the em is \fIM\fR-points.
All affected characters
are centered in this space, including those with an actual width
larger than this space.
Special Font characters occurring while the current font
is \fIF\fR are also so treated.
If \fIN\fR is absent, the mode is turned off.
The mode must be still or again in effect when the characters are physically printed.
Ignored in \*(NR.
.bt
\fB&bd\fI|F|N\fR	off	-	P	The characters in font \fIF\fR will be artificially
emboldened by printing each one twice, separated by \fIN\fR\^\(mi1 basic units.
A reasonable value for \fIN\fR is 3 when the character size is in the vicinity
of 10 points.
If \fIN\fR is missing the embolden mode is turned off.
The column heads above were printed with \fB.bd|I|3\fR.
The mode must be still or again in effect when the characters are physically printed.
Ignored in \*(NR.
.bt
\fB&bd|S|\fIF|N\fR	off	-	P	The characters in the Special Font
will be emboldened whenever the current font is \fIF\fR.
This manual was printed with \fB.bd\|S\|B\|3\fR.
The mode must be still or again in effect when the characters are physically printed.
.bt
\fB&ft|\fIF\fR	Roman	previous	E	Font changed to
\fIF\fR.
Alternatively, imbed \fB\ef\fIF\fR.
The font name \fBP\fR is reserved to mean the previous font.
.bt
\fB&fp|\fIN|F\fR	R,I,B,S	ignored	-	Font position.
This is a statement
that a font named \fIF\fR is mounted on position \fIN\fR (1-4).
It is a fatal error if \fIF\fR is not known.
The phototypesetter has four fonts physically mounted.
Each font consists of a film strip which can be mounted on a numbered
quadrant of a wheel.
The default mounting sequence assumed by \*(TR is
R, I, B, and S on positions 1, 2, 3 and 4.
.mh
Page control
.pg
Top and bottom margins are \fInot\fR automatically provided;
it is conventional to define two \fImacros\fR and to set \fItraps\fR
for them at vertical positions 0 (top) and \fI\(miN\fR (\fIN\fR from the bottom).
See \(sc7 and Tutorial Examples \(scT2.
A pseudo-page transition onto the \fIfirst\fR page occurs
either when the first \fIbreak\fR occurs or
when the first \fInon-diverted\fR text processing occurs.
Arrangements
for a trap to occur at the top of the first page
must be completed before this transition.
In the following, references to the \fIcurrent diversion\fR (\(sc7.4)
mean that the mechanism being described works during both
ordinary and diverted output (the former considered as the top diversion level).
.pg
The usable page width on the Graphic Systems phototypesetter
was about 7.54|inches,
beginning about 1\(sl27|inch from the left edge of the
8|inch wide, continuous roll paper, but these characteristics are typesetter-
dependent.
The physical limitations on \*(NR output
are output-device dependent.
.h1
.bt
\fB&pl\fI|\(+-N\fR	11\|in	11\|in	\fBv\fR	Page length set to \fI\(+-N\fR.
The internal limitation is about 75|inches in \*(TR and
about 136|inches in \*(NR.
The current page length is available in the \fB.p\fR register.
.bt
\fB&bp\fI|\(+-N\fR	\fIN\(eq\fR1	-	B*,\fBv\fR	Begin page.
.fn
.xx
*The use of "\ \fB\'\fR\ " as control character (instead of "\fB.\fR")
suppresses the break function.
.ef
The current page is ejected and a new page is begun.
If \fI\(+-N\fR is given, the new page number will be \fI\(+-N\fR.
Also see request \fBns\fR.
.bt
\fB&pn\fI|\(+-N\fR	\fIN\fR\(eq1	ignored	-	Page number.
The next page (when it occurs) will have the page number \fI\(+-N\fR.
A \fBpn\fR must occur before the initial pseudo-page transition
to affect the page number of the first page.
The current page number is in the \fB%\fR register.
.bt
\fB&po\fI|\(+-N\fR	0;|26\(sl27\|in\(dg	previous	\fBv\fR	Page offset.
.fn
.xx
\(dgValues separated by ";" are for \*(NR and \*(TR respectively.
.ef
The current \fIleft margin\fR is set to \fI\(+-N\fR.
The \*(TR initial value provides about 1|inch of paper margin
including the physical typesetter margin of 1\(sl27|inch.
In \*(TR the maximum (line-length)+(page-offset) is about 7.54 inches.
See \(sc6.
The current page offset is available in the \fB.o\fR register.
.bt
\fB&ne\fI|N\fR	-	\fIN\(eq\fR1\|\fIV\fR	D,\fBv\fR	Need \fIN\fR vertical space.
If the distance, \fID\fR, to the next trap position (see \(sc7.5) is less than \fIN\fR,
a forward vertical space of size \fID\fR occurs,
which will spring the trap.
If there are no remaining
traps on the page,
\fID\fR is the distance to the bottom of the page.
If \fID\|<\|V\fR, another line could still be output
and spring the trap.
In a diversion, \fID\fR is the distance to the \fIdiversion trap\fR, if any,
or is very large.
.bt
\fB&mk\fI|R\fR	none	internal	D	Mark the \fIcurrent\fR vertical place
in an internal register (both associated with the current diversion level),
or in register \fIR\fR, if given.
See \fBrt\fR request.
.bt
\fB&rt\fI|\(+-N\fR	none	internal	D,\fBv\fR	Return \fIupward only\fR to a marked vertical place
in the current diversion.
If \fI\(+-N\fR (w.r.t. current place) is given,
the place is \fI\(+-N\fR from the top of the page or diversion
or, if \fIN\fR is absent, to a
place marked by a previous \fBmk\fR.
Note that the \fBsp\fR request (\(sc5.3) may be used
in all cases instead of \fBrt\fR
by spacing to the absolute place stored in an explicit register;
e.|g. using the sequence \fB.mk|\fIR\fR ... \fB.sp|~\|\en\fIR\fBu\fR.
.mh
Text Filling, Adjusting, and Centering
.sc
Filling and adjusting.
Normally,
words are collected from input text lines
and assembled into an output text line
until some word doesn't fit.
An attempt is then made
to hyphenate the word to assemble a part
of it into the output line.
The spaces between the words on the output line
are then increased to spread out the line
to the current \fIline length\fR
minus any current \fIindent\fR.
A \fIword\fR is any string of characters delimited by
the \fIspace\fR character or the beginning/end of the input line.
Any adjacent pair of words that must be kept together
(neither split across output lines nor spread apart
in the adjustment process)
can be tied together by separating them with the
\fIunpaddable space\fR character
"\fB\e\ \ \fR" (backslash-space).
The adjusted word spacings are uniform in \*(TR
and the minimum interword spacing can be controlled
with the \fBss\fR request (\(sc2).
In \*(NR, they are normally nonuniform because of
quantization to character-size spaces;
however,
the command line option \fB\-e\fR causes uniform
spacing with full output device resolution.
Filling, adjustment, and hyphenation (\(sc13) can all be
prevented or controlled.
The \fItext length\fR on the last line output is available in the \fB.n\fR register,
and text base-line position on the page for this line is in the \fBnl\fR register.
The text base-line high-water mark (lowest place) on the current page is in
the \fB.h\fR register. The \fB.k\fR register (read-only) contains the horizontal size of
the text portion (without indent) of the current partially-collected output
line (if any) in the current environment.
.pg
An input text line ending with \fB.\fR\^, \fB?\fR, or \fB!\fR is taken
to be the end of a \fIsentence\fR, and an additional space character is
automatically provided during filling.
Multiple inter-word space characters found in the input are retained,
except for trailing spaces;
initial spaces also cause a \fIbreak\fR.
.pg
When filling is in effect, a \fB\ep\fR may be imbedded or attached to a word to
cause a \fIbreak\fR at the \fIend\fR of the word and have the resulting output
line \fIspread out\fR to fill the current line length.
.pg
.tr &&
A text input line that happens to begin
with a control character (\(sc10.4) can
be made to not look like a control line
by preceding it by
the non-printing, zero-width filler character \fB\e&\fR.
Still another way is to specify output translation of some
convenient character into the control character
using \fBtr\fR (\(sc10.5).
.tr &.
.sc
Interrupted text.
The copying of an input line in \fInofill\fR
(non-fill) mode can be \fIinterrupted\fR by terminating
the partial line with a \fB\ec\fR.
The \fInext\fR encountered input text line will be considered to be a continuation
of the same line of input text.
Similarly,
a word within \fIfilled\fR text may be interrupted by terminating the
word (and line) with \fB\ec\fR;
the next encountered text will be taken as a continuation of the
interrupted word.
If the intervening control lines cause a break,
any partial line will be forced out along with any partial word.
.h1
.bt
\fB&br\fR	-	-	B	Break.
The filling of the line currently
being collected is stopped and
the line is output without adjustment.
Text lines beginning with space characters
and empty text lines (blank lines) also cause a break.
.bt
.lg 0
\fB&fi\fR	\(fill|on	-	B,E	Fill subsequent output lines.
.lg
The register \fB.u\fR is 1 in fill mode and 0 in nofill mode.
.bt
\fB&nf\fR	fill|on	-	B,E	Nofill.
Subsequent output lines are \fIneither\fR filled \fInor\fR adjusted.
Input text lines are copied directly to output lines
\fIwithout regard\fR for the current line length.
.bt
\fB&ad\fI|c\fR	adj,both	adjust	E	\
Line adjustment is begun.
If fill mode is not on, adjustment will be deferred until
fill mode is back on.
If the type indicator \fIc\fR is present,
the adjustment type is changed as shown in the following table.
The type indicator can also be a value saved  from the read-only \fB.j\fR number
register, which is set to contain the current adjustment mode and type.
.TS
center box;
c|c
c|l.
Indicator	Adjust Type
_
\fBl\fR	adjust left margin only
\fBr\fR	adjust right margin only
\fBc\fR	center
\fBb\fR or \fBn\fR	adjust both margins
absent	unchanged
.TE
.bt
\fB&na\fR	adjust	-	E	Noadjust.
Adjustment is turned off;
the right margin will be ragged.
The adjustment type for \fBad\fR is not changed.
Output line filling still occurs if fill mode is on.
.bt
\fB&ce\fI|N\fR	off	\fIN\fR\(eq1	B,E	Center the next \fIN\fR input text lines
within the current (line-length minus indent).
If \fIN\fR\(eq\^0, any residual count is cleared.
A break occurs after each of the \fIN\fR input lines.
If the input line is too long,
it will be left adjusted.
.mh
Vertical Spacing
.sc
Base-line spacing.
The vertical spacing \fI(V)\fR between the base-lines of successive
output lines can be set
using the \fBvs\fR request
with a resolution of 1\(sl144\|inch\|\(eq\|1\(sl2|point
in \*(TR,
and to the output device resolution in \*(NR.
\fIV\fR must be large enough to accommodate the character sizes
on the affected output lines.
For the common type sizes (9-12 points),
usual typesetting practice is to set \fIV\fR to 2\ points greater than the
point size;
\*(TR default is 10-point type on a 12-point spacing
(as in this document).
The current \fIV\fR is available in the \fB.v\fR register.
Multiple-\fIV\|\fR line separation (e.\|g. double spacing) may be requested
with \fBls\fR.
.sc
Extra line-space.
If a word contains a vertically tall construct requiring
the output line containing it to have extra vertical space
before and\(slor after it,
the \fIextra-line-space\fR function \fB\ex\fI\'N\|\|\'\fR
can be imbedded in or attached to that word.
In this and other functions having a pair of delimiters around
their parameter (here \fB\'\fR\|),
the delimiter choice is arbitrary,
except that it can't look like the continuation of a number expression for \fIN\fR.
If \fIN\fR is negative,
the output line containing the word will
be preceded by \fIN\fR extra vertical space;
if \fIN\fR is positive,
the output line containing the word
will be followed by \fIN\fR extra vertical space.
If successive requests for extra space apply to the same line,
the maximum values are used.
The most recently utilized post-line extra line-space is available in the \fB.a\fR register.
.sc
Blocks of vertical space.
A block of vertical space is ordinarily requested using \fBsp\fR,
which honors the \fIno-space\fR mode and which does
not space \fIpast\fR a trap.
A contiguous block of vertical space may be reserved using \fBsv\fR.
.h1
.bt
\fB&vs\fI|N\fR	1\(sl6in;12pts	previous	E,\fBp\fR	Set vertical base-line spacing size \fIV\fR.
Transient \fIextra\fR vertical space available with \fB\ex\fI\'N\|\|\'\fR (see above).
.bt
\fB&ls\fI|N\fR	\fIN\(eq\^\fR1	previous	E	\fILine\fR spacing
set to \fI\(+-N\fR.
\fIN\(mi\fR1 \fIV\fR\^s \fI(blank lines)\fR are
appended to each output text line. The (read-only) number register \fB.L\fR
is set to contain the current line-spacing value.
Appended blank lines are omitted, if the text or previous appended blank line reached a trap position.
.bt
\fB&sp\fI|N\fR	-	\fIN\fR\(eq1\fIV\fR	B,\fBv\fR	Space vertically in \fIeither\fR direction.
If \fIN\fR is negative, the motion is \fIbackward\fR (upward)
and is limited to the distance to the top of the page.
Forward (downward) motion is truncated to the distance to the
nearest trap.
If the no-space mode is on,
no spacing occurs (see \fBns\fR, and \fBrs\fR below).
.bt
\fB&sv\fI|N\fR	-	\fIN\(eq\fR1\fIV\fR	\fBv\fR	Save a contiguous vertical block of size \fIN\fR.
If the distance to the next trap is greater
than \fIN\fR, \fIN\fR vertical space is output.
No-space mode has \fIno\fR effect.
If this distance is less than \fIN\fR,
no vertical space is immediately output,
but \fIN\fR is remembered for later output (see \fBos\fR).
Subsequent \fBsv\fR requests will overwrite any still remembered \fIN\fR.
.bt
\fB&os\fR	-	-	-	Output saved vertical space.
No-space mode has \fIno\fR effect.
Used to finally output a block of vertical space requested
by an earlier \fBsv\fR request.
.bt
\fB&ns\fR	space	-	D	No-space mode turned on.
When on, the no-space mode inhibits \fBsp\fR requests and
\fBbp\fR requests \fIwithout\fR a next page number.
The no-space mode is turned off when a line of
output occurs, or with \fBrs\fR.
.bt
\fB&rs\fR	space	-	D	Restore spacing.
The no-space mode is turned off.
.bt
Blank|text|line.	-	B	Causes a break and
outputs a blank line just like \fBsp|1\fR.
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\"
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\"
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\"
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\"
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\"
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m2	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.tr |
.rm mx
.br
.mh
Line Length and Indenting
.pg
The maximum line length for fill mode may be set with \fBll\fR.
The indent may be set with \fBin\fR;
an indent applicable to \fIonly\fR the \fInext\fR output line may be set with \fBti\fR.
The line length includes indent space but \fInot\fR
page offset space.
The line-length minus the indent is the basis for centering with \fBce\fR.
The effect of \fBll\fR, \fBin\fR, or \fBti\fR
is delayed, if a partially collected line exists,
until after that line is output.
In fill mode the length of text on an output line is less than or equal to
the line length minus the indent.
The current line length and indent are available in registers \fB.l\fR and \fB.i\fR respectively.
The length of \fIthree-part titles\fR produced by \fBtl\fR
(see \(sc14) is \fIindependently\fR set by \fBlt\fR.
.h1
.bt
\fB&ll\fI|\(+-N\fR	6.5\|in	previous	E,\fBm\fR	Line length is set to \(+-\fIN\fR.
In \*(TR the maximum (line-length)+(page-offset) is about 7.54 inches.
.bt
\fB&in\fI|\(+-N\fR	\fIN\(eq\^\fR0	previous	B,E,\fBm\fR	Indent is set to \fI\(+-N\fR.
The indent is prepended to each output line.
.bt
\fB&ti\fI|\(+-N\fR	-	ignored	B,E,\fBm\fR	Temporary indent.
The \fInext\fR output text line will be indented a distance \fI\(+-N\fR
with respect to the current indent.
The resulting total indent may not be negative.
The current indent is not changed.
.mh
Macros, Strings, Diversion, and Position Traps
.sc
Macros and strings.
A \fImacro\fR is a named set of arbitrary \fIlines\fR that may be invoked by name or
with a \fItrap\fR.
A \fIstring\fR is a named string of \fIcharacters\fR,
\fInot\fR including a newline character,
that may be interpolated by name at any point.
Request, macro, and string names share the \fIsame\fR name list.
Macro and string names
may be one or two characters long and may usurp previously defined
request, macro, or string names.
Any of these entities may be renamed with \fBrn\fR
or removed with \fBrm\fR.
Macros are created by \fBde\fR and \fBdi\fR, and appended to by \fBam\fR and \fBda\fR;
\fBdi\fR and \fBda\fR cause normal output to be stored in a macro.
Strings are created by \fBds\fR and appended to by \fBas\fR.
A macro is invoked in the same way as a request;
a control line beginning \fB.\fIxx\fR will interpolate the contents of macro \fIxx\fR.
The remainder of the line may contain up to nine \fIarguments\fR.
The strings \fIx\fR and \fIxx\fR are interpolated at any desired point with
\fB\e\(**\fIx\fR and \fB\e\(**(\fIxx\fR respectively.
String references and macro invocations may be nested.
.sc
Copy mode input interpretation.
During the definition and extension
of strings and macros (not by diversion)
the input is read in \fIcopy mode\fR.
The input is copied without interpretation
\fIexcept\fR that:
.x1
.ds + \v'-.1m'\s-4\(bu\s+4\v'+.1m'
\(bu The contents of number registers indicated by \fB\en\fR are interpolated.
\(bu Strings indicated by \fB\e\(**\fR are interpolated.
\(bu Arguments indicated by \fB\e$\fR are interpolated.
\(bu Concealed newlines indicated by \fB\e\fR(newline) are eliminated.
\(bu Comments indicated by \fB\e"\fR are eliminated.
\(bu \fB\et\fR and \fB\ea\fR are interpreted as \s-1ASCII\s+1 horizontal tab and \s-1SOH\s+1 respectively (\(sc9).
\(bu \fB\e\e\fR is interpreted as \fB\e\fR.
\(bu \fB\e.\fR is interpreted as "\fB.\fR".
.x2
These interpretations can be suppressed by
prepending
a \fB\e\fR.
For example, since \fB\e\e\fR maps into a \fB\e\fR, \fB\e\en\fR will copy as \fB\en\fR which
will be interpreted as a number register indicator when the
macro or string is reread.
.sc
Arguments.
When a macro is invoked by name, the remainder of the line is
taken to contain up to nine arguments.
The argument separator is the space character, and arguments
may be surrounded by double-quotes to permit imbedded space characters.
Pairs of double-quotes may be imbedded in double-quoted arguments to
represent a single double-quote.
If the desired arguments won't fit on a line,
a concealed newline may be used to continue on the next line.
.pg
When a macro is invoked the \fIinput level\fR is \fIpushed down\fR and
any arguments available at the previous level become unavailable
until the macro is completely read and the previous level is restored.
A macro's own arguments can be interpolated at \fIany\fR point
within the macro with \fB\e$\fIN\fR, which interpolates the \fIN\fR\^th
argument
(1\(<=\fIN\fR\^\(<=9).
If an invoked argument doesn't exist,
a null string results.
For example, the macro \fIxx\fR may be defined by
.x1
.ft B
.ta .75i
&de xx	\e"begin definition
Today is \e\e$1 the \e\e$2.
&.	\e"end definition
.ft R
.x2
and called by
.x1
.ft B
&xx Monday 14th
.ft R
.x2
to produce the text
.x1
.ft B
Today is Monday the 14th.
.ft R
.x2
Note that the \fB\e$\fR
was concealed in the definition with a prepended \fB\e\fR.
The number of currently available
arguments is in the \fB.$\fR register.
.pg
No arguments are available at the top (non-macro) level
in this implementation.
Because string referencing is implemented
as an input-level push down,
no arguments are available from \fIwithin\fR a string.
No arguments are available within a trap-invoked macro.
.pg
Arguments are copied in \fIcopy mode\fR onto a stack
where they are available for reference.
The mechanism does not allow an argument to contain
a direct reference to a \fIlong\fR string
(interpolated at copy time) and it is advisable to
conceal string references (with an extra \fB\e\fR\|)
to delay interpolation until argument reference time.
.sc
Diversions.
Processed output may be diverted into a macro for purposes
such as footnote processing (see Tutorial \(scT5)
or determining the horizontal and vertical size of some text for
conditional changing of pages or columns.
A single diversion trap may be set at a specified vertical position.
The number registers \fBdn\fR and \fBdl\fR respectively contain the
vertical and horizontal size of the most
recently ended diversion.
Processed text that is diverted into a macro
retains the vertical size of each of its lines when reread
in \fInofill\fR mode
regardless of the current \fIV\fR.
Constant-spaced (\fBcs\fR) or emboldened (\fBbd\fR) text that is diverted
can be reread correctly only if these modes are again or still in effect
at reread time.
One way to do this is to imbed in the diversion the appropriate
\fBcs\fR or \fBbd\fR requests with the \fItransparent\fR
mechanism described in \(sc10.6.
.pg
Diversions may be nested
and certain parameters and registers
are associated
with the current diversion level
(the top non-diversion level may be thought of as the
0th diversion level).
These are the diversion trap and associated macro,
no-space mode,
the internally-saved marked place (see \fBmk\fR and \fBrt\fR),
the current vertical place (\fB.d\fR register),
the current high-water text base-line (\fB.h\fR register),
and the current diversion name (\fB.z\fR register).
.sc
Traps.
Three types of trap mechanisms are available\(empage traps, a diversion trap, and
an input-line-count trap.
Macro-invocation traps may be planted using \fBwh\fR at any page position including the top.
This trap position may be changed using \fBch\fR.
Trap positions at or below the bottom of the page
have no effect unless or until
moved to within the page or rendered effective by an increase in page length.
Two traps may be planted at the \fIsame\fR position only by first planting them at different
positions and then moving one of the traps;
the first planted trap will conceal the second unless and until the first one is moved
(see Tutorial Examples \(scT5).
If the first one is moved back, it again conceals the second trap.
The macro associated with a page trap is automatically
invoked when a line of text is output whose vertical size \fIreaches\fR
or \fIsweeps past\fR the trap position.
Reaching the bottom of a page springs the top-of-page trap, if any,
provided there is a next page.
The distance to the next trap position is available in the \fB.t\fR register;
if there are no traps between the current position and the bottom of the page,
the distance returned is the distance to the page bottom.
.pg
A macro-invocation trap effective in the current diversion may be planted using \fBdt\fR.
The \fB.t\fR register works in a diversion; if there is no subsequent trap a \fIlarge\fR
distance is returned.
For a description of input-line-count traps, see the \fBit\fR request below.
.h1
.bt
\fB&de\fI|xx|yy\fR	-	\fI.yy=\fB..\fR	-	Define or redefine the macro \fIxx\fR.
The contents of the macro begin on the next input line.
Input lines are copied in \fIcopy mode\fR until the definition is terminated by a
line beginning with \fB.\fIyy\fR,
whereupon the macro \fIyy\fR is called.
In the absence of \fIyy\fR, the definition
is terminated by a
line beginning with "\fB..\fR".
A macro may contain \fBde\fR requests
provided the terminating macros differ
or the contained definition terminator is concealed.
\&"\fB..\fR" can be concealed as
\fB\e\e..\fR which will copy as \fB\e..\fR and be reread as "\fB..\fR".
.bt
\fB&am\fI|xx|yy\fR	-	\fI.yy=\fB..\fR	-	Append to macro (append version of \fBde\fR).
.bt
\fB&ds\fI|xx|string\fR	-	ignored	-	Define a string
\fIxx\fR containing \fIstring\fR.
Any initial double-quote in \fIstring\fR is stripped off to permit
initial blanks.
.bt
\fB&as\fI|xx|string\fR	-	ignored	-	Append
\fIstring\fR to string \fIxx\fR
(append version of \fBds\fR).
.bt
\fB&rm\fI|xx\fR	-	ignored	-	Remove
request, macro, or string.
The name \fIxx\fR is removed from the name list and
any related storage space is freed.
Subsequent references will have no effect.
.bt
\fB&rn\fI|xx|yy\fR	-	ignored	-	Rename request, macro, or string
\fIxx\fR to \fIyy\fR.
If \fIyy\fR exists, it is first removed.
.bt
\fB&di|\fIxx\fR	-	end	D	Divert output to macro \fIxx\fR.
Normal text processing occurs during diversion
except that page offsetting is not done.
The diversion ends when the request \fBdi\fR or \fBda\fR is encountered without an argument;
extraneous
requests of this type should not appear when nested diversions are being used.
.bt
\fB&da|\fIxx\fR	-	end	D	Divert, appending to \fIxx\fR
(append version of \fBdi\fR).
.bt
\fB&wh\fI|N|xx\fR	-	-	\fBv\fR	Install
a trap to invoke \fIxx\fR at page position \fIN;\fR
a \fInegative N\fR will be interpreted with respect to the
page \fIbottom\fR.
Any macro previously planted at \fIN\fR is replaced by \fIxx\fR.
A zero \fIN\fR refers to the \fItop\fR of a page.
In the absence of \fIxx\fR, the first found trap at \fIN\fR, if any, is removed.
.bt
\fB&ch\fI|xx|N\fR	-	-	\fBv\fR	Change
the trap position for macro \fIxx\fR to be \fIN\fR.
In the absence of \fIN\fR, the trap, if any, is removed.
.bt
\fB&dt\fI|N|xx\fR	-	off	D,\fBv\fR	Install a diversion trap
at position \fIN\fR in the \fIcurrent\fR diversion to invoke
macro \fIxx\fR.
Another \fBdt\fR will redefine the diversion trap.
If no arguments are given, the diversion trap is removed.
.bt
\fB&it\fI|N|xx\fR	-	off	E	Set an input-line-count trap
to invoke the macro \fIxx\fR after \fIN\fR lines of \fItext\fR input
have been read
(control or request lines don't count).
The text may be in-line text or
text interpolated by inline or trap-invoked macros.
.bt
\fB&em\fI|xx\fR	none	none	-	The
macro \fIxx\fR will be invoked
when all input has ended.
The effect is the same as if the contents of \fIxx\fR had been at the end
of the last file processed.
.mh
Number Registers
.pg
A variety of parameters are available to the user as
predefined, named \fInumber registers\fR (see Summary and Index, page 7).
In addition, the user may define his own named registers.
Register names are one or two characters long and \fIdo not\fR conflict
with request, macro, or string names.
Except for certain predefined read-only registers,
a number register can be read, written, automatically
incremented or decremented, and interpolated
into the input in a variety of formats.
One common use of user-defined registers is to
automatically number sections, paragraphs, lines, etc.
A number register may be used any time numerical input is expected or desired
and may be used in numerical \fIexpressions\fR (\(sc1.4).
.pg
Number registers are created and modified using \fBnr\fR, which
specifies the name, numerical value, and the auto-increment size.
Registers are also modified, if accessed
with an auto-incrementing sequence.
If the registers \fIx\fR and \fIxx\fR both contain
\fIN\fR and have the auto-increment size \fIM\fR,
the following access sequences have the effect shown:
.TS
center box;
c2|c2|c
c2|c2|c
l2|c2|c
l2|c2|c
l2|l2|c.
	Effect on	Value
Sequence	Register	Interpolated
_
\fB\en\fIx\fR	none	\fIN\fR
\fB\en(\fIxx\fR	none	\fIN\fR
\fB\en+\fIx\fR	\fIx\fR incremented by \fIM\fR	\fIN+M\fR
\fB\en\-\fIx\fR	\fIx\fR decremented by \fIM\fR	\fIN\-M\fR
\fB\en+(\fIxx\fR	\fIxx\fR incremented by \fIM\fR	\fIN+M\fR
\fB\en\-(\fIxx\fR	\fIxx\fR decremented by \fIM\fR	\fIN\-M\fR
.TE
When interpolated, a number register is converted to
decimal (default),
decimal with leading zeros,
lower-case Roman,
upper-case Roman,
lower-case sequential alphabetic,
or
upper-case sequential alphabetic
according to the format specified by \fBaf\fR.
.h1
.bt
\fB&nr\fI|R|\(+-N|M\fR	-	-	\fBu\fR	\
The number register \fIR\fR is assigned the value \fI\(+-N\fR
with respect to the previous value, if any.
The increment for auto-incrementing is set to \fIM\fR.
.bt
\fB&af\fI|R|c\fR	arabic	-	-	Assign format \fIc\fR to register \fIR\fR.
The available formats are:
.TS
center box;
c2|c
c2|c
c2|l.
	Numbering
Format	Sequence
_
\fB1\fR	0,1,2,3,4,5,...
\fB001\fR	000,001,002,003,004,005,...
\fBi\fR	0,i,ii,iii,iv,v,...
\fBI\fR	0,I,II,III,IV,V,...
\fBa\fR	0,a,b,c,...,z,aa,ab,...,zz,aaa,...
\fBA\fR	0,A,B,C,...,Z,AA,AB,...,ZZ,AAA,...
.TE
An arabic format having \fIN\fR digits
specifies a field width of \fIN\fR digits (example 2 above).
The read-only registers and the \fIwidth\fR function (\(sc11.2)
are always arabic.
.bt
\fB&rr\fI|R\fR	-	ignored	-	Remove register \fIR\fR.
If many registers are being created dynamically, it
may become necessary to remove no longer used registers
to recapture internal storage space for newer registers.
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\" 
.\"	@(#)m3	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.tr |
.rm mx
.mh
Tabs, Leaders, and Fields
.sc
Tabs and leaders.
The \s-1ASCII\s+1 horizontal tab character and the \s-1ASCII\s+1
\s-1SOH\s+1 (hereafter known as the \fIleader\fR character)
can both be used to generate either horizontal motion or
a string of repeated characters.
The length of the generated entity is governed
by internal \fItab stops\fR specifiable
with \fBta\fR.
The default difference is that tabs generate motion and leaders generate
a string of periods;
\fBtc\fR and \fBlc\fR
offer the choice of repeated character or motion.
There are three types of internal tab stops\(em\
\fIleft\fR adjusting, \fIright\fR adjusting,
and \fIcentering\fR.
In the following table:
\fID\fR is the distance from the current position on the \fIinput\fR line
(where a tab or leader was found)
to the next tab stop;
\fInext-string\fR consists
of the input characters following the tab (or leader) up to the next tab (or leader) or end of line;
and
\fIW\fR is the width of \fInext-string\fR.
.TS
center box;
c2|c2|c
c2|c2|c
c2|c2|l.
Tab	Length of motion or	Location of
type	repeated characters	\fInext-string\fR
_
Left	\fID\fR	Following \fID\fR
Right	\fID\-W\fR	Right adjusted within \fID\fR
Centered	\fID\-W\(sl\fR2	Centered on right end of \fID\fR
.TE
The length of generated motion is allowed to be negative, but
that of a repeated character string cannot be.
Repeated character strings contain an integer number of characters, and
any residual distance is prepended as motion.
Tabs or leaders found after the last tab stop are ignored, but may be used
as \fInext-string\fR terminators.
.pg
Tabs and leaders are not interpreted in \fIcopy mode\fR.
\fB\et\fR and \fB\ea\fR always generate a non-interpreted
tab and leader respectively, and
are equivalent to actual tabs and leaders in \fIcopy mode\fR.
.sc
Fields.
A \fIfield\fR is contained between
a \fIpair\fR of \fIfield delimiter\fR characters,
and consists of sub-strings
separated by \fIpadding\fR indicator characters.
The field length is the distance on the
\fIinput\fR line from the position where the field begins to the next tab stop.
The difference between the total length of all the sub-strings
and the field length is incorporated as horizontal
padding space that is divided among the indicated
padding places.
The incorporated padding is allowed to be negative.
For example,
if the field delimiter is \fB#\fR and the padding indicator is \fB^\fR,
\fB#^\fIxxx\fB^\fIright\|\fB#\fR
specifies a right-adjusted string with the string \fIxxx\fR centered
in the remaining space.
.h1
.bt
\fB&ta\fI|Nt|...\fR	8n;|0.5in	none	E,\fBm\fR	\
Set tab stops and types.
\fIt=\fBR\fR, right adjusting;
\fIt=\fBC\fR, centering;
\fIt\fR absent, left adjusting.
\*(TR tab stops are preset every 0.5in.;
\*(NR every 8 character widths.
The stop values are separated by spaces, and
a value preceded by \fB+\fR
is treated as an increment to the previous stop value.
.bt
\fB&tc\fI|c\fR	none	none	E	\
The tab repetition character becomes \fIc\fR,
or is removed specifying motion.
.bt
\fB&lc\fI|c\fR	\fB.\fR	none	E	\
The leader repetition character becomes \fIc\fR,
or is removed specifying motion.
.bt
\fB&fc\fI|a|b\fR	off	off	-	\
The field delimiter is set to \fIa\fR;
the padding indicator is set to the \fIspace\fR character or to
\fIb\fR, if given.
In the absence of arguments the field mechanism is turned off.
.mh
Input and Output Conventions and Character Translations
.sc
Input character translations.
Ways of inputting the graphic character set were
discussed in \(sc2.1.
The \s-1ASCII\s+1 control characters horizontal tab (\(sc9.1),
\s-1SOH\s+1 (\(sc9.1), and backspace (\(sc10.3) are discussed elsewhere.
The newline delimits input lines.
In addition,
\s-1STX\s+1, \s-1ETX\s+1, \s-1ENQ\s+1, \s-1ACK\s+1, and \s-1BEL\s+1
are accepted,
and may be used as delimiters or translated into a graphic with \fBtr\fR (\(sc10.5).
\fIAll\fR others are ignored.
.pg
The \fIescape\fR character \fB\e\fR
introduces \fIescape sequences\fR\(em\
causes the following character to mean
another character, or to indicate
some function.
A complete list of such sequences is given in the Summary and Index on page 6.
\fB\e\fR
should not be confused with the \s-1ASCII\s+1 control character \s-1ESC\s+1 of the
same name.
The escape character \fB\e\fR can be input with the sequence \fB\e\e\fR.
The escape character can be changed with \fBec\fR,
and all that has been said about the default \fB\e\fR becomes true
for the new escape character.
\fB\ee\fR can be used to print whatever the current escape character is.
If necessary or convenient, the escape mechanism may be turned off with \fBeo\fR,
and restored with \fBec\fR.
.h1
.bt
\fB&ec\fI|c\fR	\fB\e\fR	\fB\e\fR	-	\
Set escape character to \fB\e\fR, or to \fIc\fR, if given.
.bt
\fB&eo\fR	on	-	-	Turn escape mechanism off.
.sc
Ligatures.
.lg 0
Five ligatures are available
in the current \*(TR character set \(em
\fB\(fi\fR, \fB\(fl\fR, \fB\(ff\fR, \fB\(Fi\fR, and \fB\(Fl\fR.
They may be input (even in \*(NR) by
\fB\e(fi\fR, \fB\e(fl\fR, \fB\e(ff\fR, \fB\e(Fi\fR, and \fB\e(Fl\fR respectively.
.lg
The ligature mode is normally on in \*(TR, and \fIautomatically\fR invokes 
ligatures during input.
.h1
.bt
\fB&lg\fI|N\fR	off;|on	on	-	Ligature mode
is turned on if \fIN\fR is absent or non-zero,
and turned off if \fIN\(eq\^\fR0.
If \fIN\fR\(eq\^2, only the two-character ligatures are automatically invoked.
Ligature mode is inhibited for
request, macro, string, register, or file names,
and in \fIcopy mode\fR.
No effect in \*(NR.
.sc
Backspacing, underlining, overstriking, etc.
Unless in \fIcopy mode\fR, the \s-1ASCII\s+1 backspace character is replaced
by a backward horizontal motion having the width of the
space character.
Underlining as a form of line-drawing is discussed in \(sc12.4.
A generalized overstriking function is described in \(sc12.1.
.pg
\*(NR automatically underlines
characters in the \fIunderline\fR font,
specifiable with \fBuf\fR,
normally Times Italic on font position 2 (see \(sc2.2).
In addition to \fBft\fR and \fB\ef\fIF\fR,
the underline font may be selected by \fBul\fR and \fBcu\fR.
Underlining is restricted to an output-device-dependent
subset of \fIreasonable\fR characters.
.h1
.bt
\fB&ul\fI|N\fR	off	\fIN\(eq\fR1	E	\
Underline in \*(NR (italicize in \*(TR) the next \fIN\fR
input text lines.
Actually, switch to \fIunderline\fR font, saving the
current font for later restoration;
\fIother\fR font changes within the span of a \fBul\fR
will take effect,
but the restoration will undo the last change.
Output generated by \fBtl\fR (\(sc14) \fIis\fR affected by the
font change, but does \fInot\fR decrement \fIN\fR.
If \fIN\fR\^>\^1, there is the risk that
a trap interpolated macro may provide text
lines within the span;
environment switching can prevent this.
.bt
\fB&cu\fI|N\fR	off	\fIN\(eq\fR1	E	\
A variant of \fBul\fR that causes \fIevery\fR character to be underlined in \*(NR.
Identical to \fBul\fR in \*(TR.
.bt
\fB&uf\fI|F\fR	Italic	Italic	-	\
Underline font set to \fIF\fR.
In \*(NR,
\fIF\fR may \fInot\fR be on position 1 (initially Times Roman).
.sc
Control characters.
Both the control character \fB.\fR and the \fIno-break\fR
control character \fB\'\fR may be changed, if desired.
Such a change must be compatible with the design
of any macros used in the span of the change,
and
particularly of any trap-invoked macros.
.h1
.bt
\fB&cc\fI|c\fR	\fB.\fR	\fB.\fR	E	\
The basic control character is set to \fIc\fR,
or reset to "\fB.\fR".
.bt
\fB&c2\fI|c\fR	\fB\'	\'\fR	E	The \fInobreak\fR control character is set
to \fIc\fR, or reset to "\fB\'\fR".
.sc
Output translation.
One character can be made a stand-in for another character using \fBtr\fR.
All text processing (e. g. character comparisons) takes place
with the input (stand-in) character which appears to have the width of the final
character.
The graphic translation occurs at the moment of output
(including diversion).
.h1
.bt
\fB&tr\fI|abcd....\fR	none	-	O	Translate \
\fIa\fR into \fIb\fR, \fIc\fR into \fId\fR, etc.
If an odd number of characters is given,
the last one will be mapped into the space character.
To be consistent, a particular translation
must stay in effect from \fIinput\fR to \fIoutput\fR time.
.sc
Transparent throughput.
An input line beginning with a \fB\e!\fR is read in \fIcopy mode\fR and \fItransparently\fR output
(without the initial \fB\e!\fR);
the text processor is otherwise unaware of the line's presence.
This mechanism may be used to pass control information to a post-processor
or to imbed control lines in a macro created by a diversion.
.sc
Comments and concealed newlines.
An uncomfortably long input line that must stay
one line (e. g. a string definition, or nofilled text)
can be split into many physical lines by ending all but
the last one with the escape \fB\e\fR.
The sequence \fB\e\fR(newline) is \fIalways\fR ignored\(em\
except in a comment.
Comments may be imbedded at the \fIend\fR of any line by
prefacing them with \fB\e"\fR.
The newline at the end of a comment cannot be concealed.
A line beginning with \fB\e"\fR will appear as a blank line and
behave like \fB.sp|1\fR;
a comment can be on a line by itself by beginning the line with \fB.\e"\fR.
.mh
Local Horizontal and Vertical Motions, and the Width Function
.sc
Local Motions.
The functions \fB\ev\'\fIN\fB\|\'\fR and
\fB\eh\'\fIN\fB\|\'\fR
can be used for \fIlocal\fR vertical and horizontal motion respectively.
The distance \fIN\fR may be negative; the \fIpositive\fR directions
are \fIrightward\fR and \fIdownward\fR.
A \fIlocal\fR motion is one contained \fIwithin\fR a line.
To avoid unexpected vertical dislocations, it is necessary that
the \fInet\fR vertical local motion within a word in filled text
and otherwise within a line balance to zero.
The above and certain other escape sequences providing local motion are
summarized in the following table.
.tr ||
.ds X \0\0\0
.TS
center box;
c2|cs2||c2|cs
c1|c2c2||c2|c2c.
Vertical	Effect in	Horizontal	Effect in
Local Motion	\*(TR	\*(NR	Local Motion	\*(TR	\*(NR
_
.sp .4
.T&
l2|ls2||l2|ls.
\fB\*X\ev\'\fIN\|\^\fB\'\fR	Move distance \fIN\fR	\
\fB\*X\eh\'\fIN\|\^\fB\'\fR	Move distance \fIN\fR
.T&
_2|_2_2||l2|ls.
			\fB\*X\e\fR(space)	Unpaddable space-size space
.T&
l2|l2|l2||l2|ls.
\fB\*X\eu\fR	\(12 em up	\(12 line up	\fB\*X\e0\fR	Digit-size space
.T&
l2|l2|l2||_2|_2_.
\fB\*X\ed\fR	\(12 em down	\(12 line down			
.T&
l2|l2|l2||l2|l2|l.
\fB\*X\er\fR	1 em up	1 line up	\fB\*X\e\||\fR	1\(sl6 em space	ignored
			\fB\*X\e^\fR	1\(sl12 em space	ignored
.sp .4
.TE
.rm X
.tr |
As an example,
\fBE\s-2\v'-.4m'2\v'.4m'\s+2\fR
could be generated by the sequence
\fBE\es\-2\ev\'\-0.4m\'2\ev\'0.4m\'\es+2\fR;
it should be noted in this example that
the 0.4|em vertical motions are at the smaller size.
.sc
Width Function.
The \fIwidth\fR function \fB\ew\'\fIstring\fB\|\'\fR
generates the numerical width of \fIstring\fR (in basic units).
Size and font changes may be safely imbedded in \fIstring\fR,
and will not affect the current environment.
For example,
\&\fB.ti|\-\\w\'1.|\'u\fR could be used to
temporarily indent leftward a distance equal to the
size of the string "\fB1.|\fR".
.pg
The width function also sets three number registers.
The registers \fBst\fR and \fBsb\fR are set respectively to the highest and
lowest extent of \fIstring\fR relative to the baseline;
then, for example,
the total \fIheight\fR of the string is \fB\en(stu\-\en(sbu\fR.
In \*(TR the number register \fBct\fR is set to a value
between 0|and|3:
0 means that all of the characters in \fIstring\fR were short lower
case characters without descenders (like \fBe\fR);
1 means that at least one character has a descender (like \fBy\fR);
2 means that at least one character is tall (like \fBH\fR);
and 3 means that both tall characters and characters with
descenders are present.
.sc
Mark horizontal place.
The escape sequence \fB\ek\fIx\fR will cause the \fIcurrent\fR horizontal
position in the \fIinput line\fR to be stored in register \fIx\fR.
As an example,
the construction \fB\ekx\fIword\|\fB\eh\'\|~\|\enxu+2u\'\fIword\fB\fR
will embolden \fIword\fR by backing up to almost its beginning and overprinting it,
resulting in \kz\fIword\fR\h'|\nzu+2u'\fIword\fR.
.mh
Overstrike, Bracket, Line-drawing, and Zero-width Functions
.sc
Overstriking.
Automatically centered overstriking of up to nine characters
is provided by the \fIoverstrike\fR function
\fB\eo\'\fIstring\fB\|\'\fR.
The characters in \fIstring\fR are overprinted with centers aligned; the total width
is that of the widest character.
\fIstring\fR should \fInot\fR contain local vertical motion.
As examples,
\fB\eo\'e\e\'\'\fR produces \fB\o'e\''\fR, and
\fB\eo\'\e(mo\e(sl\'\fR produces \fB\o'\(mo\(sl'\fR.
.sc
Zero-width characters.
The function \fB\ez\fIc\fR will output \fIc\fR without spacing over
it, and can be used to produce left-aligned overstruck
combinations.
As examples,
\fB\ez\e(ci\e(pl\fR will produce \fB\z\(ci\(pl\fR, and
\fB\e(br\ez\e(rn\e(ul\e(br\fR will produce the smallest possible
constructed box \fB\(br\z\(rn\(ul\(br\fR\|.
.sc
Large Brackets.
The Special Mathematical Font contains a number of bracket construction pieces
(\|\|\|\(lt\|\|\|\(lb\|\|\|\(rt\|\|\|\(rb\|\|\|\(lk\|\|\|\(rk\|\|\|\(bv\|\|\|\(lf\|\|\|\(rf\|\|\|\(lc\|\|\|\(rc\|\|)
that can be combined into various bracket styles.
The function \fB\eb\'\fIstring\fB\|\'\fR may be used to pile
up vertically the characters in \fIstring\fR
(the first character on top and the last at the bottom);
the characters are vertically separated by 1|em and the total
pile is centered 1\(sl2\|em above the current baseline
(\(12 line in \*(NR).
For example,
\fB\eb\'\|\e(lc\e(lf\|\'E\e\|~\|\eb\'\|\e(rc\e(rf\|\'\|\ex\'\|\-0.5m\'\|\ex\'0.5m\'\|\fR
produces
\x'-.5m'\x'.5m'\fB\b'\(lc\(lf'E\|\b'\(rc\(rf'\fR.
.sc
Line drawing.
.tr &&
The function \fB\e\|l\|\'\fINc\fB\|\'\fR will draw a string of repeated \fIc\fR\|'s towards the right for a distance \fIN\fR.
(\|\fB\el\fR is \fB\e\fR(lower case L).
If \fIc\fR looks like a continuation of
an expression for \fIN\fR, it may insulated from \fIN\fR with a \fB\e&\fR.
If \fIc\fR is not specified, the \fB\(ru\fR (baseline rule) is used
(underline character in \*(NR).
If \fIN\fR is negative, a backward horizontal motion
of size \fIN\fR is made \fIbefore\fR drawing the string.
Any space resulting from \fIN\fR\|\(sl(size of \fIc\fR) having a remainder is put at the beginning (left end)
of the string.
In the case of characters
that are designed to be connected such as
baseline-rule\ \fB\(ru\fR\|,
underrule\ \fB\(ul\fR\|,
and
root-en\ \fB\(rn\fR\|,
the remainder space is covered by over-lapping.
If \fIN\fR is \fIless\fR than the width of \fIc\fR,
a single \fIc\fR is centered on a distance \fIN\fR.
As an example, a macro to underscore a string can be written
.br
.tr &.
.x1
.ft B
.ne 2.1
&de us
\e\e$1\e\|l\|\'\|~\|0\e(ul\'
&&
.ft R
.x2
.ne 2.1
.de xu
\\$1\l'|0\(ul'
..
or one to draw a box around a string
.x1
.ft B
&de bx
\e(br\e\|~\|\e\e$1\e\|~\|\e(br\e\|l\|\'\|~\|0\e(rn\'\e\|l\|\'\|~\|0\e(ul\'
&&
.ft R
.x2
.de bx
\(br\|\\$1\|\(br\l'|0\(rn'\l'|0\(ul'
..
such that
.x1
.ft B
&us "underlined words"
.ft R
.x2
and
.x1
.ft B
&bx "words in a box"
.ft R
.x2
yield
.xu "underlined words"
and
.bx "words in a box"
\h'-\w'.'u'.
.pg
The function \fB\eL\'\|\fINc\fB\|\'\fR will draw a vertical line consisting
of the (optional) character \fIc\fR stacked vertically apart 1\|em
(1 line in \*(NR),
with the first two characters overlapped,
if necessary, to form a continuous line.
The default character is the \fIbox rule\fR |\(br| (\fB\|\e(br\fR);
the other suitable character is the \fIbold vertical\fR \|\(bv\| (\fB\|\e(bv\fR).
The line is begun without any initial motion relative to the
current base line.
A positive \fIN\fR specifies a line drawn downward and
a negative \fIN\fR specifies a line drawn upward.
After the line is drawn \fIno\fR compensating
motions are made;
the instantaneous baseline is at the \fIend\fR of the line.
.pg
.de eb
.sp -1
.nf
\h'-.5n'\L'|\\nzu-1'\l'\\n(.lu+1n\(ul'\L'-|\\nzu+1'\l'|0u-.5n\(ul'
.fi
..
.ne 2i
.mk z
The horizontal and vertical line drawing functions may be used
in combination to produce large boxes.
The zero-width \fIbox-rule\fR and the \(12-em wide \fIunderrule\fR
were \fIdesigned\fR to form corners when using 1-em vertical
spacings.
For example the macro
.x1
.ft B
\&.de eb
\&.sp \-1	\e"compensate for next automatic base-line spacing
\&.nf	\e"avoid possibly overflowing word buffer
.tr ||
\&\eh\'\-.5n\'\eL\'\||\|\e\enau\-1\'\el\'\e\en(.lu+1n\e(ul\'\eL\'\-\||\|\e\enau+1\'\el\'\||\|0u\-.5n\e(ul\'    \e"draw box
.tr |
.lg 0
\&.fi
.lg
\&..
.ft R
.x2
will draw a box around some text whose beginning vertical place was
saved in number register \fIa\fR
(e. g. using \fB.mk|a\fR)
as done for this paragraph.
.eb
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m4	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.tr |
.mh
Hyphenation.
.pg
The automatic hyphenation may be switched off and on.
When switched on with \fBhy\fR,
several variants may be set.
A \fIhyphenation indicator\fR character may be imbedded in a word to
specify desired hyphenation points,
or may be prepended to suppress hyphenation.
In addition,
the user may specify a small exception word list.
.pg
Only words that consist of a central alphabetic string
surrounded by (usually null) non-alphabetic strings
are considered candidates for automatic hyphenation.
Words that were input containing hyphens
(minus),
em-dashes (\fB\e(em\fR),
or hyphenation indicator characters\
\(emsuch as mother-in-law\(em\
are \fIalways\fR subject to splitting after those characters,
whether or not automatic hyphenation is on or off.
.h1
.bt
\fB&nh\fR	hyphenate	-	E	\
Automatic hyphenation is turned off.
.bt
\fB&hy\fIN\fR	on,\fIN=\fR1	on,\fIN=\fR1	E	\
Automatic hyphenation is turned on
for \fIN\fR\|\(>=1, or off for \fIN=\fR\|0.
If \fIN=\fR\|2, \fIlast\fR lines (ones that will cause a trap)
are not hyphenated.
For \fIN=\fR\|4 and 8, the last and first two characters
respectively of a word are not split off.
These values are additive;
i.|e. \fIN=\fR\|14 will invoke all three restrictions.
.bt
\fB&hc\fI|c\fR	\fB\e%	\e%\fR	E	Hyphenation indicator character is set
to \fIc\fR or to the default \fB\e%\fR.
The indicator does not appear in the output.
.bt
\fB&hw\fI|word1|...\fR		ignored	-	Specify hyphenation points in words
with imbedded minus signs.
Versions of a word with terminal \fIs\fR are implied;
i.|e. \fIdig\-it\fR implies \fIdig\-its\fR.
This list is examined initially \fIand\fR after
each suffix stripping.
The space available is small\(emabout 128 characters.
.mh
Three Part Titles.
.pg
The titling function \fBtl\fR provides for automatic placement
of three fields at the left, center, and right of a line
with a title-length
specifiable with \fBlt\fR.
\fBtl\fR may be used anywhere, and is independent of the
normal text collecting process.
A common use is in header and footer macros.
.h1
.bt
\fB&tl\fI|\'left\|\'center\|\'right\|\'\fR	-	-	\
The strings \fIleft\fR, \fIcenter\fR, and \fIright\fR are
respectively left-adjusted, centered, and right-adjusted
in the current title-length.
Any of the strings may be empty,
and overlapping is permitted.
If the page-number character (initially \fB%\fR) is found within any of the fields it is replaced
by the current page number having the format assigned to register \fB%\fR.
Any character may be used as the string delimiter.
.bt
\fB&pc\fI|c\fR	\fB%\fR	off	-	The page number character is set to \fIc\fR,
or removed.
The page-number register remains \fB%\fR.
.bt
\fB&lt\fI|\(+-N\fR	6.5\|in	previous	E,\fBm\fR	Length of title set to \fI\(+-N\fR.
The line-length and the title-length are \fIindependent\fR.
Indents do not apply to titles; page-offsets do.
.mh
Output Line Numbering.
.pg
.ll -\w'0000'u
.nm 1 3
Automatic sequence numbering of output lines may be
requested with \fBnm\fR.
When in effect,
a three-digit, arabic number plus a digit-space
is prepended to output text lines.
The text lines are thus offset by four digit-spaces,
and otherwise retain their line length;
a reduction in line length may be desired to keep the right margin
aligned with an earlier margin.
Blank lines, other vertical spaces, and lines generated by \fBtl\fR
are \fInot\fR numbered.
Numbering can be temporarily suspended with \fBnn\fR,
or with an \fB.nm\fR followed by a later \fB.nm|+0\fR.
In addition,
a line number indent \fII\fR, and the number-text separation \fIS\fR
may be specified in digit-spaces.
Further, it can be specified that only those line numbers that are
multiples of some number \fIM\fR are to be printed (the others will appear
as blank number fields).
.br
.nm
.ll
.h1
.bt
\fB&nm\fI|\(+-N|M|S|I\fR		off	E	\
Line number mode.
If \fI\(+-N\fR is given,
line numbering is turned on,
and the next output line numbered is numbered \fI\(+-N\fR.
Default values are \fIM=\fR\|1, \fIS=\fR\|1, and \fII=\fR\|0.
Parameters corresponding to missing arguments are unaffected;
a non-numeric argument is considered missing.
In the absence of all arguments, numbering is turned off;
the next line number is preserved for possible further use
in number register \fBln\fR.
.bt
\fB&nn\fI|N\fR	-	\fIN=\fR1	E	The next \fIN\fR text output lines are not
numbered.
.pg
.ll -\w'0000'u
.nm +0
As an example, the paragraph portions of this section
are numbered with \fIM=\fR\|3:
\&\fB.nm|1|3\fR was placed at the beginning;
\&\fB.nm\fR was placed at the end of the first paragraph;
and \fB.nm|+0\fR was placed in front of this paragraph;
and \fB.nm\fR finally placed at the end.
Line lengths were also changed (by \fB\ew\'0000\'u\fR) to keep the right side aligned.
Another example is
\&\fB.nm|+5|5|x|3\fR which turns on numbering with the line number of the next
line to be five greater than the last numbered line,
with \fIM=\fR\|5, with spacing \fIS\fR untouched, and with the indent \fII\fR set to 3.
.br
.ll
.nm
.mh
Conditional Acceptance of Input
.pg
In the following,
\fIc\fR is a one-character, built-in \fIcondition\fR name,
\fB!\fR signifies \fInot\fR,
\fIN\fR is a numerical expression,
\fIstring1\fR and \fIstring2\fR are strings delimited by any non-blank, non-numeric character \fInot\fR in the strings,
and
\fIanything\fR represents what is conditionally accepted.
.h1
.bt
\fB&if\fI|c|anything\fR		-	-	If condition \fIc\fR true, accept \fIanything\fR as input;
in multi-line case use \fI\e{anything\|\e}\fR.
.bt
\fB&if|!\fIc|anything\fR		-	-	If condition \fIc\fR false, accept \fIanything\fR.
.bt
\fB&if\fI|N|anything\fR		-	\fBu\fR	If expression \fIN\fR > 0, accept \fIanything\fR.
.bt
\fB&if|!\fIN|anything\fR	-	\fBu\fR	If expression \fIN\fR \(<= 0, accept \fIanything\fR.
.bt
\fB&if\fI|\|\'string1\|\'string2\|\'|anything\fR	-	If \fIstring1\fR identical to \fIstring2\fR,
accept \fIanything\fR.
.bt
\fB&if|!\fI\|\'string1\|\'string2\|\'|anything\fR	-	If \fIstring1\fR not identical to \fIstring2\fR,
accept \fIanything\fR.
.bt
\fB&ie\fI|c|anything\fR		-	\fBu\fR	If portion of if-else; all above forms (like \fBif\fR).
.bt
\fB&el\fI|anything\fR		-	-	Else portion of if-else.
.pg
The built-in condition names are:
.TS
center box;
c2|c
c2|c
c2|l.
Condition
Name	True If
_
\fBo\fR	Current page number is odd
\fBe\fR	Current page number is even
\fBt\fR	Formatter is \*(TR
\fBn\fR	Formatter is \*(NR
.TE
If the condition \fIc\fR is \fItrue\fR, or if the number \fIN\fR is greater than zero,
or if the strings compare identically (including motions and character size and font),
\fIanything\fR is accepted as input.
If a \fB!\fR precedes the condition, number, or string comparison,
the sense of the acceptance is reversed.
.pg
Any spaces between the condition and the beginning of \fIanything\fR are skipped over.
The \fIanything\fR can be either a single input line (text, macro, or whatever)
or a number of input lines.
In the multi-line case,
the first line must begin with a left delimiter \fB\e{\fR and
the last line must end with a right delimiter \fB\e}\fR.
.pg
The request \fBie\fR (if-else) is identical to \fBif\fR
except that the acceptance state is remembered.
A subsequent and matching \fBel\fR (else) request then uses the reverse sense of that state.
\fBie\fR|-|\fBel\fR pairs may be nested.
.pg
Some examples are:
.x1
.ft B
.ne 1
&if e .tl \'\|Even Page %\'\'\'
.ft R
.x2
which outputs a title if the page number is even; and
.x1
.ft B
.ne 3.1
&ie \en%>1 \e{\e
\&\'sp 0.5i
&tl \'\|Page %\'\'\'
\&\'sp ~\|1.2i|\e}
&el .sp ~\|2.5i
.ft R
.x2
which treats page 1 differently from other pages.
.mh
Environment Switching.
.pg
A number of the parameters that
control the text processing are gathered together into an
\fIenvironment\fR, which can be switched by the user.
The environment parameters are those associated
with requests noting E in their \fINotes\fR column;
in addition, partially collected lines and words are in the environment.
Everything else is global; examples are page-oriented parameters,
diversion-oriented parameters, number registers, and macro and string definitions.
All environments are initialized with default parameter values.
.h1
.bt
\fB&ev\fI|N\fR	\fIN\(eq\fR0	previous	-	Environment switched to
environment 0\(<=\fIN\fR\(<=2.
Switching is done in push-down fashion so that
restoring a previous environment \fImust\fR be done with \fB.ev\fR
rather than specific reference.
.mh
Insertions from the Standard Input
.pg
The input can be temporarily switched to the system \fIstandard input\fR
with \fBrd\fR,
which will switch back when \fItwo\fR newlines
in a row are found (the \fIextra\fR blank line is not used).
This mechanism is intended for insertions in form-letter-like documentation.
On \s-1UNIX\s+1, the \fIstandard input\fR can be the user's keyboard,
a \fIpipe\fR, or a \fIfile\fR.
.h1
.bt
\fB&rd\fI|prompt\fR	-	\fIprompt=\fR\s-1BEL\s+1		\
Read insertion from the standard input until two newlines in a row are found.
If the standard input is the user's keyboard, \fIprompt\fR (or a \s-1BEL\s+1)
is written onto the user's terminal.
\fBrd\fR behaves like a macro,
and arguments may be placed after \fIprompt\fR.
.bt
\fB&ex\fR	-	-	-	Exit from \*(NR\(sl\*(TR.
Text processing is terminated exactly as if all input had ended.
.pg
If insertions are to be
taken from the terminal keyboard \fIwhile\fR output is being printed
on the terminal, the command line option \fB\-q\fR will turn off the echoing
of keyboard input and prompt only with \s-1BEL\s+1.
The regular input and insertion input \fIcannot\fR
simultaneously come from the standard input.
.pg
As an example,
multiple copies of a form letter may be prepared by entering the insertions
for all the copies in one file to be used as the standard input,
and causing the file containing the letter to reinvoke itself using \fBnx\fR (\(sc19);
the process would ultimately be ended by an \fBex\fR in the insertion file.
.mh
Input\(slOutput File Switching
.pg
The (read-only) number register \fB.c\fR contains the input line number in
the current input file.  The number register \fBc.\fR is a general register
serving the same purpose.
.h1
.bt
\fB&so\fI|filename\fR		-	-	Switch source file.
The top input (file reading) level is switched to \fIfilename\fR.
The effect of an \fBso\fR encountered in a macro
occurs immediately.
When the new file ends,
input is again taken from the original file.
\fBso\fR's may be nested.
.bt
\fB&nx\fI|filename\fR		end-of-file	-	Next file is \fIfilename\fR.
The current file is considered ended, and the input is immediately switched
to \fIfilename\fR.
.bt
\fB&pi\fI|program\fR		-	-	Pipe output to \fIprogram\fR (\*(NR only).
This request must occur \fIbefore\fR any printing occurs.
No arguments are transmitted to \fIprogram\fR.
.mh
Miscellaneous
.pg
.h1
.bt
.mc \s12\(br\s0
\fB&mc\fI|c|N\fR	-	off	E,\fBm\fR	\
Specifies that a \fImargin\fR character \fIc\fR appear a distance
\fIN\fR to the right of the right margin
after each non-empty text line (except those produced by \fBtl\fR).
If the output line is too-long (as can happen in nofill mode)
the character will be appended to the line.
If \fIN\fR is not given, the previous \fIN\fR is used; the initial \fIN\fR is
0.2|inches in \*(NR and 1\|em in \*(TR.
The margin character used with this paragraph was a 12-point box-rule.
.br
.mc
.bt
\fB&tm\fI|string\fR	-	newline	-	\
After skipping initial blanks, \fIstring\fR (rest of the line) is read in \fIcopy mode\fR
and written on the user's terminal. (see \(sc21).
.bt
\fB&ig\fI|yy\fR	-	\fI.yy=\fB..\fR	-	Ignore \
input lines.
\fBig\fR behaves exactly like \fBde\fR (\(sc7) except that the
input is discarded.
The input is read in \fIcopy mode\fR, and any auto-incremented
registers will be affected.
.bt
\fB&pm\fI|t\fR	-	all	-	\
Print macros.
The names and sizes of all of the defined macros and strings are printed
on the user's terminal;
if \fIt\fR is given, only the total of the sizes is printed.
The sizes is given in \fIblocks\fR
of 128 characters.
.bt
\fB&ab\fI|string\fR	-	-	-	\
Print \fIstring\fR on standard error and terminate immediately.  The
default \fIstring\fR is "User Abort". Does not cause a break.  Only output
preceding the last break is written.
.bt
.lg 0
\fB&fl\fR	-	-	B	\c
.lg
Flush output buffer.
Used in interactive debugging to force output.
.mh
Output and Error Messages.
.pg
The output from \fBtm\fR, \fBpm\fR, \fBab\fR and the prompt from \fBrd\fR,
as well as various \fIerror\fR messages are written onto
\s-1UNIX\s+1's \fIstandard error\fR output.
The latter is different from the \fIstandard output\fR,
where \*(NR formatted output goes.
By default, both are written onto the user's terminal,
but they can be independently redirected.
.pg
Various \fIerror\fR conditions may occur during
the operation of \*(NR and \*(TR.
Certain less serious errors having only local impact do not
cause processing to terminate.
Two examples are \fIword overflow\fR, caused by a word that is too large
to fit into the word buffer (in fill mode), and
\fIline overflow\fR, caused by an output line that grew too large
to fit in the line buffer;
in both cases, a message is printed, the offending excess
is discarded,
and the affected word or line is marked at the point of truncation
with a \(** in \*(NR and a \(lh in \*(TR.
The philosophy is to continue processing, if possible,
on the grounds that output useful for debugging may be produced.
If a serious error occurs, processing terminates,
and an appropriate message is printed.
Examples are the inability to create, read, or write files,
and the exceeding of certain internal limits that
make future output unlikely to be useful.
.ps 10
.vs 12
.ft R
.bp
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)m5	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.ds H T
.tr |
.tr ~|
.de x1
.xx
.ft B
.in .2i
.nf
.ne 2.1
.ta 1i
..
.de x2
.fi
.in 0
.ft R
.xx
..
.br
.ce
.ft B
.rs
.sp 0.5i
TUTORIAL EXAMPLES
.ft R
.sp 2
.nr p 0
.2C
.ns
.mh
.mk
Introduction
.pg
Although \*(NR and \*(TR
have by design a syntax reminiscent
of earlier text processors*
.fn
.xx
*For example:
P.|A.|Crisman, Ed.,
.ul
The Compatible Time-Sharing System,
MIT Press, 1965, Section|AH9.01
(Description of RUNOFF program on MIT's CTSS system).
.ef
with the intent of easing their use,
it is almost always necessary to
prepare at least a small set of macro definitions
to describe most documents.
Such common formatting needs
as page margins and footnotes
are deliberately not built into \*(NR and \*(TR.
Instead,
the macro and string definition, number register, diversion,
environment switching, page-position trap, and conditional input mechanisms
provide the basis for user-defined implementations.
.pg
The examples to be discussed are intended to be useful and somewhat realistic,
but won't necessarily cover all relevant contingencies.
Explicit numerical parameters are used
in the examples
to make them easier to read and to
illustrate typical values.
In many cases, number registers would really be used
to reduce the number of places where numerical
information is kept,
and to concentrate conditional parameter initialization
like that which depends on whether \*(TR or \*(NR is being used.
.mh
Page Margins
.pg
As discussed in \(sc3,
\fIheader\fR and \fIfooter\fR macros are usually defined
to describe the top and bottom page margin areas respectively.
A trap is planted at page position 0 for the header, and at
\fI\-N\fR (\fIN\fR from the page bottom) for the footer.
The simplest such definitions might be
.x1
&de hd	\e"define header
\'sp 1i
&&	\e"end definition
&de fo	\e"define footer
\'bp
&&	\e"end definition
&wh 0 hd
&wh \-1i fo
.x2
which provide blank 1|inch top and bottom margins.
The header will occur on the \fIfirst\fR page,
only if the definition and trap exist prior to
the initial pseudo-page transition (\(sc3).
In fill mode, the output line that springs the footer trap
was typically forced out because some part or whole word didn't fit on it.
If anything in the footer and header that follows causes a \fIbreak\fR,
that word or part word will be forced out.
In this and other examples,
requests like \fBbp\fR and \fBsp\fR that normally cause breaks are invoked using
the \fIno-break\fR control character \fB\'\fR
to avoid this.
When the header\(slfooter design contains material
requiring independent text processing, the
environment may be switched, avoiding
most interaction with the running text.
.pg
A more realistic example would be
.x1
&de hd	\e"header
&if t .tl \'\|\e(rn\'\'\e(rn\'  \e"troff cut mark
&if \e\en%>1 \e{\e
\'sp ~\|0.5i\-1	\e"tl base at 0.5i
&tl \'\'\- % \-\'\'	\e"centered page number
&ps	\e"restore size
&ft	\e"restore font
&vs  \e}	\e"restore vs
\'sp ~\|1.0i  	\e"space to 1.0i
&ns	\e"turn on no-space mode
&&
&de fo	\e"footer
&ps 10	\e"set footer\(slheader size
&ft R	\e"set font
&vs 12p	\e"set base-line spacing
&if \e\en%=1 \e{\e
\'sp ~\|\e\en(.pu\-0.5i\-1  \e"tl base 0.5i up
&tl \'\'\- % \-\'\' \e}  \e"first page number
\'bp
&&
&wh 0 hd
&wh \-1i fo
.x2
which sets the size, font, and base-line spacing for the
header\(slfooter material, and ultimately restores them.
The material in this case is a page number at the bottom of the
first page and at the top of the remaining pages.
If \*(TR is used, a \fIcut mark\fR is drawn in the form
of \fIroot-en\fR's at each margin.
The \fBsp\fR's refer to absolute positions to avoid
dependence on the base-line spacing.
Another reason for this in the footer
is that the footer is invoked by printing a line whose
vertical spacing swept past the trap position by possibly
as much as the base-line spacing.
The \fIno-space\fR mode is turned on at the end of \fBhd\fR
to render ineffective
accidental occurrences of \fBsp\fR at the top of the running text.
.pg
The above method of restoring size, font, etc. presupposes
that such requests (that set \fIprevious\fR value) are \fInot\fR
used in the running text.
A better scheme is save and restore both the current \fIand\fR
previous values as shown for size in the following:
.x1
&de fo
&nr s1 \e\en(.s	\e"current size
&ps
&nr s2 \e\en(.s	\e"previous size
&  ---	\e"rest of footer
&&
&de hd
&  ---	\e"header stuff
&ps \e\en(s2	\e"restore previous size
&ps \e\en(s1	\e"restore current size
&&
.x2
Page numbers may be printed in the bottom margin
by a separate macro triggered during the footer's
page ejection:
.x1
&de bn	\e"bottom number
&tl \'\'\- % \-\'\'	\e"centered page number
&&
&wh \-0.5i\-1v bn	 \e"tl base 0.5i up
.x2
.mh
Paragraphs and Headings
.pg
The housekeeping
associated with starting a new paragraph should be collected
in a paragraph macro
that, for example,
does the desired preparagraph spacing,
forces the correct font, size, base-line spacing, and indent,
checks that enough space remains for \fImore than one\fR line,
and
requests a temporary indent.
.x1
&de pg	\e"paragraph
&br	\e"break
&ft R	\e"force font,
&ps 10	\e"size,
&vs 12p	\e"spacing,
&in 0	\e"and indent
&sp 0.4	\e"prespace
&ne 1+\e\en(.Vu	\e"want more than 1 line
&ti 0.2i	\e"temp indent
&&
.x2
The first break in \fBpg\fR
will force out any previous partial lines,
and must occur before the \fBvs\fR.
The forcing of font, etc. is
partly a defense against prior error and
partly to permit
things like section heading macros to
set parameters only once.
The prespacing parameter is suitable for \*(TR;
a larger space, at least as big as the output device vertical resolution, would be
more suitable in \*(NR.
The choice of remaining space to test for in the \fBne\fR
is the smallest amount greater than one line
(the \fB.V\fR is the available vertical resolution).
.pg
A macro to automatically number section headings
might look like:
.x1
&de sc	\e"section
&  ---	\e"force font, etc.
&sp 0.4	\e"prespace
&ne 2.4+\e\en(.Vu \e"want 2.4+ lines
.lg 0
&fi
.lg
\e\en+S.
&&
&nr S 0 1	\e"init S
.x2
The usage is \fB.sc\fR,
followed by the section heading text,
followed by \fB.pg\fR.
The \fBne\fR test value includes one line of heading,
0.4 line in the following \fBpg\fR, and
one line of the paragraph text.
A word consisting of the next section number and a period is
produced to begin the heading line.
The format of the number may be set by \fBaf\fR (\(sc8).
.pg
Another common form is the labeled, indented paragraph,
where the label protrudes left into the indent space.
.x1
&de lp	\e"labeled paragraph
&pg
&in 0.5i	\e"paragraph indent
&ta 0.2i 0.5i	\e"label, paragraph
&ti 0
\et\e\e$1\et\ec	\e"flow into paragraph
&&
.x2
The intended usage is "\fB.lp\fR \fIlabel\fR\|";
\fIlabel\fR will begin at 0.2\|inch, and
cannot exceed a length of 0.3\|inch without intruding into
the paragraph.
The label could be right adjusted against 0.4\|inch by
setting the tabs instead with \fB.ta|0.4iR|0.5i\fR.
The last line of \fBlp\fR ends with \fB\ec\fR so that
it will become a part of the first line of the text
that follows.
.mh
Multiple Column Output
.pg
The production of multiple column pages requires
the footer macro to decide whether it was
invoked by other than the last column,
so that it will begin a new column rather than
produce the bottom margin.
The header can initialize a column register that
the footer will increment and test.
The following is arranged for two columns, but
is easily modified for more.
.x1
&de hd	\e"header
&  ---
&nr cl 0 1	\e"init column count
&mk	\e"mark top of text
&&
&de fo	\e"footer
&ie \e\en+(cl<2 \e{\e
&po +3.4i	\e"next column; 3.1+0.3
&rt	\e"back to mark
&ns \e}	\e"no-space mode
&el \e{\e
&po \e\enMu	\e"restore left margin
&  ---
\'bp \e}
&&
&ll 3.1i	\e"column width
&nr M \e\en(.o	\e"save left margin
.x2
Typically a portion of the top of the first page
contains full width text;
the request for the narrower line length,
as well as another \fB.mk\fR would
be made where the two column output was to begin.
.mh
Footnote Processing
.pg
The footnote mechanism to be described is used by
imbedding the footnotes in the input text at the
point of reference,
demarcated by an initial \fB.fn\fR and a terminal \fB.ef\fR:
.x1
&fn
\fIFootnote text and control lines...\fP
&ef
.x2
In the following,
footnotes are processed in a separate environment and diverted
for later printing in the space immediately prior to the bottom
margin.
There is provision for the case where the last collected
footnote doesn't completely fit in the available space.
.x1
&de hd	\e"header
&  ---
&nr x 0 1	\e"init footnote count
&nr y 0\-\e\enb	\e"current footer place
&ch fo \-\e\enbu	\e"reset footer trap
&if \e\en(dn .fz	\e"leftover footnote
&&
&de fo	\e"footer
&nr dn 0	\e"zero last diversion size
&if \e\enx \e{\e
&ev 1	\e"expand footnotes in ev1
&nf	\e"retain vertical size
&FN	\e"footnotes
&rm FN	\e"delete it
&if "\e\en(.z"fy" .di	 \e"end overflow diversion
&nr x 0	\e"disable fx
&ev  \e}	\e"pop environment
&  ---
\'bp
&&
&de fx	\e"process footnote overflow
&if \e\enx .di fy	\e"divert overflow
&&
&de fn	\e"start footnote
&da FN	\e"divert (append) footnote
&ev 1	\e"in environment 1
&if \e\en+x=1 .fs	 \e"if first, include separator
.lg 0
&fi	\e"fill mode
.lg
&&
&de ef	\e"end footnote
&br	\e"finish output
&nr z \e\en(.v	\e"save spacing
&ev	\e"pop ev
&di	\e"end diversion
&nr y \-\e\en(dn	\e"new footer position,
&if \e\enx=1 .nr y \-(\e\en(.v\-\e\enz) \e
	\e"uncertainty correction
&ch fo \e\enyu	\e"y is negative
&if (\|\e\en(nl+1v)>(\|\e\en(.p+\e\eny) \e
&ch fo \e\en(nlu+1v	 \e"it didn't fit
&&
&de fs	\e"separator
\el\'\|1i\'	\e"1 inch rule
&br
&&
&de fz	\e"get leftover footnote
&fn
&nf	\e"retain vertical size
&fy	\e"where fx put it
&ef
&&
&nr b 1.0i	\e"bottom margin size
&wh 0 hd	\e"header trap
&wh 12i fo	\e"footer trap, temp position
&wh \-\e\enbu fx	\e"fx at footer position
&ch fo \-\e\enbu	\e"conceal fx with fo
.x2
The header \fBhd\fR initializes a footnote count register \fBx\fR,
and sets both the current footer trap position register \fBy\fR and
the footer trap itself to a nominal position specified in
register \fBb\fR.
In addition, if the register \fBdn\fR indicates a leftover footnote,
\fBfz\fR is invoked to reprocess it.
The footnote start macro \fBfn\fR begins a diversion (append) in environment 1,
and increments the count \fBx\fR; if the count is one, the footnote separator \fBfs\fR
is interpolated.
The separator is kept in a separate macro to permit user redefinition.
The footnote end macro \fBef\fR restores
the previous environment and ends the diversion after saving the spacing size in register \fBz\fR.
\fBy\fR is then decremented by the size of the footnote, available in \fBdn\fR;
then on the first footnote, \fBy\fR is further decremented by the difference
in vertical base-line spacings of the two environments, to
prevent the late triggering the footer trap from causing the last
line of the combined footnotes to overflow.
The footer trap is then set to the lower (on the page) of \fBy\fR or the current page position (\fBnl\fR)
plus one line, to allow for printing the reference line.
If indicated by \fBx\fR, the footer \fBfo\fR rereads the footnotes from \fBFN\fR in nofill mode
in environment 1,
and deletes \fBFN\fR.
If the footnotes were too large to fit, the macro \fBfx\fR will be trap-invoked to redivert
the overflow into \fBfy\fR,
and the register \fBdn\fR will later indicate to the header whether \fBfy\fR is empty.
Both \fBfo\fR and \fBfx\fR are planted in the nominal footer trap position in an order
that causes \fBfx\fR to be concealed unless the \fBfo\fR trap is moved.
The footer then terminates the overflow diversion, if necessary, and
zeros \fBx\fR to disable \fBfx\fR,
because the uncertainty correction
together with a not-too-late triggering of the footer can result
in the footnote rereading finishing before reaching the \fBfx\fR trap.
.pg
A good exercise for the student is to combine the multiple-column and footnote mechanisms.
.mh
The Last Page
.pg
After the last input file has ended, \*(NR and \*(TR
invoke the \fIend macro\fR (\(sc7), if any,
and when it finishes, eject the remainder of the page.
During the eject, any traps encountered are processed normally.
At the \fIend\fR of this last page, processing terminates
\fIunless\fR a partial line, word, or partial word remains.
If it is desired that another page be started, the end-macro
.x1
&de en	\e"end-macro
\ec
\'bp
&&
&em en
.x2
will deposit a null partial word,
and effect another last page.
.1C
'bp
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\"
.\"	@(#)table1	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.pn 30
.rm mx
.br
.tr &&
.tr ||
.tr ~~
.de aa
.nf
abcdefghijklmnopqrstuvwxyz
ABCDEFGHIJKLMNOPQRSTUVWXYZ
1234567890
.ss 9
! $ % & ( ) ` ' * + \- . , / : ; = ? [ ] |
.fi
\(bu \(sq \(em \(hy \(ru \(14 \(12 \(34 \(fi \(fl \(ff
\(Fi \(Fl
\(de \(dg \(fm
\(ct \(rg \(co
.ss 12
..
.de bb
.ss 9
.fi
.ll 5i
" \' \e ^ \_ \` ~ \(sl < > { } # @ \(pl \(mi \(eq \(**
.br
\(*a \(*b \(*g \(*d \(*e \(*z \(*y \(*h \(*i \(*k \(*l \(*m
\(*n \(*c \(*o \(*p \(*r \(*s \(ts \(*t \(*u \(*f \(*x \(*q \(*w
.br
\(*G \(*D \(*H \(*L \(*C \(*P \(*S \(*U \(*F \(*Q \(*W
.br
\(sr \(rn \(>= \(<= \(== \(ap \(~= \(!=
\(-> \(<- \(ua \(da \(mu
\(di \(+- \(cu \(ca \(sb \(sp \(ib \(ip \(if \(pd
.br
\(sc \(gr \(no \(is \(pt \(es \(mo
\(dd \(rh \(lh \(or \(ci
\(lt \(lb \(rt \(rb \(lk \(rk \(bv \(lf \(rf \(lc \(rc
\(br
.br
.ss 12
.nf
..
.nf
.ps 12
.vs 14p
.ft B
.ce
.sp 3
Table I
.sp
.ce
Font Style Examples
.sp .5i
.ft R
.ps 10
.fi
.vs 12p
.na
The following fonts are printed in 12-point, with a vertical spacing of 14-point,
and with
non-alphanumeric characters separated by \(14\|em space (all measurements
on 8.5 \(mu 11 inch paper prior to photoreduction).
This font sample is printed on an Apple Laserwriter
at University of California, Berkeley.
.sp .5i
.ps 12
.vs 14p
.ft R
Times Roman
.sp .5
.aa
.sp
.ft I
Times Italic
.sp .5
.aa
.sp
.ft B
Times Bold
.sp .5
.aa
.sp
.ft R
Special Mathematical Font
.sp .5
.fi
.ll 5i
.bb
.bp
.\" Copyright (C) Caldera International Inc. 2001-2002.  All rights reserved.
.\" 
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions are
.\" met:
.\" 
.\" Redistributions of source code and documentation must retain the above
.\" copyright notice, this list of conditions and the following
.\" disclaimer.
.\" 
.\" Redistributions in binary form must reproduce the above copyright
.\" notice, this list of conditions and the following disclaimer in the
.\" documentation and/or other materials provided with the distribution.
.\" 
.\" All advertising materials mentioning features or use of this software
.\" must display the following acknowledgement:
.\" 
.\" This product includes software developed or owned by Caldera
.\" International, Inc.  Neither the name of Caldera International, Inc.
.\" nor the names of other contributors may be used to endorse or promote
.\" products derived from this software without specific prior written
.\" permission.
.\" 
.\" USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
.\" INTERNATIONAL, INC.  AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR
.\" IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
.\" WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
.\" DISCLAIMED.  IN NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE
.\" FOR ANY DIRECT, INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR
.\" CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
.\" SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
.\" BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
.\" WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
.\" OR OTHERWISE) RISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
.\" IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
.\" 
.\"	@(#)table2	8.1 (Berkeley) 8/14/93
.\"
.\" $FreeBSD$
.sp 100
.br
.de mx
.nf
.ft I
.ta .25iC .5i +.45i 3.25iC +.25i +.45i
		Input	Character		Input	Character
	Char	Name	Name	Char	Name	Name
.ft R
.sp .2
.nr cl 0
.mk
..
.br
.tr ~~
.nf
.ps 12
.vs 14p
.ft B
.ce
Table II
.sp
.ce 2
Input Naming Conventions for \', \`, and  \-
and for Non-ASCII Special Characters
.sp .5i
.ft R
.ps 10
.vs 12p
.ft B
.bd I 3
Non-\s-1ASCII\s+1 characters and \fIminus\fP on the standard fonts.
.sp
.ft R
.de cl
.ie \\n+(cl<2 \{\
.po +3.0i
.rt
.\}
.el .sc
..
.de sc
.po 26i/27u
.nr cl 0
..
.nr cl 0 1
.de qq
	\&'	\'	close quote
	`	\`	open quote
	\(em	\e\|(em	3\(sl4 Em dash
	-	\-	hyphen or
	\(hy	\e\|(hy	hyphen
	\-	\e\-	current font minus
	\(bu	\e\|(bu	bullet
	\(sq	\e\|(sq	square
	\(ru	\e\|(ru	rule
	\(14	\e\|(14	1\(sl4
	\(12	\e\|(12	1\(sl2
	\(34	\e\|(34	3\(sl4
	\(fi	\e\|(fi	fi
	\(fl	\e\|(fl	fl
	\(ff	\e\|(ff	ff
	\(Fi	\e\|(Fi	ffi
	\(Fl	\e\|(Fl	ffl
	\(de	\e\|(de	degree
	\(dg	\e\|(dg	dagger
	\(fm	\e\|(fm	foot mark
	\(ct	\e\|(ct	cent sign
	\(rg	\e\|(rg	registered
	\(co	\e\|(co	copyright
..
.di zz
.lg 0
.qq
.di
.lg
.mx
.nr aa \n(dn/2
.ne \n(aau+1
.nr bb \n(nl+\n(aa
.wh \n(bbu cl
.qq
.sp |\n(bbu
.ch cl 12i
.fi
.sp 2
.ft B
.bd I
Non-\s-1ASCII\s+1 characters and \', \`, \_\|, \(pl, \(mi, \(eq, and \(** on the special font.
.sp .4
.ft R
.fi
.ps 10
The ASCII characters @, #, ", \', \`, <, >, \\, {, }, ~, ^, and \(ul exist
\fIonly\fR on the special font and are printed as a 1-em space if that font
is not mounted.
The following characters exist only on the special font except
for the upper case Greek letter names followed by \(dg which are mapped into
upper case English letters in
whatever font is mounted on font position one (default Times Roman).
The special math plus, minus, and equals are provided to
insulate the appearance of equations from the choice of standard fonts.
.bd I 3
.nf
.ps 10
.sp
.ch cl \nmu-\n(.vu-1u
.mx
.lg 0
	\(pl	\e\|(pl	math plus
	\(mi	\e\|(mi	math minus
	\(eq	\e\|(eq	math equals
	\(**	\e\|(**	math star
	\(sc	\e\|(sc	section
	\(aa	\e\|(aa	acute accent
	\(ga	\e\|(ga	grave accent
	\(ul	\e\|(ul	underrule
	\(sl	\e\|(sl	slash (matching backslash)
	\(*a	\e\|(*a	alpha
	\(*b	\e\|(*b	beta
	\(*g	\e\|(*g	gamma
	\(*d	\e\|(*d	delta
	\(*e	\e\|(*e	epsilon
	\(*z	\e\|(*z	zeta
	\(*y	\e\|(*y	eta
	\(*h	\e\|(*h	theta
	\(*i	\e\|(*i	iota
	\(*k	\e\|(*k	kappa
	\(*l	\e\|(*l	lambda
	\(*m	\e\|(*m	mu
	\(*n	\e\|(*n	nu
	\(*c	\e\|(*c	xi
	\(*o	\e\|(*o	omicron
	\(*p	\e\|(*p	pi
	\(*r	\e\|(*r	rho
	\(*s	\e\|(*s	sigma
	\(ts	\e\|(ts	terminal sigma
	\(*t	\e\|(*t	tau
	\(*u	\e\|(*u	upsilon
	\(*f	\e\|(*f	phi
	\(*x	\e\|(*x	chi
	\(*q	\e\|(*q	psi
	\(*w	\e\|(*w	omega
	\(*A	\e\|(*A	Alpha\(dg
	\(*B	\e\|(*B	Beta\(dg
	\(*G	\e\|(*G	Gamma
	\(*D	\e\|(*D	Delta
	\(*E	\e\|(*E	Epsilon\(dg
	\(*Z	\e\|(*Z	Zeta\(dg
	\(*Y	\e\|(*Y	Eta\(dg
	\(*H	\e\|(*H	Theta
	\(*I	\e\|(*I	Iota\(dg
	\(*K	\e\|(*K	Kappa\(dg
	\(*L	\e\|(*L	Lambda
	\(*M	\e\|(*M	Mu\(dg
	\(*N	\e\|(*N	Nu\(dg
	\(*C	\e\|(*C	Xi
	\(*O	\e\|(*O	Omicron\(dg
	\(*P	\e\|(*P	Pi
	\(*R	\e\|(*R	Rho\(dg
	\(*S	\e\|(*S	Sigma
	\(*T	\e\|(*T	Tau\(dg
	\(*U	\e\|(*U	Upsilon
	\(*F	\e\|(*F	Phi
	\(*X	\e\|(*X	Chi\(dg
	\(*Q	\e\|(*Q	Psi
	\(*W	\e\|(*W	Omega
	\(sr	\e\|(sr	square root
	\(rn	\e\|(rn	root en extender
	\(>=	\e\|(>=	>=
	\(<=	\e\|(<=	<=
	\(==	\e\|(==	identically equal
	\(~=	\e\|(~=	approx =
	\(ap	\e\|(ap	approximates
	\(!=	\e\|(!=	not equal
	\(->	\e\|(\(mi>	right arrow
	\(<-	\e\|(<\(mi	left arrow
	\(ua	\e\|(ua	up arrow
	\(da	\e\|(da	down arrow
	\(mu	\e\|(mu	multiply
	\(di	\e\|(di	divide
	\(+-	\e\|(+\(mi	plus-minus
	\(cu	\e\|(cu	cup (union)
	\(ca	\e\|(ca	cap (intersection)
	\(sb	\e\|(sb	subset of
	\(sp	\e\|(sp	superset of
	\(ib	\e\|(ib	improper subset
	\(ip	\e\|(ip	improper superset
	\(if	\e\|(if	infinity
	\(pd	\e\|(pd	partial derivative
	\(gr	\e\|(gr	gradient
	\(no	\e\|(no	not
	\(is	\e\|(is	integral sign
	\(pt	\e\|(pt	proportional to
	\(es	\e\|(es	empty set
	\(mo	\e\|(mo	member of
	\(br	\e\|(br	box vertical rule
	\(dd	\e\|(dd	double dagger
	\(rh	\e\|(rh	right hand
	\(lh	\e\|(lh	left hand
	\(or	\e\|(or	or
	\(ci	\e\|(ci	circle
	\(lt	\e\|(lt	left top of big curly bracket
	\(lb	\e\|(lb	left bottom
	\(rt	\e\|(rt	right top
	\(rb	\e\|(rb	right bot
	\(lk	\e\|(lk	left center of big curly bracket
	\(rk	\e\|(rk	right center of big curly bracket
	\(bv	\e\|(bv	bold vertical
	\(lf	\e\|(lf	left floor (left bottom of big
			square bracket)
	\(rf	\e\|(rf	right floor (right bottom)
	\(lc	\e\|(lc	left ceiling (left top)
	\(rc	\e\|(rc	right ceiling (right top)
