.\" Copyright (c) 1980, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	@(#)vi.in	8.5 (Berkeley) 8/18/96
.\"
.nr LL 6.5i
.nr FL 6.5i
.EH 'USD:11-%''An Introduction to Display Editing with Vi'
.OH 'An Introduction to Display Editing with Vi''USD:11-%'
.bd S 3
.if t .ds dg \(dg
.if n .ds dg +
.if t .ds dd \(dd
.if n .ds dd ++
.\".RP
.TL
An Introduction to Display Editing with Vi
.AU
William Joy
.AU
Mark Horton
.AI
Computer Science Division
Department of Electrical Engineering and Computer Science
University of California, Berkeley
Berkeley, Ca.  94720
.AB
.PP
.I Vi
(visual) is a display oriented interactive text editor.
When using
.I vi
the screen of your terminal acts as a window into the file which you
are editing.  Changes which you make to the file are reflected
in what you see.
.PP
Using
.I vi
you can insert new text any place in the file quite easily.
Most of the commands to
.I vi
move the cursor around in the file.
There are commands to move the cursor
forward and backward in units of characters, words,
sentences and paragraphs.
A small set of operators, like
.B d
for delete and
.B c
for change, are combined with the motion commands to form operations
such as delete word or change paragraph, in a simple and natural way.
This regularity and the mnemonic assignment of commands to keys makes the
editor command set easy to remember and to use.
.PP
.I Vi
will work on a large number of display terminals,
and new terminals are easily driven after editing a terminal description file.
While it is advantageous to have an intelligent terminal which can locally
insert and delete lines and characters from the display, the editor will
function quite well on dumb terminals over slow phone lines.
The editor makes allowance for the low bandwidth in these situations
and uses smaller window sizes and
different display updating algorithms to make best use of the
limited speed available.
.PP
It is also possible to use the command set of
.I vi
on hardcopy terminals, storage tubes and ``glass tty's'' using a one line
editing window; thus
.I vi's
command set is available on all terminals.
The full command set of the more traditional, line
oriented editor
.I ex
is available within
.I vi;
it is quite simple to switch between the two modes of editing.
.AE
.NH 1
Getting started
.PP
.FS
The financial support of an \s-2IBM\s0 Graduate Fellowship and the
National Science Foundation under grants MCS74-07644-A03 and MCS78-07291
is gratefully acknowledged.
.FE
This document provides a quick introduction to
.I vi.
(Pronounced \fIvee-eye\fP.)
You should be running
.I vi
on a file you are familiar with while you are reading this.
The first part of this document (sections 1 through 5)
describes the basics of using
.I vi.
Some topics of special interest are presented in section 6, and 
some nitty-gritty details of how the editor functions are saved for section
7 to avoid cluttering the presentation here.
.PP
There is also a short appendix here, which gives for each character the
special meanings which this character has in \fIvi\fR.  Attached to
this document should be a quick reference card.
This card summarizes the commands of
.I vi
in a very compact format.  You should have the card handy while you are
learning
.I vi.
.NH 2
Specifying terminal type
.PP
Before you can start
.I vi
you must tell the system what kind of terminal you are using.
Here is a (necessarily incomplete) list of terminal type codes.
If your terminal does not appear here, you should consult with one of
the staff members on your system to find out the code for your terminal.
If your terminal does not have a code, one can be assigned and a description
for the terminal can be created.
.LP
.TS
center;
ab ab ab
a a a.
Code	Full name	Type
_
2621	Hewlett-Packard 2621A/P	Intelligent
2645	Hewlett-Packard 264x	Intelligent
act4	Microterm ACT-IV	Dumb
act5	Microterm ACT-V	Dumb
adm3a	Lear Siegler ADM-3a	Dumb
adm31	Lear Siegler ADM-31	Intelligent
c100	Human Design Concept 100	Intelligent
dm1520	Datamedia 1520	Dumb
dm2500	Datamedia 2500	Intelligent
dm3025	Datamedia 3025	Intelligent
fox	Perkin-Elmer Fox	Dumb
h1500	Hazeltine 1500	Intelligent
h19	Heathkit h19	Intelligent
i100	Infoton 100	Intelligent
mime	Imitating a smart act4	Intelligent
t1061	Teleray 1061	Intelligent
vt52	Dec VT-52	Dumb
.TE
.PP
Suppose for example that you have a Hewlett-Packard HP2621A
terminal.  The code used by the system for this terminal is `2621'.
In this case you can use one of the following commands to tell the system
the type of your terminal:
.DS
% \fBsetenv TERM\fP 2621
.DE
This command works with the
.I csh
shell.
If you are using the standard Bourne shell
.I sh
then you should give the commands
.DS
$ \fBTERM=\fP2621
$ \fBexport TERM\fP
.DE
.PP
If you want to arrange to have your terminal type set up automatically
when you log in, you can use the
.I tset
program.
If you dial in on a
.I mime ,
but often use hardwired ports, a typical line for your
.I .login
file (if you use csh) would be
.DS
\fBsetenv TERM \(gatset\fP \- \-d mime\(ga
.DE
or for your
.I .profile
file (if you use sh)
.DS
\fBTERM=\(gatse\fPt \- \-d mime\(ga
.DE
.I Tset
knows which terminals are hardwired to each port
and needs only to be told that when you dial in you
are probably on a
.I mime .
.I Tset
is usually used to change the erase and kill characters, too.
.NH 2
Editing a file
.PP
After telling the system which kind of terminal you have, you should
make a copy of a file you are familiar with, and run
.I vi
on this file, giving the command
.DS
% \fBvi\fR \fIname\fR
.DE
replacing \fIname\fR with the name of the copy file you just created.
The screen should clear and the text of your file should appear on the
screen.  If something else happens refer to the footnote.\*(dd
.FS
\*(dd If you gave the system an incorrect terminal type code then the
editor may have just made a mess out of your screen.  This happens when
it sends control codes for one kind of terminal to some other
kind of terminal.  In this case hit
the keys \fB:q\fR (colon and the q key) and then hit the \s-2RETURN\s0 key.
This should get you back to the command level interpreter.
Figure out what you did wrong (ask someone else if necessary) and try again.
     Another thing which can go wrong is that you typed the wrong file name and
the editor just printed an error diagnostic.  In this case you should
follow the above procedure for getting out of the editor, and try again
this time spelling the file name correctly.
     If the editor doesn't seem to respond to the commands which you type
here, try sending an interrupt to it by hitting the \s-2DEL\s0 or \s-2RUB\s0
key on your terminal, and then hitting the \fB:q\fR command again followed
by a carriage return.
.sp
.FE
.NH 2
The editor's copy: the buffer
.PP
The editor does not directly modify the file which you are editing. 
Rather, the editor makes a copy of this file, in a place called the
.I buffer,
and remembers the file's
name.  You do not affect the contents of the file unless and until you
write the changes you make back into the original file.
.NH 2
Notational conventions
.PP
In our examples, input which must be typed as is will be presented in
\fBbold face\fR. Text which should be replaced with appropriate input
will be given in \fIitalics\fR.  We will represent special characters
in \s-2SMALL CAPITALS\s0.
.NH 2
Arrow keys
.PP
The editor command set is independent of the terminal
you are using.  On most terminals with cursor positioning keys, these keys
will also work within the editor.
If you don't have cursor positioning keys, or even if you do, you can use
the \fBh j k\fR and \fBl\fR keys as cursor positioning
keys (these are labelled with arrows on an
.I adm3a).*
.PP
(Particular note for the HP2621: on this terminal the function keys
must be \fIshifted\fR (ick) to send to the machine, otherwise they
only act locally.  Unshifted use will leave the cursor positioned
incorrectly.)
.FS
* As we will see later,
.I h
moves back to the left (like control-h which is a backspace),
.I j
moves down (in the same column),
.I k
moves up (in the same column),
and
.I l
moves to the right.
.FE
.NH 2
Special characters: \s-2ESC\s0, \s-2CR\s0 and \s-2DEL\s0
.PP
Several of these special characters are very important, so be sure to
find them right now.  Look on your keyboard for a key labelled \s-2ESC\s0
or \s-2ALT\s0.  It should be near the upper left corner of your terminal.
Try hitting this key a few times.  The editor will ring the bell
to indicate that it is in a quiescent state.\*(dd
.FS
\*(dd On smart terminals where it is possible, the editor will quietly
flash the screen rather than ringing the bell.
.FE
Partially formed commands are cancelled by \s-2ESC\s0, and when you insert
text in the file you end the text insertion
with \s-2ESC\s0.  This key is a fairly
harmless one to hit, so you can just hit it if you don't know
what is going on until the editor rings the bell.
.PP
The \s-2CR\s0 or \s-2RETURN\s0 key is important because it is used
to terminate certain commands.
It is usually at the right side of the keyboard,
and is the same command used at the end of each shell command.
.PP
Another very useful key is the \s-2DEL\s0 or \s-2RUB\s0 key, which generates
an interrupt, telling the editor to stop what it is doing.
It is a forceful way of making the editor listen
to you, or to return it to the quiescent state if you don't know or don't
like what is going on.  Try hitting the `/' key on your terminal.  This
key is used when you want to specify a string to be searched for.  The
cursor should now be positioned at the bottom line of the terminal after
a `/' printed as a prompt.  You can get the cursor back to the current
position by hitting the \s-2DEL\s0 or \s-2RUB\s0 key; try this now.*
.FS
* Backspacing over the `/' will also cancel the search.
.FE
From now on we will simply refer to hitting the \s-2DEL\s0 or \s-2RUB\s0
key as ``sending an interrupt.''**
.FS
** On some systems, this interruptibility comes at a price: you cannot type
ahead when the editor is computing with the cursor on the bottom line.
.FE
.PP
The editor often echoes your commands on the last line of the terminal.
If the cursor is on the first position of this last line, then the editor
is performing a computation, such as computing a new position in the
file after a search or running a command to reformat part of the buffer.
When this is happening you can stop the editor by
sending an interrupt.
.NH 2
Getting out of the editor
.PP
After you have worked with this introduction for a while, and you wish
to do something else, you can give the command \fBZZ\fP
to the editor.
This will write the contents of the editor's buffer back into
the file you are editing, if you made any changes, and then quit from
the editor.  You can also end an editor
session by giving the command \fB:q!\fR\s-2CR\s0;\*(dg
.FS
\*(dg All commands which read from the last display line can also be
terminated with a \s-2ESC\s0 as well as an \s-2CR\s0.
.FE
this is a dangerous but occasionally essential
command which ends the editor session and discards all your changes.
You need to know about this command in case you change the editor's
copy of a file you wish only to look at.  Be very careful
not to give this command when you really want to save
the changes you have made.
.NH 1
Moving around in the file
.NH 2
Scrolling and paging
.PP
The editor has a number of commands for moving around in the file.
The most useful of these is generated by hitting the control and D keys
at the same time, a control-D or `^D'.  We will use this two character
notation for referring to these control keys from now on.  You may have
a key labelled `^' on your terminal.  This key will be represented as `\(ua'
in this document; `^' is exclusively used as part of the `^x' notation
for control characters.\*(dd
.FS
\*(dd If you don't have a `^' key on your terminal
then there is probably a key labelled `\(ua'; in any case these characters
are one and the same.
.FE
.PP
As you know now if you tried hitting \fB^D\fR, this command scrolls down in
the file.  The \fBD\fR thus stands for down.  Many editor commands are mnemonic
and this makes them much easier to remember.  For instance the command
to scroll up is \fB^U\fR.  Many dumb terminals can't scroll up at all, in which
case hitting \fB^U\fR clears the screen and refreshes it
with a line which is farther back in the file at the top.
.PP
If you want to see more of the file below where you are, you can
hit \fB^E\fR to expose one more line at the bottom of the screen,
leaving the cursor where it is.
The command \fB^Y\fR (which is hopelessly non-mnemonic, but next to \fB^U\fR
on the keyboard) exposes one more line at the top of the screen.
.PP
There are other ways to move around in the file; the keys \fB^F\fR and \fB^B\fR
move forward and backward a page,
keeping a couple of lines of continuity between screens
so that it is possible to read through a file using these rather than
\fB^D\fR and \fB^U\fR if you wish.
.PP
Notice the difference between scrolling and paging.  If you are trying
to read the text in a file, hitting \fB^F\fR to move forward a page
will leave you only a little context to look back at.  Scrolling on the
other hand leaves more context, and happens more smoothly.  You can continue
to read the text as scrolling is taking place.
.NH 2
Searching, goto, and previous context
.PP
Another way to position yourself in the file is by giving the editor a string
to search for.  Type the character \fB/\fR followed by a string of characters
terminated by \s-2CR\s0.  The editor will position the cursor
at the next occurrence of this string.
Try hitting \fBn\fR to then go to the next occurrence of this string.
The character \fB?\fR will search backwards from where you are, and is
otherwise like \fB/\fR.\*(dg
.FS
\*(dg These searches will normally wrap around the end of the file, and thus
find the string even if it is not on a line in the direction you search
provided it is anywhere else in the file.  You can disable this wraparound
in scans by giving the command \fB:se nowrapscan\fR\s-2CR\s0,
or more briefly \fB:se nows\fR\s-2CR\s0.
.FE
.PP
If the search string you give the editor is not present in the
file the editor will print
a diagnostic on the last line of the screen, and the cursor will be returned
to its initial position.
.PP
If you wish the search to match only at the beginning of a line, begin
the search string with an \fB\(ua\fR.  To match only at the end of
a line, end the search string with a \fB$\fR.
Thus \fB/\(uasearch\fR\s-2CR\s0 will search for the word `search' at
the beginning of a line, and \fB/last$\fR\s-2CR\s0 searches for the
word `last' at the end of a line.*
.FS
*Actually, the string you give to search for here can be a
.I "regular expression"
in the sense of the editors
.I ex (1)
and
.I ed (1).
If you don't wish to learn about this yet, you can disable this more
general facility by doing
\fB:se\ nomagic\fR\s-2CR\s0;
by putting this command in
EXINIT
in your environment, you can have this always be in effect (more
about
.I EXINIT
later.)
.FE
.PP
The command \fBG\fR, when preceded by a number will position the cursor
at that line in the file.
Thus \fB1G\fR will move the cursor to
the first line of the file.  If you give \fBG\fR no count, then it moves
to the end of the file.
.PP
If you are near the end of the file, and the last line is not at the bottom
of the screen, the editor will place only the character `~' on each remaining
line.  This indicates that the last line in the file is on the screen;
that is, the `~' lines are past the end of the file.
.PP
You can find out the state of the file you are editing by typing a \fB^G\fR.
The editor will show you the name of the file you are editing, the number
of the current line, the number of lines in the buffer, and the percentage
of the way through the buffer which you are.
Try doing this now, and remember the number of the line you are on.
Give a \fBG\fR command to get to the end and then another \fBG\fR command
to get back where you were.
.PP
You can also get back to a previous position by using the command
\fB\(ga\(ga\fR (two back quotes).
This is often more convenient than \fBG\fR because it requires no advance
preparation.
Try giving a \fBG\fR or a search with \fB/\fR or \fB?\fR and then a
\fB\(ga\(ga\fR to get back to where you were.  If you accidentally hit
\fBn\fR or any command which moves you far away from a context of interest, you
can quickly get back by hitting \fB\(ga\(ga\fR.
.NH 2
Moving around on the screen
.PP
Now try just moving the cursor around on the screen.
If your terminal has arrow keys (4 or 5 keys with arrows
going in each direction) try them and convince yourself
that they work.
If you don't have working arrow keys, you can always use
.B h ,
.B j ,
.B k ,
and
.B l .
Experienced users of
.I vi
prefer these keys to arrow keys,
because they are usually right underneath their fingers.
.PP
Hit the \fB+\fR key.  Each time you do, notice that the cursor
advances to the next line in the file, at the first non-white position
on the line.  The \fB\-\fR key is like \fB+\fR but goes the other way.
.PP
These are very common keys for moving up and down lines in the file.
Notice that if you go off the bottom or top with these keys then the
screen will scroll down (and up if possible) to bring a line at a time
into view.  The \s-2RETURN\s0 key has the same effect as the \fB+\fR
key.
.PP
.I Vi
also has commands to take you to the top, middle and bottom of the screen.
\fBH\fR will take you to the top (home) line on the screen.
Try preceding it with a
number as in \fB3H\fR.
This will take you to the third line on the screen.
Many
.I vi
commands take preceding numbers and do interesting things with them.
Try \fBM\fR,
which takes you to the middle line on the screen,
and \fBL\fR,
which takes you to the last line on the screen.
\fBL\fR also takes counts, thus
\fB5L\fR will take you to the fifth line from the bottom.
.NH 2
Moving within a line
.PP
Now try picking a word on some line on the screen, not the
first word on the line.
move the cursor using \s-2RETURN\s0 and \fB\-\fR to be on the line where
the word is.
Try hitting the \fBw\fR key.  This will advance the cursor to the
next word on the line.
Try hitting the \fBb\fR key to back up words
in the line.
Also try the \fBe\fR key which advances you to the end of the current
word rather than to the beginning of the next word.
Also try \s-2SPACE\s0 (the space bar) which moves right one character
and the \s-2BS\s0 (backspace or \fB^H\fR) key which moves left one character.
The key \fBh\fR works as \fB^H\fR does and is useful if you don't have
a \s-2BS\s0 key.
(Also, as noted just above, \fBl\fR will move to the right.)
.PP
If the line had punctuation in it you may have noticed that
that the \fBw\fR and \fBb\fR
keys stopped at each group of punctuation.  You can also go back and
forwards words without stopping at punctuation by using \fBW\fR and \fBB\fR
rather than the lower case equivalents.  Think of these as bigger words.
Try these on a few lines with punctuation to see how they differ from
the lower case \fBw\fR and \fBb\fR.
.PP
The word keys wrap around the end of line,
rather than stopping at the end.  Try moving to a word on a line below
where you are by repeatedly hitting \fBw\fR.
.NH 2
Summary
.IP
.TS
lw(.50i)b a.
\fR\s-2SPACE\s0\fP	advance the cursor one position
^B	backwards to previous page
^D	scrolls down in the file
^E	exposes another line at the bottom
^F	forward to next page
^G	tell what is going on
^H	backspace the cursor
^N	next line, same column
^P	previous line, same column
^U	scrolls up in the file
^Y	exposes another line at the top
+	next line, at the beginning
\-	previous line, at the beginning
/	scan for a following string forwards
?	scan backwards
B	back a word, ignoring punctuation
G	go to specified line, last default
H	home screen line
M	middle screen line
L	last screen line
W	forward a word, ignoring punctuation
b	back a word
e	end of current word
n	scan for next instance of \fB/\fR or \fB?\fR pattern
w	word after this word
.TE
.NH 2
View
.PP
If you want to use the editor to look at a file,
rather than to make changes,
invoke it as
.I view
instead of
.I vi .
This will set the
.I readonly
option which will prevent you from
accidently overwriting the file.
.sp
.NH 1
Making simple changes
.NH 2
Inserting
.PP
One of the most useful commands is the
\fBi\fR (insert) command.
After you type \fBi\fR, everything you type until you hit \s-2ESC\s0
is inserted into the file.
Try this now; position yourself to some word in the file and try inserting
text before this word.
If you are on an dumb terminal it will seem, for a minute,
that some of the characters in your line have been overwritten, but they will
reappear when you hit \s-2ESC\s0.
.PP
Now try finding a word which can, but does not, end in an `s'.
Position yourself at this word and type \fBe\fR (move to end of word), then
\fBa\fR for append and then `s\s-2ESC\s0' to terminate the textual insert.
This sequence of commands can be used to easily pluralize a word.
.PP
Try inserting and appending a few times to make sure you understand how
this works; \fBi\fR placing text to the left of the cursor, \fBa\fR to
the right.
.PP
It is often the case that you want to add new lines to the file you are
editing, before or after some specific line in the file.  Find a line
where this makes sense and then give the command \fBo\fR to create a
new line after the line you are on, or the command \fBO\fR to create
a new line before the line you are on.  After you create a new line in
this way, text you type up to an \s-2ESC\s0 is inserted on the new line.
.PP
Many related editor commands
are invoked by the same letter key and differ only in that one is given
by a lower
case key and the other is given by
an upper case key.  In these cases, the
upper case key often differs from the lower case key in its sense of
direction, with
the upper case key working backward and/or up, while the lower case
key moves forward and/or down.
.PP
Whenever you are typing in text, you can give many lines of input or
just a few characters.
To type in more than one line of text,
hit a \s-2RETURN\s0 at the middle of your input.  A new line will be created
for text, and you can continue to type.  If you are on a slow
and dumb terminal the editor may choose to wait to redraw the
tail of the screen, and will let you type over the existing screen lines.
This avoids the lengthy delay which would occur if the editor attempted
to keep the tail of the screen always up to date.  The tail of the screen will
be fixed up, and the missing lines will reappear, when you hit \s-2ESC\s0.
.PP
While you are inserting new text, you can use the characters you normally use
at the system command level (usually \fB^H\fR or \fB#\fR) to backspace
over the last
character which you typed, and the character which you use to kill input lines
(usually \fB@\fR, \fB^X\fR, or \fB^U\fR)
to erase the input you have typed on the current line.\*(dg
.FS
\*(dg In fact, the character \fB^H\fR (backspace) always works to erase the
last input character here, regardless of what your erase character is.
.FE
The character \fB^W\fR
will erase a whole word and leave you after the space after the previous
word; it is useful for quickly backing up in an insert.
.PP
Notice that when you backspace during an insertion the characters you
backspace over are not erased; the cursor moves backwards, and the characters
remain on the display.  This is often useful if you are planning to type
in something similar.  In any case the characters disappear when when
you hit \s-2ESC\s0; if you want to get rid of them immediately, hit an
\s-2ESC\s0 and then \fBa\fR again.
.PP
Notice also that you can't erase characters which you didn't insert, and that
you can't backspace around the end of a line.  If you need to back up
to the previous line to make a correction, just hit \s-2ESC\s0 and move
the cursor back to the previous line.  After making the correction you
can return to where you were and use the insert or append command again.
.sp .5
.NH 2
Making small corrections
.PP
You can make small corrections in existing text quite easily.
Find a single character which is wrong or just pick any character.
Use the arrow keys to find the character, or
get near the character with the word motion keys and then either
backspace (hit the \s-2BS\s0 key or \fB^H\fR or even just \fBh\fR) or 
\s-2SPACE\s0 (using the space bar)
until the cursor is on the character which is wrong.
If the character is not needed then hit the \fBx\fP key; this deletes
the character from the file.  It is analogous to the way you \fBx\fP
out characters when you make mistakes on a typewriter (except it's not
as messy).
.PP
If the character
is incorrect, you can replace it with the correct character by giving
the command \fBr\fR\fIc\fR,
where \fIc\fR is replaced by the correct character.
Finally if the character which is incorrect should be replaced
by more than one character, give the command \fBs\fR which substitutes
a string of characters, ending with \s-2ESC\s0, for it.
If there are a small number of characters
which are wrong you can precede \fBs\fR with a count of the number of
characters to be replaced.  Counts are also useful with \fBx\fR to specify
the number of characters to be deleted.
.NH 2
More corrections: operators
.PP
You already know almost enough to make changes at a higher level.
All you need to know now is that the 
.B d
key acts as a delete operator.  Try the command
.B dw
to delete a word.
Try hitting \fB.\fR a few times.  Notice that this repeats the effect
of the \fBdw\fR.  The command \fB.\fR repeats the last command which
made a change.  You can remember it by analogy with an ellipsis `\fB...\fR'.
.PP
Now try
\fBdb\fR.
This deletes a word backwards, namely the preceding word.
Try 
\fBd\fR\s-2SPACE\s0.  This deletes a single character, and is equivalent
to the \fBx\fR command.
.PP
Another very useful operator is
.B c
or change.  The command 
.B cw
thus changes the text of a single word.
You follow it by the replacement text ending with an \s-2ESC\s0.
Find a word which you can change to another, and try this
now.
Notice that the end of the text to be changed was marked with the character
`$' so that you can see this as you are typing in the new material.
.sp .5
.NH 2
Operating on lines
.PP
It is often the case that you want to operate on lines.
Find a line which you want to delete, and type 
\fBdd\fR,
the
.B d
operator twice.  This will delete the line.
If you are on a dumb terminal, the editor may just erase the line on
the screen, replacing it with a line with only an @ on it.  This line
does not correspond to any line in your file, but only acts as a place
holder.  It helps to avoid a lengthy redraw of the rest of the screen
which would be necessary to close up the hole created by the deletion
on a terminal without a delete line capability.
.PP
Try repeating the
.B c
operator twice; this will change a whole line, erasing its previous contents and
replacing them with text you type up to an \s-2ESC\s0.\*(dg
.FS
\*(dg The command \fBS\fR is a convenient synonym for for \fBcc\fR, by
analogy with \fBs\fR.  Think of \fBS\fR as a substitute on lines, while
\fBs\fR is a substitute on characters.
.FE
.PP
You can delete or change more than one line by preceding the
.B dd
or
.B cc
with a count, i.e. \fB5dd\fR deletes 5 lines.
You can also give a command like \fBdL\fR to delete all the lines up to
and including
the last line on the screen, or \fBd3L\fR to delete through the third from
the bottom line.  Try some commands like this now.*
.FS
* One subtle point here involves using the \fB/\fR search after a \fBd\fR.
This will normally delete characters from the current position to the
point of the match.  If what is desired is to delete whole lines
including the two points, give the pattern as \fB/pat/+0\fR, a line address.
.FE
Notice that the editor lets you know when you change a large number of
lines so that you can see the extent of the change.
The editor will also always tell you when a change you make affects text which
you cannot see.
.NH 2
Undoing
.PP
Now suppose that the last change which you made was incorrect;
you could use the insert, delete and append commands to put the correct
material back.  However, since it is often the case that we regret a
change or make a change incorrectly, the editor provides a
.B u
(undo) command to reverse the last change which you made.
Try this a few times, and give it twice in a row to notice that an
.B u
also undoes a
.B u.
.PP
The undo command lets you reverse only a single change.  After you make
a number of changes to a line, you may decide that you would rather have
the original state of the line back.  The
.B U
command restores the current line to the state before you started changing
it.
.PP
You can recover text which you delete, even if
undo will not bring it back; see the section on recovering lost text
below.
.NH 2
Summary
.IP
.TS
lw(.50i)b a.
\fR\s-2SPACE\s0\fP	advance the cursor one position
^H	backspace the cursor
^W	erase a word during an insert
\fRerase\fP	your erase (usually ^H or #), erases a character during an insert
\fRkill\fP	your kill (usually @, ^X, or ^U), kills the insert on this line
\&\fB.\fP	repeats the changing command
O	opens and inputs new lines, above the current
U	undoes the changes you made to the current line
a	appends text after the cursor
c	changes the object you specify to the following text
d	deletes the object you specify
i	inserts text before the cursor
o	opens and inputs new lines, below the current
u	undoes the last change
.TE
.NH 1
Moving about; rearranging and duplicating text
.NH 2
Low level character motions
.PP
Now move the cursor to a line where there is a punctuation or a bracketing
character such as a parenthesis or a comma or period.  Try the command
\fBf\fR\fIx\fR where \fIx\fR is this character.  This command finds
the next \fIx\fR character to the right of the cursor in the current
line.  Try then hitting a \fB;\fR, which finds the next instance of the
same character.  By using the \fBf\fR command and then a sequence of
\fB;\fR's you can often
get to a particular place in a line much faster than with a sequence
of word motions or \s-2SPACE\s0s.
There is also a \fBF\fR command, which is like \fBf\fR, but searches 
backward.  The \fB;\fR command repeats \fBF\fR also.
.PP
When you are operating on the text in a line it is often desirable to
deal with the characters up to, but not including, the first instance of
a character.  Try \fBdf\fR\fIx\fR for some \fIx\fR now and
notice that the \fIx\fR character is deleted.  Undo this with \fBu\fR
and then try \fBdt\fR\fIx\fR;  the \fBt\fR here stands for to, i.e.
delete up to the next \fIx\fR, but not the \fIx\fR.  The command \fBT\fR
is the reverse of \fBt\fR.
.PP
When working with the text of a single line, an \fB\(ua\fR moves the
cursor to the first non-white position on the line, and a
\fB$\fR moves it to the end of the line.  Thus \fB$a\fR will append new
text at the end of the current line.
.PP
Your file may have tab (\fB^I\fR) characters in it.  These
characters are represented as a number of spaces expanding to a tab stop,
where tab stops are every 8 positions.*
.FS
* This is settable by a command of the form \fB:se ts=\fR\fIx\fR\s-2CR\s0,
where \fIx\fR is 4 to set tabstops every four columns.  This has
effect on the screen representation within the editor.
.FE
When the cursor is at a tab, it sits on the last of the several spaces
which represent that tab.  Try moving the cursor back and forth over
tabs so you understand how this works.
.PP
On rare occasions, your file may have nonprinting characters in it. 
These characters are displayed in the same way they are represented in
this document, that is with a two character code, the first character
of which is `^'.  On the screen non-printing characters resemble a `^'
character adjacent to another, but spacing or backspacing over the character
will reveal that the two characters are, like the spaces representing
a tab character, a single character.
.PP
The editor sometimes discards control characters,
depending on the character and the setting of the
.I beautify
option,
if you attempt to insert them in your file.
You can get a control character in the file by beginning
an insert and then typing a \fB^V\fR before the control
character.  The
\fB^V\fR quotes the following character, causing it to be
inserted directly into the file.
.PP
.NH 2
Higher level text objects
.PP
In working with a document it is often advantageous to work in terms
of sentences, paragraphs, and sections.  The operations \fB(\fR and \fB)\fR
move to the beginning of the previous and next sentences respectively.
Thus the command \fBd)\fR will delete the rest of the current sentence;
likewise \fBd(\fR will delete the previous sentence if you are at the
beginning of the current sentence, or the current sentence up to where
you are if you are not at the beginning of the current sentence.
.PP
A sentence is defined to end at a `.', `!' or `?' which is followed by
either the end of a line, or by two spaces.  Any number of closing `)',
`]', `"' and `\(aa' characters may appear after the `.', `!' or `?' before
the spaces or end of line.
.PP
The operations \fB{\fR and \fB}\fR move over paragraphs and the operations
\fB[[\fR and \fB]]\fR move over sections.\*(dg
.FS
\*(dg The \fB[[\fR and \fB]]\fR operations
require the operation character to be doubled because they can move the
cursor far from where it currently is.  While it is easy to get back
with the command \fB\(ga\(ga\fP,
these commands would still be frustrating
if they were easy to hit accidentally.
.FE
.PP
A paragraph begins after each empty line, and also
at each of a set of paragraph macros, specified by the pairs of characters
in the definition of the string valued option \fIparagraphs\fR.
The default setting for this option defines the paragraph macros of the
\fI\-ms\fR and \fI\-mm\fR macro packages, i.e. the `.IP', `.LP', `.PP'
and `.QP', `.P' and `.LI' macros.\*(dd
.FS
\*(dd You can easily change or extend this set of macros by assigning a
different string to the \fIparagraphs\fR option in your EXINIT.
See section 6.2 for details.
The `.bp' directive is also considered to start a paragraph.
.FE
Each paragraph boundary is also a sentence boundary.  The sentence
and paragraph commands can
be given counts to operate over groups of sentences and paragraphs.
.PP
Sections in the editor begin after each macro in the \fIsections\fR option,
normally `.NH', `.SH', `.H' and `.HU', and each line with a formfeed \fB^L\fR
in the first column.
Section boundaries are always line and paragraph boundaries also.
.PP
Try experimenting with the sentence and paragraph commands until you are
sure how they work.  If you have a large document, try looking through
it using the section commands.
The section commands interpret a preceding count as a different window size in
which to redraw the screen at the new location, and this window size
is the base size for newly drawn windows until another size is specified.
This is very useful
if you are on a slow terminal and are looking for a particular section. 
You can give the first section command a small count to then see each successive
section heading in a small window.
.NH 2
Rearranging and duplicating text
.PP
The editor has a single unnamed buffer where the last deleted or
changed away text is saved, and a set of named buffers \fBa\fR\-\fBz\fR
which you can use to save copies of text and to move text around in
your file and between files.
.PP
The operator
.B y
yanks a copy of the object which follows into the unnamed buffer.
If preceded by a buffer name, \fB"\fR\fIx\fR\|\fBy\fR, where
\fIx\fR here is replaced by a letter \fBa\-z\fR, it places the text in the named
buffer.  The text can then be put back in the file with the commands
.B p
and
.B P;
\fBp\fR puts the text after or below the cursor, while \fBP\fR puts the text
before or above the cursor.
.PP
If the text which you
yank forms a part of a line, or is an object such as a sentence which
partially spans more than one line, then when you put the text back,
it will be placed after the cursor (or before if you
use \fBP\fR).  If the yanked text forms whole lines, they will be put
back as whole lines, without changing the current line.  In this case,
the put acts much like a \fBo\fR or \fBO\fR command.
.PP
Try the command \fBYP\fR.  This makes a copy of the current line and
leaves you on this copy, which is placed before the current line.
The command \fBY\fR is a convenient abbreviation for \fByy\fR.
The command \fBYp\fR will also make a copy of the current line, and place
it after the current line.  You can give \fBY\fR a count of lines to
yank, and thus duplicate several lines; try \fB3YP\fR.
.PP
To move text within the buffer, you need to delete it in one place, and
put it back in another.  You can precede a delete operation by the
name of a buffer in which the text is to be stored as in \fB"a5dd\fR
deleting 5 lines into the named buffer \fIa\fR.  You can then move the
cursor to the eventual resting place of the these lines and do a \fB"ap\fR
or \fB"aP\fR to put them back.
In fact, you can switch and edit another file before you put the lines
back, by giving a command of the form \fB:e \fR\fIname\fR\s-2CR\s0 where
\fIname\fR is the name of the other file you want to edit.  You will
have to write back the contents of the current editor buffer (or discard
them) if you have made changes before the editor will let you switch
to the other file.
An ordinary delete command saves the text in the unnamed buffer,
so that an ordinary put can move it elsewhere.
However, the unnamed buffer is lost when you change files,
so to move text from one file to another you should use an unnamed buffer.
.NH 2
Summary.
.IP
.TS
lw(.50i)b a.
\(ua	first non-white on line
$	end of line
)	forward sentence
}	forward paragraph
]]	forward section
(	backward sentence
{	backward paragraph
[[	backward section
f\fIx\fR	find \fIx\fR forward in line
p	put text back, after cursor or below current line
y	yank operator, for copies and moves
t\fIx\fR	up to \fIx\fR forward, for operators
F\fIx\fR	f backward in line
P	put text back, before cursor or above current line
T\fIx\fR	t backward in line
.TE
.ne 1i
.NH 1
High level commands
.NH 2
Writing, quitting, editing new files
.PP
So far we have seen how to enter
.I vi
and to write out our file using either
\fBZZ\fR or \fB:w\fR\s-2CR\s0. The first exits from
the editor,
(writing if changes were made),
the second writes and stays in the editor.
.PP
If you have changed the editor's copy of the file but do not wish to
save your changes, either because you messed up the file or decided that the
changes are not an improvement to the file, then you can give the command
\fB:q!\fR\s-2CR\s0 to quit from the editor without writing the changes.
You can also reedit the same file (starting over) by giving the command
\fB:e!\fR\s-2CR\s0.  These commands should be used only rarely, and with
caution, as it is not possible to recover the changes you have made after
you discard them in this manner.
.PP
You can edit a different file without leaving the editor by giving the
command \fB:e\fR\ \fIname\fR\s-2CR\s0.  If you have not written out
your file before you try to do this, then the editor will tell you this,
and delay editing the other file.  You can then give the command
\fB:w\fR\s-2CR\s0 to save your work and then the \fB:e\fR\ \fIname\fR\s-2CR\s0
command again, or carefully give the command \fB:e!\fR\ \fIname\fR\s-2CR\s0,
which edits the other file discarding the changes you have made to the
current file.
To have the editor automatically save changes,
include
.I "set autowrite"
in your EXINIT,
and use \fB:n\fP instead of \fB:e\fP.
.NH 2
Escaping to a shell
.PP
You can get to a shell to execute a single command by giving a
.I vi
command of the form \fB:!\fIcmd\fR\s-2CR\s0.
The system will run the single command
.I cmd
and when the command finishes, the editor will ask you to hit a \s-2RETURN\s0
to continue.  When you have finished looking at the output on the screen,
you should hit \s-2RETURN\s0 and the editor will clear the screen and
redraw it.  You can then continue editing.
You can also give another \fB:\fR command when it asks you for a \s-2RETURN\s0;
in this case the screen will not be redrawn.
.PP
If you wish to execute more than one command in the shell, then you can
give the command \fB:sh\fR\s-2CR\s0.
This will give you a new shell, and when you finish with the shell, ending
it by typing a \fB^D\fR, the editor will clear the screen and continue.
.PP
On systems which support it, \fB^Z\fP will suspend the editor
and return to the (top level) shell.
When the editor is resumed, the screen will be redrawn.
.NH 2
Marking and returning
.PP
The command \fB\(ga\(ga\fR returned to the previous place
after a motion of the cursor by a command such as \fB/\fR, \fB?\fR or
\fBG\fR.  You can also mark lines in the file with single letter tags
and return to these marks later by naming the tags.  Try marking the
current line with the command \fBm\fR\fIx\fR, where you should pick some
letter for \fIx\fR, say `a'.  Then move the cursor to a different line
(any way you like) and hit \fB\(gaa\fR.  The cursor will return to the
place which you marked.
Marks last only until you edit another file.
.PP
When using operators such as
.B d
and referring to marked lines, it is often desirable to delete whole lines
rather than deleting to the exact position in the line marked by \fBm\fR.
In this case you can use the form \fB\(aa\fR\fIx\fR rather than
\fB\(ga\fR\fIx\fR.  Used without an operator, \fB\(aa\fR\fIx\fR will move to
the first non-white character of the marked line; similarly \fB\(aa\(aa\fR
moves to the first non-white character of the line containing the previous
context mark \fB\(ga\(ga\fR.
.NH 2
Adjusting the screen
.PP
If the screen image is messed up because of a transmission error to your
terminal, or because some program other than the editor wrote output
to your terminal, you can hit a \fB^L\fR, the \s-2ASCII\s0 form-feed
character, to cause the screen to be refreshed.
.PP
On a dumb terminal, if there are @ lines in the middle of the screen
as a result of line deletion, you may get rid of these lines by typing
\fB^R\fR to cause the editor to retype the screen, closing up these holes.
.PP
Finally, if you wish to place a certain line on the screen at the top
middle or bottom of the screen, you can position the cursor to that line,
and then give a \fBz\fR command.
You should follow the \fBz\fR command with a \s-2RETURN\s0 if you want
the line to appear at the top of the window, a \fB.\fR if you want it
at the center, or a \fB\-\fR if you want it at the bottom.
.NH 1
Special topics
.NH 2
Editing on slow terminals
.PP
When you are on a slow terminal, it is important to limit the amount
of output which is generated to your screen so that you will not suffer
long delays, waiting for the screen to be refreshed.  We have already
pointed out how the editor optimizes the updating of the screen during
insertions on dumb terminals to limit the delays, and how the editor erases
lines to @ when they are deleted on dumb terminals.
.PP
The use of the slow terminal insertion mode is controlled by the
.I slowopen
option.  You can force the editor to use this mode even on faster terminals
by giving the command \fB:se slow\fR\s-2CR\s0.  If your system is sluggish
this helps lessen the amount of output coming to your terminal.
You can disable this option by \fB:se noslow\fR\s-2CR\s0.
.PP
The editor can simulate an intelligent terminal on a dumb one.  Try
giving the command \fB:se redraw\fR\s-2CR\s0.  This simulation generates
a great deal of output and is generally tolerable only on lightly loaded
systems and fast terminals.  You can disable this by giving the command
 \fB:se noredraw\fR\s-2CR\s0.
.PP
The editor also makes editing more pleasant at low speed by starting
editing in a small window, and letting the window expand as you edit.
This works particularly well on intelligent terminals.  The editor can
expand the window easily when you insert in the middle of the screen
on these terminals.  If possible, try the editor on an intelligent terminal
to see how this works.
.PP
You can control the size of the window which is redrawn each time the
screen is cleared by giving window sizes as argument to the commands
which cause large screen motions:
.DS
.B ":  /  ?  [[  ]]  \(ga  \(aa"
.DE
Thus if you are searching for a particular instance of a common string
in a file you can precede the first search command by a small number,
say 3, and the editor will draw three line windows around each instance
of the string which it locates.
.PP
You can easily expand or contract the window, placing the current line
as you choose, by giving a number on a \fBz\fR command, after the \fBz\fR
and before the following \s-2RETURN\s0, \fB.\fR or \fB\-\fR.  Thus the
command \fBz5.\fR redraws the screen with the current line in the center
of a five line window.\*(dg
.FS
\*(dg Note that the command \fB5z.\fR has an entirely different effect,
placing line 5 in the center of a new window.
.FE
.PP
If the editor is redrawing or otherwise updating large portions of the
display, you can interrupt this updating by hitting a \s-2DEL\s0 or \s-2RUB\s0
as usual.  If you do this you may partially confuse the editor about
what is displayed on the screen.  You can still edit the text on
the screen if you wish; clear up the confusion
by hitting a \fB^L\fR; or move or search again, ignoring the
current state of the display.
.PP
See section 7.8 on \fIopen\fR mode for another way to use the
.I vi
command set on slow terminals.
.NH 2
Options, set, and editor startup files
.PP
The editor has a set of options, some of which have been mentioned above.
The most useful options are given in the following table.
.PP
The options are of three kinds:  numeric options, string options, and
toggle options.  You can set numeric and string options by a statement
of the form
.DS
\fBset\fR \fIopt\fR\fB=\fR\fIval\fR
.DE
and toggle options can be set or unset by statements of one of the forms
.DS
\fBset\fR \fIopt\fR
\fBset\fR \fBno\fR\fIopt\fR
.DE
.KF
.TS
lb lb lb lb
l l l a.
Name	Default	Description
_
autoindent	noai	Supply indentation automatically
autowrite	noaw	Automatic write before \fB:n\fR, \fB:ta\fR, \fB^\(ua\fR, \fB!\fR
ignorecase	noic	Ignore case in searching
lisp	nolisp	\fB( { ) }\fR commands deal with S-expressions
list	nolist	Tabs print as ^I; end of lines marked with $
magic	nomagic	The characters . [ and * are special in scans
number	nonu	Lines are displayed prefixed with line numbers
paragraphs	para=IPLPPPQPbpP LI	Macro names which start paragraphs
redraw	nore	Simulate a smart terminal on a dumb one
sections	sect=NHSHH HU	Macro names which start new sections
shiftwidth	sw=8	Shift distance for <, > and input \fB^D\fP and \fB^T\fR
showmatch	nosm	Show matching \fB(\fP or \fB{\fP as \fB)\fP or \fB}\fR is typed
slowopen	slow	Postpone display updates during inserts
term	dumb	The kind of terminal you are using.
.TE
.KE
These statements can be placed in your EXINIT in your environment,
or given while you are running
.I vi
by preceding them with a \fB:\fR and following them with a \s-2CR\s0.
.PP
You can get a list of all options which you have changed by the
command \fB:set\fR\s-2CR\s0, or the value of a single option by the
command \fB:set\fR \fIopt\fR\fB?\fR\s-2CR\s0.
A list of all possible options and their values is generated by
\fB:set all\fP\s-2CR\s0.
Set can be abbreviated \fBse\fP.
Multiple options can be placed on one line, e.g.
\fB:se ai aw nu\fP\s-2CR\s0.
.PP
Options set by the \fBset\fP command only last
while you stay in the editor.
It is common to want to have certain options set whenever you
use the editor.
This can be accomplished by creating a list of \fIex\fP commands\*(dg
.FS
\*(dg
All commands which start with
.B :
are \fIex\fP commands.
.FE
which are to be run every time you start up \fIex\fP, \fIedit\fP,
or \fIvi\fP.
A typical list includes a \fBset\fP command, and possibly a few
\fBmap\fP commands.
Since it is advisable to get these commands on one line, they can
be separated with the | character, for example:
.DS
\fBset\fP ai aw terse|\fBmap\fP @ dd|\fBmap\fP # x
.DE
which sets the options \fIautoindent\fP, \fIautowrite\fP, \fIterse\fP,
(the
.B set
command),
makes @ delete a line,
(the first
.B map ),
and makes # delete a character,
(the second
.B map ).
(See section 6.9 for a description of the \fBmap\fP command)
This string should be placed in the variable EXINIT in your environment.
If you use the shell \fIcsh\fP,
put this line in the file
.I .login
in your home directory:
.DS
setenv EXINIT \(aa\fBset\fP ai aw terse|\fBmap\fP @ dd|\fBmap\fP # x\(aa
.DE
If you use the standard shell \fIsh\fP,
put these lines in the file
.I .profile
in your home directory:
.DS
EXINIT=\(aa\fBset\fP ai aw terse|\fBmap\fP @ dd|\fBmap\fP # x\(aa
export EXINIT
.DE
Of course, the particulars of the line would depend on which options
you wanted to set.
.NH 2
Recovering lost lines
.PP
You might have a serious problem if you delete a number of lines and then
regret that they were deleted.  Despair not, the editor saves the last
9 deleted blocks of text in a set of numbered registers 1\-9.
You can get the \fIn\fR'th previous deleted text back in your file by
the command
"\fR\fIn\fR\|\fBp\fR.
The "\fR here says that a buffer name is to follow,
\fIn\fR is the number of the buffer you wish to try
(use the number 1 for now),
and
.B p
is the put command, which puts text in the buffer after the cursor.
If this doesn't bring back the text you wanted, hit
.B u
to undo this and then
\fB\&.\fR
(period)
to repeat the put command.
In general the
\fB\&.\fR
command will repeat the last change you made.
As a special case, when the last command refers to a numbered text buffer,
the \fB.\fR command increments the number of the buffer before repeating
the command.  Thus a sequence of the form
.DS
\fB"1pu.u.u.\fR
.DE
will, if repeated long enough, show you all the deleted text which has
been saved for you.
You can omit the
.B u
commands here to gather up all this text in the buffer, or stop after any
\fB\&.\fR command to keep just the then recovered text.
The command
.B P
can also be used rather than
.B p
to put the recovered text before rather than after the cursor.
.NH 2
Recovering lost files
.PP
If the system crashes, you can recover the work you were doing
to within a few changes.  You will normally receive mail when you next
login giving you the name of the file which has been saved for you. 
You should then change to the directory where you were when the system
crashed and give a command of the form:
.DS
% \fBvi \-r\fR \fIname\fR
.DE
replacing \fIname\fR with the name of the file which you were editing.
This will recover your work to a point near where you left off.\*(dg
.FS
\*(dg In rare cases, some of the lines of the file may be lost.  The
editor will give you the numbers of these lines and the text of the lines
will be replaced by the string `LOST'.  These lines will almost always
be among the last few which you changed.  You can either choose to discard
the changes which you made (if they are easy to remake) or to replace
the few lost lines by hand.
.FE
.PP
You can get a listing of the files which are saved for you by giving
the command:
.DS
% \fBvi \-r\fR
.DE
If there is more than one instance of a particular file saved, the editor
gives you the newest instance each time you recover it.  You can thus
get an older saved copy back by first recovering the newer copies.
.PP
For this feature to work,
.I vi
must be correctly installed by a super user on your system,
and the
.I mail
program must exist to receive mail.
The invocation ``\fIvi -r\fP'' will not always list all saved files,
but they can be recovered even if they are not listed.
.NH 2
Continuous text input
.PP
When you are typing in large amounts of text it is convenient to have
lines broken near the right margin automatically.  You can cause this
to happen by giving the command
\fB:se wm=10\fR\s-2CR\s0.
This causes all lines to be broken at a space at least 10 columns
from the right hand edge of the screen.
.PP
If the editor breaks an input line and you wish to put it back together
you can tell it to join the lines with \fBJ\fR.  You can give \fBJ\fR
a count of the number of lines to be joined as in \fB3J\fR to join 3
lines.  The editor supplies white space, if appropriate,
at the juncture of the joined
lines, and leaves the cursor at this white space.
You can kill the white space with \fBx\fR if you don't want it.
.NH 2
Features for editing programs
.PP
The editor has a number of commands for editing programs.
The thing that most distinguishes editing of programs from editing of text
is the desirability of maintaining an indented structure to the body of
the program.  The editor has a
.I autoindent
facility for helping you generate correctly indented programs.
.PP
To enable this facility you can give the command \fB:se ai\fR\s-2CR\s0.
Now try opening a new line with \fBo\fR and type some characters on the
line after a few tabs.  If you now start another line, notice that the
editor supplies white space at the beginning of the line to line it up
with the previous line.  You cannot backspace over this indentation,
but you can use \fB^D\fR key to backtab over the supplied indentation.
.PP
Each time you type \fB^D\fR you back up one position, normally to an
8 column boundary.  This amount is settable; the editor has an option
called
.I shiftwidth
which you can set to change this value.
Try giving the command \fB:se sw=4\fR\s-2CR\s0
and then experimenting with autoindent again.
.PP
For shifting lines in the program left and right, there are operators
.B <
and
.B >.
These shift the lines you specify right or left by one
.I shiftwidth.
Try
.B <<
and
.B >>
which shift one line left or right, and
.B <L
and
.B >L
shifting the rest of the display left and right.
.PP
If you have a complicated expression and wish to see how the parentheses
match, put the cursor at a left or right parenthesis and hit \fB%\fR.
This will show you the matching parenthesis.
This works also for braces { and }, and brackets [ and ].
.PP
If you are editing C programs, you can use the \fB[[\fR and \fB]]\fR keys
to advance or retreat to a line starting with a \fB{\fR, i.e. a function
declaration at a time.  When \fB]]\fR is used with an operator it stops
after a line which starts with \fB}\fR; this is sometimes useful with
\fBy]]\fR.
.NH 2
Filtering portions of the buffer
.PP
You can run system commands over portions of the buffer using the operator
\fB!\fR.
You can use this to sort lines in the buffer, or to reformat portions
of the buffer with a pretty-printer.
Try typing in a list of random words, one per line and ending them
with a blank line.  Back up to the beginning of the list, and then give
the command \fB!}sort\fR\s-2CR\s0.  This says to sort the next paragraph
of material, and the blank line ends a paragraph.
.NH 2
Commands for editing \s-2LISP\s0
.PP
If you are editing a \s-2LISP\s0 program you should set the option
.I lisp
by doing
\fB:se\ lisp\fR\s-2CR\s0.
This changes the \fB(\fR and \fB)\fR commands to move backward and forward
over s-expressions.
The \fB{\fR and \fB}\fR commands are like \fB(\fR and \fB)\fR but don't
stop at atoms.  These can be used to skip to the next list, or through
a comment quickly.
.PP
The
.I autoindent
option works differently for \s-2LISP\s0, supplying indent to align at
the first argument to the last open list.  If there is no such argument
then the indent is two spaces more than the last level.
.PP
There is another option which is useful for typing in \s-2LISP\s0, the
.I showmatch
option.
Try setting it with
\fB:se sm\fR\s-2CR\s0
and then try typing a `(' some words and then a `)'.  Notice that the
cursor shows the position of the `(' which matches the `)' briefly. 
This happens only if the matching `(' is on the screen, and the cursor
stays there for at most one second.
.PP
The editor also has an operator to realign existing lines as though they
had been typed in with
.I lisp
and
.I autoindent
set.  This is the \fB=\fR operator.
Try the command \fB=%\fR at the beginning of a function.  This will realign
all the lines of the function declaration.
.PP
When you are editing \s-2LISP\s0,, the \fB[[\fR and \fR]]\fR advance
and retreat to lines beginning with a \fB(\fR, and are useful for dealing
with entire function definitions.
.NH 2
Macros
.PP
.I Vi
has a parameterless macro facility, which lets you set it up so that
when you hit a single keystroke, the editor will act as though
you had hit some longer sequence of keys.  You can set this up if
you find yourself typing the same sequence of commands repeatedly.
.PP
Briefly, there are two flavors of macros:
.IP a)
Ones where you put the macro body in a buffer register, say \fIx\fR.
You can then type \fB@x\fR to invoke the macro.  The \fB@\fR may be followed
by another \fB@\fR to repeat the last macro.
.IP b)
You can use the
.I map
command from
.I vi
(typically in your
.I EXINIT )
with a command of the form:
.DS
:map \fIlhs\fR \fIrhs\fR\s-2CR
.DE
mapping
.I lhs
into
.I rhs.
There are restrictions:
.I lhs
should be one keystroke (either 1 character or one function key)
since it must be entered within one second
(unless
.I notimeout
is set, in which case you can type it as slowly as you wish,
and
.I vi
will wait for you to finish it before it echoes anything).
The
.I lhs
can be no longer than 10 characters, the
.I rhs
no longer than 100.
To get a space, tab or newline into
.I lhs
or
.I rhs
you should escape them with a \fB^V\fR.
(It may be necessary to double the \fB^V\fR if the map
command is given inside
.I vi,
rather than in
.I ex.)
Spaces and tabs inside the
.I rhs
need not be escaped.
.PP
Thus to make the \fBq\fR key write and exit the editor, you can give
the command
.DS
:map q :wq\fB^V^V\fP\s-2CR CR\s0
.DE
which means that whenever you type \fBq\fR, it will be as though you
had typed the four characters \fB:wq\fR\s-2CR\s0.
A \fB^V\fR's is needed because without it the \s-2CR\s0 would end the
\fB:\fR command, rather than becoming part of the
.I map
definition.
There are two
.B ^V 's
because from within
.I vi ,
two
.B ^V 's
must be typed to get one.
The first \s-2CR\s0 is part of the
.I rhs ,
the second terminates the : command.
.PP
Macros can be deleted with
.DS
unmap lhs
.DE
.PP
If the
.I lhs
of a macro is ``#0'' through ``#9'', this maps the particular function key
instead of the 2 character ``#'' sequence.  So that terminals without
function keys can access such definitions, the form ``#x'' will mean function
key
.I x
on all terminals (and need not be typed within one second.)
The character ``#'' can be changed by using a macro in the usual way:
.DS
:map \fB^V^V^I\fP #
.DE
to use tab, for example.  (This won't affect the
.I map
command, which still uses
.B #,
but just the invocation from visual mode.
.PP
The undo command reverses an entire macro call as a unit,
if it made any changes.
.PP
Placing a `!' after the word
.B map
causes the mapping to apply
to input mode, rather than command mode.
Thus, to arrange for \fB^T\fP to be the same as 4 spaces in input mode,
you can type:
.DS
:map \fB^T\fP \fB^V\fP\o'b/'\o'b/'\o'b/'\o'b/'
.DE
where
.B \o'b/'
is a blank.
The \fB^V\fP is necessary to prevent the blanks from being taken as
white space between the
.I lhs
and
.I rhs .
.NH
Word Abbreviations
.PP
A feature similar to macros in input mode is word abbreviation.
This allows you to type a short word and have it expanded into
a longer word or words.
The commands are
.B :abbreviate
and
.B :unabbreviate
(\fB:ab\fP
and
.B :una )
and have the same syntax as
.B :map .
For example:
.DS
:ab eecs Electrical Engineering and Computer Sciences
.DE
causes the word `eecs' to always be changed into the
phrase `Electrical Engineering and Computer Sciences'.
Word abbreviation is different from macros in that
only whole words are affected.
If `eecs' were typed as part of a larger word, it would
be left alone.
Also, the partial word is echoed as it is typed.
There is no need for an abbreviation to be a single keystroke,
as it should be with a macro.
.NH 2
Abbreviations
.PP
The editor has a number of short
commands which abbreviate longer commands which we
have introduced here.  You can find these commands easily
on the quick reference card.
They often save a bit of typing and you can learn them as convenient.
.NH 1
Nitty-gritty details
.NH 2
Line representation in the display
.PP
The editor folds long logical lines onto many physical lines in the display.
Commands which advance lines advance logical lines and will skip
over all the segments of a line in one motion.  The command \fB|\fR moves
the cursor to a specific column, and may be useful for getting near the
middle of a long line to split it in half.  Try \fB80|\fR on a line which
is more than 80 columns long.\*(dg
.FS
\*(dg You can make long lines very easily by using \fBJ\fR to join together
short lines.
.FE
.PP
The editor only puts full lines on the display; if there is not enough
room on the display to fit a logical line, the editor leaves the physical
line empty, placing only an @ on the line as a place holder.  When you
delete lines on a dumb terminal, the editor will often just clear the
lines to @ to save time (rather than rewriting the rest of the screen.)
You can always maximize the information on the screen by giving the \fB^R\fR
command.
.PP
If you wish, you can have the editor place line numbers before each line
on the display.  Give the command \fB:se nu\fR\s-2CR\s0 to enable
this, and the command \fB:se nonu\fR\s-2CR\s0 to turn it off.
You can have tabs represented as \fB^I\fR and the ends of lines indicated
with `$' by giving the command \fB:se list\fR\s-2CR\s0;
\fB:se nolist\fR\s-2CR\s0 turns this off.
.PP
Finally, lines consisting of only the character `~' are displayed when
the last line in the file is in the middle of the screen.  These represent
physical lines which are past the logical end of file.
.NH 2
Counts
.PP
Most
.I vi
commands will use a preceding count to affect their behavior in some way.
The following table gives the common ways in which the counts are used:
.DS
.TS
l lb.
new window size	:  /  ?  [[  ]]  \`  \'
scroll amount	^D  ^U
line/column number	z  G  |
repeat effect	\fRmost of the rest\fP
.TE
.DE
.PP
The editor maintains a notion of the current default window size.
On terminals which run at speeds greater than 1200 baud
the editor uses the full terminal screen.
On terminals which are slower than 1200 baud
(most dialup lines are in this group)
the editor uses 8 lines as the default window size.
At 1200 baud the default is 16 lines.
.PP
This size is the size used when the editor clears and refills the screen
after a search or other motion moves far from the edge of the current window.
The commands which take a new window size as count all often cause the
screen to be redrawn.  If you anticipate this, but do not need as large
a window as you are currently using, you may wish to change the screen
size by specifying the new size before these commands.
In any case, the number of lines used on the screen will expand if you
move off the top with a \fB\-\fR or similar command or off the bottom
with a command such as \s-2RETURN\s0 or \fB^D\fR.
The window will revert to the last specified size the next time it is
cleared and refilled.\*(dg
.FS
\*(dg But not by a \fB^L\fR which just redraws the screen as it is.
.FE
.PP
The scroll commands \fB^D\fR and \fB^U\fR likewise remember the amount
of scroll last specified, using half the basic window size initially.
The simple insert commands use a count to specify a repetition of the
inserted text.  Thus \fB10a+\-\-\-\-\fR\s-2ESC\s0 will insert a grid-like
string of text.
A few commands also use a preceding count as a line or column number.
.PP
Except for a few commands which ignore any counts (such as \fB^R\fR),
the rest of the editor commands use a count to indicate a simple repetition
of their effect.  Thus \fB5w\fR advances five words on the current line,
while \fB5\fR\s-2RETURN\s0 advances five lines.  A very useful instance
of a count as a repetition is a count given to the \fB.\fR command, which
repeats the last changing command.  If you do \fBdw\fR and then \fB3.\fR,
you will delete first one and then three words.  You can then delete
two more words with \fB2.\fR.
.NH 2
More file manipulation commands
.PP
The following table lists the file manipulation commands which you can
use when you are in
.I vi.
.KF
.DS
.TS
lb l.
:w	write back changes
:wq	write and quit
:x	write (if necessary) and quit (same as ZZ).
:e \fIname\fP	edit file \fIname\fR
:e!	reedit, discarding changes
:e + \fIname\fP	edit, starting at end
:e +\fIn\fP	edit, starting at line \fIn\fP
:e #	edit alternate file
:w \fIname\fP	write file \fIname\fP
:w! \fIname\fP	overwrite file \fIname\fP
:\fIx,y\fPw \fIname\fP	write lines \fIx\fP through \fIy\fP to \fIname\fP
:r \fIname\fP	read file \fIname\fP into buffer
:r !\fIcmd\fP	read output of \fIcmd\fP into buffer
:n	edit next file in argument list
:n!	edit next file, discarding changes to current
:n \fIargs\fP	specify new argument list
:ta \fItag\fP	edit file containing tag \fItag\fP, at \fItag\fP
.TE
.DE
.KE
All of these commands are followed by a \s-2CR\s0 or \s-2ESC\s0.
The most basic commands are \fB:w\fR and \fB:e\fR.
A normal editing session on a single file will end with a \fBZZ\fR command.
If you are editing for a long period of time you can give \fB:w\fR commands
occasionally after major amounts of editing, and then finish
with a \fBZZ\fR.   When you edit more than one file, you can finish
with one with a \fB:w\fR and start editing a new file by giving a \fB:e\fR
command,
or set
.I autowrite
and use \fB:n\fP <file>.
.PP
If you make changes to the editor's copy of a file, but do not wish to
write them back, then you must give an \fB!\fR after the command you
would otherwise use; this forces the editor to discard any changes
you have made.  Use this carefully.
.ne 1i
.PP
The \fB:e\fR command can be given a \fB+\fR argument to start at the
end of the file, or a \fB+\fR\fIn\fR argument to start at line \fIn\fR\^.
In actuality, \fIn\fR may be any editor command not containing a space,
usefully a scan like \fB+/\fIpat\fR or \fB+?\fIpat\fR.
In forming new names to the \fBe\fR command, you can use the character
\fB%\fR which is replaced by the current file name, or the character
\fB#\fR which is replaced by the alternate file name.
The alternate file name is generally the last name you typed other than
the current file.  Thus if you try to do a \fB:e\fR and get a diagnostic
that you haven't written the file, you can give a \fB:w\fR command and
then a \fB:e #\fR command to redo the previous \fB:e\fR.
.PP
You can write part of the buffer to a file by finding out the lines
that bound the range to be written using \fB^G\fR, and giving these
numbers after the \fB:\fR
and before the \fBw\fP, separated by \fB,\fR's.
You can also mark these lines with \fBm\fR and
then use an address of the form \fB\(aa\fR\fIx\fR\fB,\fB\(aa\fR\fIy\fR
on the \fBw\fR command here.
.PP
You can read another file into the buffer after the current line by using
the \fB:r\fR command.
You can similarly read in the output from a command, just use \fB!\fR\fIcmd\fR
instead of a file name.
.PP
If you wish to edit a set of files in succession, you can give all the
names on the command line, and then edit each one in turn using the command
\fB:n\fR.  It is also possible to respecify the list of files to be edited
by giving the \fB:n\fR command a list of file names, or a pattern to
be expanded as you would have given it on the initial
.I vi
command.
.PP
If you are editing large programs, you will find the \fB:ta\fR command
very useful.  It utilizes a data base of function names and their locations,
which can be created by programs such as
.I ctags,
to quickly find a function whose name you give.
If the \fB:ta\fR command will require the editor to switch files, then
you must \fB:w\fR or abandon any changes before switching.  You can repeat
the \fB:ta\fR command without any arguments to look for the same tag
again.
.NH 2
More about searching for strings
.PP
When you are searching for strings in the file with \fB/\fR and \fB?\fR,
the editor normally places you at the next or previous occurrence
of the string.  If you are using an operator such as \fBd\fR,
\fBc\fR or \fBy\fR, then you may well wish to affect lines up to the
line before the line containing the pattern.  You can give a search of
the form \fB/\fR\fIpat\fR\fB/\-\fR\fIn\fR to refer to the \fIn\fR'th line
before the next line containing \fIpat\fR, or you can use \fB+\fR instead
of \fB\-\fR to refer to the lines after the one containing \fIpat\fR.
If you don't give a line offset, then the editor will affect characters
up to the match place, rather than whole lines; thus use ``+0'' to affect
to the line which matches.
.PP
You can have the editor ignore the case of words in the searches it does
by giving the command \fB:se ic\fR\s-2CR\s0.
The command \fB:se noic\fR\s-2CR\s0 turns this off.
.ne 1i
.PP
Strings given to searches may actually be regular expressions.
If you do not want or need this facility, you should
.DS
set nomagic
.DE
in your EXINIT.
In this case, 
only the characters \fB\(ua\fR and \fB$\fR are special in patterns.
The character \fB\e\fR is also then special (as it is most everywhere in
the system), and may be used to get at the
an extended pattern matching facility.
It is also necessary to use a \e before a
\fB/\fR in a forward scan or a \fB?\fR in a backward scan, in any case.
The following table gives the extended forms when \fBmagic\fR is set.
.DS
.TS
lb l.
\(ua	at beginning of pattern, matches beginning of line
$	at end of pattern, matches end of line
\fB\&.\fR	matches any character
\e<	matches the beginning of a word
\e>	matches the end of a word
[\fIstr\fP]	matches any single character in \fIstr\fP
[\(ua\fIstr\fP]	matches any single character not in \fIstr\fP
[\fIx\fP\-\fIy\fP]	matches any character between \fIx\fP and \fIy\fP
*	matches any number of the preceding pattern
.TE
.DE
If you use \fBnomagic\fR mode, then
the \fB. [\fR and \fB*\fR primitives are given with a preceding
\e.
.NH 2
More about input mode
.PP
There are a number of characters which you can use to make corrections
during input mode.  These are summarized in the following table.
.sp .5
.DS
.TS
lb l.
^H	deletes the last input character
^W	deletes the last input word, defined as by \fBb\fR
erase	your erase character, same as \fB^H\fP
kill	your kill character, deletes the input on this line
\e	escapes a following \fB^H\fP and your erase and kill
\s-2ESC\s0	ends an insertion
\s-2DEL\s0	interrupts an insertion, terminating it abnormally
\s-2CR\s0	starts a new line
^D	backtabs over \fIautoindent\fP
0^D	kills all the \fIautoindent\fP
\(ua^D	same as \fB0^D\fP, but restores indent next line
^V	quotes the next non-printing character into the file
.TE
.DE
.sp .5
.PP
The most usual way of making corrections to input is by typing \fB^H\fR
to correct a single character, or by typing one or more \fB^W\fR's to
back over incorrect words.  If you use \fB#\fR as your erase character
in the normal system, it will work like \fB^H\fR.
.PP
Your system kill character, normally \fB@\fR, \fB^X\fP or \fB^U\fR,
will erase all
the input you have given on the current line.
In general, you can neither
erase input back around a line boundary nor can you erase characters
which you did not insert with this insertion command.  To make corrections
on the previous line after a new line has been started you can hit \s-2ESC\s0
to end the insertion, move over and make the correction, and then return
to where you were to continue.  The command \fBA\fR which appends at the
end of the current line is often useful for continuing.
.PP
If you wish to type in your erase or kill character (say # or @) then
you must precede it with a \fB\e\fR, just as you would do at the normal
system command level.  A more general way of typing non-printing characters
into the file is to precede them with a \fB^V\fR.  The \fB^V\fR echoes
as a \fB\(ua\fR character on which the cursor rests.  This indicates that
the editor expects you to type a control character.  In fact you may
type any character and it will be inserted into the file at that point.*
.FS
* This is not quite true.  The implementation of the editor does
not allow the \s-2NULL\s0 (\fB^@\fR) character to appear in files.  Also
the \s-2LF\s0 (linefeed or \fB^J\fR) character is used by the editor
to separate lines in the file, so it cannot appear in the middle of a
line.  You can insert any other character, however, if you wait for the
editor to echo the \fB\(ua\fR before you type the character.  In fact,
the editor will treat a following letter as a request for the corresponding
control character.  This is the only way to type \fB^S\fR or \fB^Q\fP,
since the system normally uses them to suspend and resume output
and never gives them to the editor to process.
.FE
.PP
If you are using \fIautoindent\fR you can backtab over the indent which
it supplies by typing a \fB^D\fR.  This backs up to a \fIshiftwidth\fR
boundary.
This only works immediately after the supplied \fIautoindent\fR.
.PP
When you are using \fIautoindent\fR you may wish to place a label at
the left margin of a line.  The way to do this easily is to type \fB\(ua\fR
and then \fB^D\fR.  The editor will move the cursor to the left margin
for one line, and restore the previous indent on the next.  You can also
type a \fB0\fR followed immediately by a \fB^D\fR if you wish to kill
all the indent and not have it come back on the next line.
.NH 2
Upper case only terminals
.PP
If your terminal has only upper case, you can still use
.I vi
by using the normal
system convention for typing on such a terminal.
Characters which you normally type are converted to lower case, and you
can type upper case letters by preceding them with a \e.
The characters { ~ } | \(ga are not available on such terminals, but you
can escape them as \e( \e\(ua \e) \e! \e\(aa.
These characters are represented on the display in the same way they
are typed.\*(dd
.FS
\*(dd The \e character you give will not echo until you type another
key.
.FE
.NH 2
Vi and ex
.PP
.I Vi
is actually one mode of editing within the editor
.I ex.
When you are running
.I vi
you can escape to the line oriented editor of
.I ex
by giving the command
\fBQ\fR.
All of the
.B :
commands which were introduced above are available in
.I ex.
Likewise, most
.I ex
commands can be invoked from
.I vi
using :.
Just give them without the \fB:\fR and follow them with a \s-2CR\s0.
.PP
In rare instances, an internal error may occur in
.I vi.
In this case you will get a diagnostic and be left in the command mode of
.I ex.
You can then save your work and quit if you wish by giving a command
\fBx\fR after the \fB:\fR which \fIex\fR prompts you with, or you can
reenter \fIvi\fR by giving
.I ex
a
.I vi
command.
.PP
There are a number of things which you can do more easily in
.I ex
than in
.I vi.
Systematic changes in line oriented material are particularly easy.
You can read the advanced editing documents for the editor
.I ed
to find out a lot more about this style of editing.
Experienced
users often mix their use of
.I ex
command mode and
.I vi
command mode to speed the work they are doing.
.NH 2
Open mode: vi on hardcopy terminals and ``glass tty's''
\(dd
.PP
If you are on a hardcopy terminal or a terminal which does not have a cursor
which can move off the bottom line, you can still use the command set of
.I vi,
but in a different mode.
When you give a
.I vi
command, the editor will tell you that it is using
.I open
mode.
This name comes from the
.I open
command in
.I ex,
which is used to get into the same mode.
.PP
The only difference between
.I visual
mode
and
.I open
mode is the way in which the text is displayed.
.PP
In
.I open
mode the editor uses a single line window into the file, and moving backward
and forward in the file causes new lines to be displayed, always below the
current line.
Two commands of
.I vi
work differently in
.I open:
.B z
and
\fB^R\fR.
The
.B z
command does not take parameters, but rather draws a window of context around
the current line and then returns you to the current line.
.PP
If you are on a hardcopy terminal,
the
.B ^R
command will retype the current line.
On such terminals, the editor normally uses two lines to represent the
current line.
The first line is a copy of the line as you started to edit it, and you work
on the line below this line.
When you delete characters, the editor types a number of \e's to show
you the characters which are deleted.  The editor also reprints the current
line soon after such changes so that you can see what the line looks
like again.
.PP
It is sometimes useful to use this mode on very slow terminals which
can support
.I vi
in the full screen mode.
You can do this by entering
.I ex
and using an
.I open
command.
.LP
.SH
Acknowledgements
.PP
Bruce Englar encouraged the early development of this display editor.
Peter Kessler helped bring sanity to version 2's command layout.
Bill Joy wrote versions 1 and 2.0 through 2.7,
and created the framework that users see in the present editor.
Mark Horton added macros and other features and made the
editor work on a large number of terminals and Unix systems.
.\" Copyright (c) 1980, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	@(#)vi.chars	8.3 (Berkeley) 6/27/96
.\"
.bd S 3
.pn 21
.de iP
.IP "\fB\\$1\fR" \\$2
..
.SH
Appendix: character functions
.PP
This appendix gives the uses the editor makes of each character.  The
characters are presented in their order in the \s-2ASCII\s0 character
set:  Control characters come first, then most special characters, then
the digits, upper and then lower case characters.
.PP
For each character we tell a meaning it has as a command and any meaning it
has during an insert.
If it has only meaning as a command, then only this is discussed.
Section numbers in parentheses indicate where the character is discussed;
a `f' after the section number means that the character is mentioned
in a footnote.
.iP "^@" 15
Not a command character.
If typed as the first character of an insertion it is replaced with the
last text inserted, and the insert terminates.  Only 128 characters are
saved from the last insert; if more characters were inserted the mechanism
is not available.
A \fB^@\fR cannot be part of the file due to the editor implementation
(7.5f).
.iP "^A" 15
Unused.
.iP "^B" 15
Backward window.
A count specifies repetition.
Two lines of continuity are kept if possible (2.1, 6.1, 7.2).
.iP "^C" 15
Unused.
.iP "^D" 15
As a command, scrolls down a half-window of text.  
A count gives the number of (logical) lines to scroll, and is remembered
for future \fB^D\fR and \fB^U\fR commands (2.1, 7.2).
During an insert, backtabs over \fIautoindent\fR white space at the beginning
of a line (6.6, 7.5); this white space cannot be backspaced over.
.iP "^E" 15
Exposes one more line below the current screen in the file, leaving
the cursor where it is if possible.
(Version 3 only.)
.iP "^F" 15
Forward window.  A count specifies repetition.
Two lines of continuity are kept if possible (2.1, 6.1, 7.2).
.iP "^G" 15
Equivalent to \fB:f\fR\s-2CR\s0, printing the current file, whether
it has been modified, the current line number and the number of lines
in the file, and the percentage of the way through the file that you
are.
.iP "^H (\fR\s-2BS\s0\fP)" 15
Same as
.B "left arrow" .
(See
.B h ).
During an insert, eliminates the last input character, backing over it
but not erasing it; it remains so you can see what you typed if you
wish to type something only slightly different (3.1, 7.5).
.iP "^I\ (\fR\s-2TAB\s0\fP)" 15
Not a command character.
When inserted it prints as some
number of spaces.
When the cursor is at a tab character it rests at the last of the spaces
which represent the tab.
The spacing of tabstops is controlled by the \fItabstop\fR option (4.1, 6.6).
.iP "^J\ (\fR\s-2LF\s0\fP)" 15
Same as
.B "down arrow"
(see
.B j ).
.iP "^K" 15
Unused.
.iP "^L" 15
The \s-2ASCII\s0 formfeed character, this causes the screen to be cleared
and redrawn.  This is useful after a transmission error, if characters
typed by a program other than the editor scramble the screen,
or after output is stopped by an interrupt (5.4, 7.2f).
.ne 1i
.iP "^M\ (\fR\s-2CR\s0\fP)" 15
A carriage return advances to the next line, at the first non-white position
in the line.  Given a count, it advances that many lines (2.3).
During an insert, a \s-2CR\s0 causes the insert to continue onto
another line (3.1).
.iP "^N" 15
Same as
.B "down arrow"
(see
.B j ).
.iP "^O" 15
Unused.
.iP "^P" 15
Same as
.B "up arrow"
(see
.B k ).
.iP "^Q" 15
Not a command character.
In input mode,
.B ^Q
quotes the next character, the same as
.B ^V ,
except that some teletype drivers will eat the
.B ^Q
so that the editor never sees it.
.iP "^R" 15
Redraws the current screen, eliminating logical lines not corresponding
to physical lines (lines with only a single @ character on them).
On hardcopy terminals in \fIopen\fR mode, retypes the current line
(5.4, 7.2, 7.8).
.iP "^S" 15
Unused.  Some teletype drivers use
.B ^S
to suspend output until
.B ^Q is pressed.
.iP "^T" 15
Not a command character.
During an insert, with \fIautoindent\fR set and at the beginning of the
line, inserts \fIshiftwidth\fR white space.
.iP "^U" 15
Scrolls the screen up, inverting \fB^D\fR which scrolls down.  Counts work as
they do for \fB^D\fR, and the previous scroll amount is common to both.
On a dumb terminal, \fB^U\fR will often necessitate clearing and redrawing
the screen further back in the file (2.1, 7.2).
.iP "^V" 15
Not a command character.
In input mode, quotes the next character so that it is possible
to insert non-printing and special characters into the file (4.2, 7.5).
.iP "^W" 15
Not a command character.
During an insert, backs up as \fBb\fR would in command mode; the deleted
characters remain on the display (see \fB^H\fR) (7.5).
.iP "^X" 15
Unused.
.iP "^Y" 15
Exposes one more line above the current screen, leaving the cursor where
it is if possible.  (No mnemonic value for this key; however, it is next
to \fB^U\fR which scrolls up a bunch.)
(Version 3 only.)
.iP "^Z" 15
If supported by the Unix system,
stops the editor, exiting to the top level shell.
Same as \fB:stop\fP\s-2CR\s0.
Otherwise, unused.
.iP "^[\ (\fR\s-2ESC\s0\fP)" 15
Cancels a partially formed command, such as a \fBz\fR when no following
character has yet been given; terminates inputs on the last line (read
by commands such as \fB: /\fR and \fB?\fR); ends insertions of new text
into the buffer.
If an \s-2ESC\s0 is given when quiescent in command state, the editor
rings the bell or flashes the screen.  You can thus hit \s-2ESC\s0 if
you don't know what is happening till the editor rings the bell.
If you don't know if you are in insert mode you can type \s-2ESC\s0\fBa\fR,
and then material to be input; the material will be inserted correctly
whether or not you were in insert mode when you started (1.5, 3.1, 7.5).
.iP "^\e" 15
Unused.
.iP "^]" 15
Searches for the word which is after the cursor as a tag.  Equivalent
to typing \fB:ta\fR, this word, and then a \s-2CR\s0.
Mnemonically, this command is ``go right to'' (7.3).
.iP "^\(ua" 15
Equivalent to \fB:e #\fR\s-2CR\s0, returning to the previous position
in the last edited file, or editing a file which you specified if you
got a `No write since last change diagnostic' and do not want to have
to type the file name again (7.3).
(You have to do a \fB:w\fR before \fB^\(ua\fR
will work in this case.  If you do not wish to write the file you should
do \fB:e!\ #\fR\s-2CR\s0 instead.)
.iP "^_" 15
Unused.
Reserved as the command character for the
Tektronix 4025 and 4027 terminal.
.iP "\fR\s-2SPACE\s0\fP" 15
Same as
.B "right arrow"
(see
.B l ).
.iP "!" 15
An operator, which processes lines from the buffer with reformatting commands.
Follow \fB!\fR with the object to be processed, and then the command name
terminated by \s-2CR\s0.  Doubling \fB!\fR and preceding it by a count
causes count lines to be filtered; otherwise the count
is passed on to the object after the \fB!\fR.  Thus \fB2!}\fR\fIfmt\fR\s-2CR\s0
reformats the next two paragraphs by running them through the program
\fIfmt\fR.  If you are working on \s-2LISP\s0,
the command \fB!%\fR\fIgrind\fR\s-2CR\s0,*
.FS
*Both
.I fmt
and
.I grind
are Berkeley programs and may not be present at all installations.
.FE
given at the beginning of a
function, will run the text of the function through the \s-2LISP\s0 grinder
(6.7, 7.3).
To read a file or the output of a command into the buffer use \fB:r\fR (7.3).
To simply execute a command use \fB:!\fR (7.3).
.tr "
.iP  15
Precedes a named buffer specification.  There are named buffers \fB1\-9\fR
used for saving deleted text and named buffers \fBa\-z\fR into which you can
place text (4.3, 6.3)
.tr 
.iP "#" 15
The macro character which, when followed by a number, will substitute
for a function key on terminals without function keys (6.9).
In input mode, 
if this is your erase character, it will delete the last character
you typed in input mode, and must be preceded with a \fB\e\fR to insert
it, since it normally backs over the last input character you gave.
.iP "$" 15
Moves to the end of the current line.  If you \fB:se list\fR\s-2CR\s0,
then the end of each line will be shown by printing a \fB$\fR after the
end of the displayed text in the line.  Given a count, advances to the
count'th following end of line; thus \fB2$\fR advances to the end of the
following line.
.iP "%" 15
Moves to the parenthesis or brace \fB{ }\fR which balances the parenthesis
or brace at the current cursor position.
.iP "&" 15
A synonym for \fB:&\fR\s-2CR\s0, by analogy with the
.I ex
.B &
command.
.iP "\(aa" 15
When followed by a \fB\(aa\fR returns to the previous context at the
beginning of a line.  The previous context is set whenever the current
line is moved in a non-relative way.
When followed by a letter \fBa\fR\-\fBz\fR, returns to the line which
was marked with this letter with a \fBm\fR command, at the first non-white
character in the line. (2.2, 5.3).
When used with an operator such as \fBd\fR, the operation takes place
over complete lines; if you use \fB\(ga\fR, the operation takes place
from the exact marked place to the current cursor position within the
line.
.iP "(" 15
Retreats to the beginning of a
sentence, or to the beginning of a \s-2LISP\s0 s-expression
if the \fIlisp\fR option is set.
A sentence ends at a \fB. !\fR or \fB?\fR which is followed by either
the end of a line or by two spaces.  Any number of closing \fB) ] "\fR
and \fB\(aa\fR characters may appear after the \fB. !\fR or \fB?\fR,
and before the spaces or end of line.  Sentences also begin
at paragraph and section boundaries
(see \fB{\fR and \fB[[\fR below).
A count advances that many sentences (4.2, 6.8).
.iP ")" 15
Advances to the beginning of a sentence.
A count repeats the effect.
See \fB(\fR above for the definition of a sentence (4.2, 6.8).
.iP "*" 15
Unused.
.iP "+" 15
Same as \s-2CR\s0 when used as a command.
.iP "," 15
Reverse of the last \fBf F t\fR or \fBT\fR command, looking the other way
in the current line.  Especially useful after hitting too many \fB;\fR
characters.  A count repeats the search.
.iP "\-" 15
Retreats to the previous line at the first non-white character.
This is the inverse of \fB+\fR and \s-2RETURN\s0.
If the line moved to is not on the screen, the screen is scrolled, or
cleared and redrawn if this is not possible.
If a large amount of scrolling would be required the screen is also cleared
and redrawn, with the current line at the center (2.3).
.iP "\&." 15
Repeats the last command which changed the buffer.  Especially useful
when deleting words or lines; you can delete some words/lines and then
hit \fB.\fR to delete more and more words/lines.
Given a count, it passes it on to the command being repeated.  Thus after
a \fB2dw\fR, \fB3.\fR deletes three words (3.3, 6.3, 7.2, 7.4).
.iP "/" 15
Reads a string from the last line on the screen, and scans forward for
the next occurrence of this string.  The normal input editing sequences may
be used during the input on the bottom line; an returns to command state
without ever searching.
The search begins when you hit \s-2CR\s0 to terminate the pattern;
the cursor moves to the beginning of the last line to indicate that the search
is in progress; the search may then
be terminated with a \s-2DEL\s0 or \s-2RUB\s0, or by backspacing when
at the beginning of the bottom line, returning the cursor to
its initial position.
Searches normally wrap end-around to find a string
anywhere in the buffer.
.IP
When used with an operator the enclosed region is normally affected.
By mentioning an
offset from the line matched by the pattern you can force whole lines
to be affected.  To do this give a pattern with a closing
a closing \fB/\fR and then an offset \fB+\fR\fIn\fR or \fB\-\fR\fIn\fR.
.IP
To include the character \fB/\fR in the search string, you must escape
it with a preceding \fB\e\fR.
A \fB\(ua\fR at the beginning of the pattern forces the match to occur
at the beginning of a line only; this speeds the search.  A \fB$\fR at
the end of the pattern forces the match to occur at the end of a line
only.
More extended pattern matching is available, see section 7.4;
unless you set \fBnomagic\fR in your \fI\&.exrc\fR file you will have
to preceed the characters \fB. [ *\fR and \fB~\fR in the search pattern
with a \fB\e\fR to get them to work as you would naively expect (1.5, 2,2,
6.1, 7.2, 7.4).
.iP "0" 15
Moves to the first character on the current line.
Also used, in forming numbers, after an initial \fB1\fR\-\fB9\fR.
.iP "1\-9" 15
Used to form numeric arguments to commands (2.3, 7.2).
.iP ":" 15
A prefix to a set of commands for file and option manipulation and escapes
to the system.  Input is given on the bottom line and terminated with
an \s-2CR\s0, and the command then executed.  You can return to where
you were by hitting \s-2DEL\s0 or \s-2RUB\s0 if you hit \fB:\fR accidentally
(see primarily 6.2 and 7.3).
.iP ";" 15
Repeats the last single character find which used \fBf F t\fR or \fBT\fR.
A count iterates the basic scan (4.1).
.iP "<" 15
An operator which shifts lines left one \fIshiftwidth\fR, normally 8
spaces.  Like all operators, affects lines when repeated, as in
\fB<<\fR.  Counts are passed through to the basic object, thus \fB3<<\fR
shifts three lines (6.6, 7.2).
.iP "=" 15
Reindents line for \s-2LISP\s0, as though they were typed in with \fIlisp\fR
and \fIautoindent\fR set (6.8).
.iP ">" 15
An operator which shifts lines right one \fIshiftwidth\fR, normally 8
spaces.  Affects lines when repeated as in \fB>>\fR.  Counts repeat the
basic object (6.6, 7.2).
.iP "?" 15
Scans backwards, the opposite of \fB/\fR.  See the \fB/\fR description
above for details on scanning (2.2, 6.1, 7.4).
.iP "@" 15
A macro character (6.9).  If this is your kill character, you must escape it with a \e
to type it in during input mode, as it normally backs over the input you
have given on the current line (3.1, 3.4, 7.5).
.iP "A" 15
Appends at the end of line, a synonym for \fB$a\fR (7.2).
.iP "B" 15
Backs up a word, where words are composed of non-blank sequences, placing
the cursor at the beginning of the word.  A count repeats the effect
(2.4).
.iP "C" 15
Changes the rest of the text on the current line; a synonym for \fBc$\fR.
.iP "D" 15
Deletes the rest of the text on the current line; a synonym for \fBd$\fR.
.iP "E" 15
Moves forward to the end of a word, defined as blanks and non-blanks,
like \fBB\fR and \fBW\fR.  A count repeats the effect.
.iP "F" 15
Finds a single following character, backwards in the current line.
A count repeats this search that many times (4.1).
.iP "G" 15
Goes to the line number given as preceding argument, or the end of the
file if no preceding count is given.  The screen is redrawn with the
new current line in the center if necessary (7.2).
.iP "H" 15
.B "Home arrow" .
Homes the cursor to the top line on the screen.  If a count is given,
then the cursor is moved to the count'th line on the screen.
In any case the cursor is moved to the first non-white character on the
line.  If used as the target of an operator, full lines are affected
(2.3, 3.2).
.iP "I" 15
Inserts at the beginning of a line; a synonym for \fB\(uai\fR.
.iP "J" 15
Joins together lines, supplying appropriate white space: one space between
words, two spaces after a \fB.\fR, and no spaces at all if the first
character of the joined on line is \fB)\fR.  A count causes that many
lines to be joined rather than the default two (6.5, 7.1f).
.iP "K" 15
Unused.
.iP "L" 15
Moves the cursor to the first non-white character of the last line on
the screen.  With a count, to the first non-white of the count'th line
from the bottom.  Operators affect whole lines when used with \fBL\fR
(2.3).
.iP "M" 15
Moves the cursor to the middle line on the screen, at the first non-white
position on the line (2.3).
.iP "N" 15
Scans for the next match of the last pattern given to
\fB/\fR or \fB?\fR, but in the reverse direction; this is the reverse
of \fBn\fR.
.iP "O" 15
Opens a new line above the current line and inputs text there up to an
\s-2ESC\s0.  A count can be used on dumb terminals to specify a number
of lines to be opened; this is generally obsolete, as the \fIslowopen\fR
option works better (3.1).
.iP "P" 15
Puts the last deleted text back before/above the cursor.  The text goes
back as whole lines above the cursor if it was deleted as whole lines.
Otherwise the text is inserted between the characters before and at the
cursor.  May be preceded by a named buffer specification \fB"\fR\fIx\fR
to retrieve the contents of the buffer; buffers \fB1\fR\-\fB9\fR contain
deleted material, buffers \fBa\fR\-\fBz\fR are available for general
use (6.3).
.iP "Q" 15
Quits from \fIvi\fR to \fIex\fR command mode.  In this mode, whole lines
form commands, ending with a \s-2RETURN\s0.  You can give all the \fB:\fR
commands; the editor supplies the \fB:\fR as a prompt (7.7).
.iP "R" 15
Replaces characters on the screen with characters you type (overlay fashion).
Terminates with an \s-2ESC\s0.
.iP "S" 15
Changes whole lines, a synonym for \fBcc\fR.  A count substitutes for
that many lines.  The lines are saved in the numeric buffers, and erased
on the screen before the substitution begins.
.iP "T" 15
Takes a single following character, locates the character before the
cursor in the current line, and places the cursor just after that character.
A count repeats the effect.  Most useful with operators such as \fBd\fR
(4.1).
.iP "U" 15
Restores the current line to its state before you started changing it
(3.5).
.iP "V" 15
Unused.
.iP "W" 15
Moves forward to the beginning of a word in the current line,
where words are defined as sequences of blank/non-blank characters.
A count repeats the effect (2.4).
.iP "X" 15
Deletes the character before the cursor.  A count repeats the effect,
but only characters on the current line are deleted.
.iP "Y" 15
Yanks a copy of the current line into the unnamed buffer, to be put back
by a later \fBp\fR or \fBP\fR; a very useful synonym for \fByy\fR. 
A count yanks that many lines.  May be preceded by a buffer name to put
lines in that buffer (7.4).
.iP "ZZ" 15
Exits the editor.
(Same as \fB:x\fP\s-2CR\s0.)
If any changes have been made, the buffer is written out to the current file.
Then the editor quits.
.iP "[[" 15
Backs up to the previous section boundary.  A section begins at each
macro in the \fIsections\fR option,
normally a `.NH' or `.SH' and also at lines which which start
with a formfeed \fB^L\fR.  Lines beginning with \fB{\fR also stop \fB[[\fR;
this makes it useful for looking backwards, a function at a time, in C
programs.  If the option \fIlisp\fR is set, stops at each \fB(\fR at the
beginning of a line, and is thus useful for moving backwards at the top
level \s-2LISP\s0 objects. (4.2, 6.1, 6.6, 7.2).
.iP "\e" 15
Unused.
.iP "]]" 15
Forward to a section boundary, see \fB[[\fR for a definition (4.2, 6.1,
6.6, 7.2).
.iP "\(ua" 15
Moves to the first non-white position on the current line (4.4).
.iP "_" 15
Unused.
.iP "\(ga" 15
When followed by a \fB\(ga\fR returns to the previous context.
The previous context is set whenever the current
line is moved in a non-relative way.
When followed by a letter \fBa\fR\-\fBz\fR, returns to the position which
was marked with this letter with a \fBm\fR command.
When used with an operator such as \fBd\fR, the operation takes place
from the exact marked place to the current position within the line;
if you use \fB\(aa\fR, the operation takes place over complete lines
(2.2, 5.3).
.iP "a" 15
Appends arbitrary text after the current cursor position; the insert
can continue onto multiple lines by using \s-2RETURN\s0 within the insert.
A count causes the inserted text to be replicated, but only if the inserted
text is all on one line.
The insertion terminates with an \s-2ESC\s0 (3.1, 7.2).
.iP "b" 15
Backs up to the beginning of a word in the current line.  A word is a
sequence of alphanumerics, or a sequence of special characters.
A count repeats the effect (2.4).
.iP "c" 15
An operator which changes the following object, replacing it with the
following input text up to an \s-2ESC\s0.  If more than part of a single
line is affected, the text which is changed away is saved in the numeric named
buffers.  If only part of the current line is affected, then the last
character to be changed away is marked with a \fB$\fR.
A count causes that many objects to be affected, thus both
\fB3c)\fR and \fBc3)\fR change the following three sentences (7.4).
.iP "d" 15
An operator which deletes the following object.  If more than part of
a line is affected, the text is saved in the numeric buffers.
A count causes that many objects to be affected; thus \fB3dw\fR is the
same as \fBd3w\fR (3.3, 3.4, 4.1, 7.4).
.iP "e" 15
Advances to the end of the next word, defined as for \fBb\fR and \fBw\fR.
A count repeats the effect (2.4, 3.1).
.iP "f" 15
Finds the first instance of the next character following the cursor on
the current line.  A count repeats the find (4.1).
.iP "g" 15
Unused.
.sp
Arrow keys
.B h ,
.B j ,
.B k ,
.B l ,
and
.B H .
.iP "h" 15
.B "Left arrow" .
Moves the cursor one character to the left.
Like the other arrow keys, either
.B h ,
the
.B "left arrow"
key, or one of the synonyms (\fB^H\fP) has the same effect.
On v2 editors, arrow keys on certain kinds of terminals
(those which send escape sequences, such as vt52, c100, or hp)
cannot be used.
A count repeats the effect (3.1, 7.5).
.iP "i" 15
Inserts text before the cursor, otherwise like \fBa\fR (7.2).
.iP "j" 15
.B "Down arrow" .
Moves the cursor one line down in the same column.
If the position does not exist,
.I vi
comes as close as possible to the same column.
Synonyms include
.B ^J
(linefeed) and
.B ^N .
.iP "k" 15
.B "Up arrow" .
Moves the cursor one line up.
.B ^P
is a synonym.
.iP "l" 15
.B "Right arrow" .
Moves the cursor one character to the right.
\s-2SPACE\s0 is a synonym.
.iP "m" 15
Marks the current position of the cursor in the mark register which is
specified by the next character \fBa\fR\-\fBz\fR.  Return to this position
or use with an operator using \fB\(ga\fR or \fB\(aa\fR (5.3).
.iP "n" 15
Repeats the last \fB/\fR or \fB?\fR scanning commands (2.2).
.iP "o" 15
Opens new lines below the current line; otherwise like \fBO\fR (3.1).
.iP "p" 15
Puts text after/below the cursor; otherwise like \fBP\fR (6.3).
.iP "q" 15
Unused.
.iP "r" 15
Replaces the single character at the cursor with a single character you
type.  The new character may be a \s-2RETURN\s0; this is the easiest
way to split lines.  A count replaces each of the following count characters
with the single character given; see \fBR\fR above which is the more
usually useful iteration of \fBr\fR (3.2).
.iP "s" 15
Changes the single character under the cursor to the text which follows
up to an \s-2ESC\s0; given a count, that many characters from the current
line are changed.  The last character to be changed is marked with \fB$\fR
as in \fBc\fR (3.2).
.iP "t" 15
Advances the cursor upto the character before the next character typed.
Most useful with operators such as \fBd\fR and \fBc\fR to delete the
characters up to a following character.  You can use \fB.\fR to delete
more if this doesn't delete enough the first time (4.1).
.iP "u" 15
Undoes the last change made to the current buffer.  If repeated, will
alternate between these two states, thus is its own inverse. When used
after an insert which inserted text on more than one line, the lines are
saved in the numeric named buffers (3.5).
.iP "v" 15
Unused.
.iP "w" 15
Advances to the beginning of the next word, as defined by \fBb\fR (2.4).
.iP "x" 15
Deletes the single character under the cursor.  With a count deletes
deletes that many characters forward from the cursor position, but only
on the current line (6.5).
.iP "y" 15
An operator, yanks the following object into the unnamed temporary buffer.
If preceded by a named buffer specification, \fB"\fR\fIx\fR, the text
is placed in that buffer also.  Text can be recovered by a later \fBp\fR
or \fBP\fR (7.4).
.iP "z" 15
Redraws the screen with the current line placed as specified by the following
character: \s-2RETURN\s0 specifies the top of the screen, \fB.\fR the
center of the screen, and \fB\-\fR at the bottom of the screen.
A count may be given after the \fBz\fR and before the following character
to specify the new screen size for the redraw.
A count before the \fBz\fR gives the number of the line to place in the
center of the screen instead of the default current line. (5.4)
.iP "{" 15
Retreats to the beginning of the beginning of the preceding paragraph.
A paragraph begins at each macro in the \fIparagraphs\fR option, normally
`.IP', `.LP', `.PP', `.QP' and `.bp'.
A paragraph also begins after a completely
empty line, and at each section boundary (see \fB[[\fR above) (4.2, 6.8,
7.6).
.iP "|" 15
Places the cursor on the character in the column specified
by the count (7.1, 7.2).
.iP "}" 15
Advances to the beginning of the next paragraph.  See \fB{\fR for the
definition of paragraph (4.2, 6.8, 7.6).
.iP "~" 15
Unused.
.iP "^?\ (\s-2\fRDEL\fP\s0)" 15
Interrupts the editor, returning it to command accepting state (1.5,
7.5)
.bp
\&.
.\" Copyright (c) 1980, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	@(#)vi.apwh.ms	8.2 (Berkeley) 8/18/96
.\"
.nr LL 6.5i
.nr FL 6.5i
.TL
Vi Command & Function Reference
.AU CB 2675
Alan P.W. Hewett
.sp
Revised for version 2.12 by Mark Horton
.CB
.NH 1
Author's Disclaimer
.LP
This document does not claim to be 100% complete.  There are a
few commands listed in the original document that I was unable
to test either because I do not speak \fBlisp\fR, because they
required programs we don't have, or because I wasn't able to make
them work.  In these cases I left the command out.  The commands
listed in this document have been tried and are known to work.
It is expected that prospective users of this document will read
it once to get the flavor of everything that \fBvi\fR can do
and then use it as a reference document.  Experimentation is
recommended.  If you don't understand a command, try it and
see what happens.
.LP
[Note: In revising this document, I have attempted to make it
completely reflect version 2.12 of
.B vi .
It does not attempt to document the VAX version (version 3),
but with one or two exceptions (wrapmargin, arrow keys)
everything said about 2.12 should apply to 3.1.
.I "Mark Horton" ]
.NH 1
Notation
.LP
\fB[option]\fR is used to denote optional parts of a command.
Many \fBvi\fR commands have an optional count.  \fB[cnt]\fR
means that an optional number may precede the command to
multiply or iterate the command.
\fB{variable item}\fR is used to denote parts of the command
which must appear, but can take a number of different values.
\fB<character [-character]>\fR means that the character or
one of the characters in the range described between the
two angle brackets is to be typed.
For example \fB<esc>\fR means
the \fBescape\fR key is to be typed.  \fB<a-z>\fR means that a
lower case letter is to be typed.  \fB^<character>\fR means that
the character is to be typed as a \fBcontrol\fR character, that is,
with the \fB<cntl>\fR key held down while simultaneously typing
the specified character.  In this document control characters will
be denoted using the \fIupper case\fR character, but
^<uppercase chr> and ^<lowercase chr> are equivalent.  That is, for
example, \fB<^D>\fR is equal to \fB<^d>\fR.
The most common character abbreviations
used in this list are as follows:
.VL 8
.IP <esc> 8
escape, octal 033
.IP <cr> 8
carriage return, ^M, octal 015
.IP <lf> 8
linefeed ^J, octal 012
.IP <nl> 8
newline, ^J, octal 012 (same as linefeed)
.IP <bs> 8
backspace, ^H, octal 010
.IP <tab> 8
tab, ^I, octal 011
.IP <bell> 8
bell, ^G, octal 07
.IP <ff> 8
formfeed, ^L, octal 014
.IP <sp> 8
space, octal 040
.IP <del> 8
delete, octal 0177
.LE
.sp 1
.NH 1
Basics
.LP
To run \fBvi\fR the shell variable \fBTERM\fR must be defined and
exported to your environment.
How you do this depends on which shell you are using.
You can tell which shell you have by the character it
prompts you for commands with.
The Bourne shell prompts with `$', and the C shell prompts with `%'.
For these examples, we will suppose
that you are using an HP 2621 terminal, whose termcap name is ``2621''.
.NH 2
Bourne Shell
.LP
To manually set your terminal type to 2621 you would type:
.DS
TERM=2621
export TERM
.DE
.PP
There are various ways of having this automatically or
semi-automatically done when you log in.
Suppose you usually dial in on a 2621.
You want to tell this to the machine, but still have it
work when you use a hardwired terminal.
The recommended way, if you have the
.B tset
program, is to use the sequence
.DS
tset \-s \-d 2621 > tset$$
\&. tset$$
rm tset$$
.DE
in your .login (for csh) or the same thing using `.' instead of `source'
in your .profile (for sh).
The above line says that if you are dialing in you are on a 2621,
but if you are on a hardwired terminal it figures out your terminal
type from an on-line list.
.NH 2
The C Shell
.LP
To manually set your terminal type to 2621 you would type:
.DS
setenv TERM 2621
.DE
.PP
There are various ways of having this automatically or
semi-automatically done when you log in.
Suppose you usually dial in on a 2621.
You want to tell this to the machine, but still have it
work when you use a hardwired terminal.
The recommended way, if you have the
.B tset
program, is to use the sequence
.DS
tset \-s \-d 2621 > tset$$
source tset$$
rm tset$$
.DE
in your .login.*
.FS
* On a version 6 system
without environments, the invocation of tset
is simpler, just add the line ``tset \-d 2621''
to your .login or .profile.
.FE
The above line says that if you are dialing in you are on a 2621,
but if you are on a hardwired terminal it figures out your terminal
type from an on-line list.
.NH 1
Normal Commands
.LP
\fBVi\fR is a visual editor with a window on the file.  What
you see on the screen is \fBvi\fR's current notion of
what your file will contain,
(at this point in the file),
when it is written out.
Most commands do not cause any change in the screen until the
complete command is typed.  Should you get confused while
typing a command, you can abort the command by typing an
<del> character.  You will know you are back to command level
when you hear a <bell>.  Usually typing an <esc> will produce the
same result.  When \fBvi\fR gets an improperly formatted command
it rings the <bell>.
Following are the \fBvi\fR commands broken down by function.
.NH 2
Entry and Exit
.LP
To enter
.B vi
on a particular
.I file ,
type
.DS
\fBvi\fP \fIfile\fP
.DE
The file will be read in and the cursor will be placed at the beginning
of the first line.
The first screenfull of the file will be displayed on the terminal.
.PP
To get out of the editor, type
.DS
ZZ
.DE
If you are in some special mode, such as input mode
or the middle of a multi-keystroke command, it may
be necessary to type <esc> first.
.NH 2
Cursor and Page Motion
.LP
.VL 16
.B NOTE:
The arrow keys (see the next four commands)
on certain kinds of terminals will not work with the
PDP-11 version of vi.  The control versions or the hjkl versions will
work on any terminal.  Experienced users prefer the hjkl keys because
they are always right under their fingers.  Beginners often prefer
the arrow keys, since they do not require memorization of which hjkl
key is which.
The mnemonic value of hjkl is clear from looking at the keyboard of an adm3a.
.sp
.IP "[cnt]<bs> or [cnt]h or [cnt]\(<-" 16
.br
Move the cursor to the left one character.  Cursor stops at the left
margin of the page.
If cnt is given, these commands move that many spaces.
.IP "[cnt]^N or [cnt]j or [cnt]\(da or [cnt]<lf>" 16
.br
Move down one line.
Moving off the screen scrolls the window to force a new line
onto the screen.
Mnemonic: \fBN\fRext
.IP "[cnt]^P or [cnt]k or [cnt]\(ua" 16
.br
Move up one line.
Moving off the top of the screen forces new text onto the screen.
Mnemonic: \fBP\fRrevious
.IP "[cnt]<sp> or [cnt]l or [cnt]\(->" 16
.br
Move to the right one character.
Cursor will not go beyond the end of the line.
.IP [cnt]- 16
Move the cursor up the screen to the beginning of the next line.
Scroll if necessary.
.IP "[cnt]+ or [cnt]<cr>" 16
.sp 1
Move the cursor down the screen to the beginning of the next line.
Scroll up if necessary.
.IP "[cnt]$" 16
Move the cursor to the end of the line.
If there is a count, move to the end of the line "cnt" lines
forward in the file.
.IP "^" 16
Move the cursor to the beginning of the first word on the line.
.IP "0" 16
Move the cursor to the left margin of the current line.
.IP "[cnt]|" 16
Move the cursor to the column specified by the count.  The default is
column zero.
.IP "[cnt]w" 16
Move the cursor to the beginning of the next word. If there
is a count, then move forward that many words and
position the cursor at the beginning of the word.
Mnemonic: next-\fBw\fRord
.IP "[cnt]W" 16
Move the cursor to the beginning of the next word which follows
a "white space" (<sp>,<tab>, or <nl>).  Ignore other punctuation.
.IP "[cnt]b" 16
Move the cursor to the preceding word.  Mnemonic: \fBb\fRackup-word
.IP "[cnt]B" 16
Move the cursor to the preceding word that is separated from the
current word by a "white space" (<sp>,<tab>, or <nl>).
.IP "[cnt]e" 16
Move the cursor to the end of the current word or the end of the
"cnt"'th word hence.  Mnemonic: \fBe\fRnd-of-word
.IP "[cnt]E" 16
Move the cursor to the end of the current word which is delimited by
"white space" (<sp>,<tab>, or <nl>).
.IP "[line number]G" 16
.br
Move the cursor to the line specified.  Of particular use are the
sequences "1G" and "G", which move the cursor to the beginning and
the end of the file respectively.  Mnemonic: \fBG\fRo-to
.LP
.B NOTE:
The next four commands (^D, ^U, ^F, ^B)
are not true motion commands, in that they
cannot be used as the object of commands such as delete or change.
.IP "[cnt]^D" 16
Move the cursor down in the file by "cnt" lines (or the last "cnt"
if a new count isn't given.  The initial default is half a page.)  The
screen is simultaneously scrolled up.  Mnemonic: \fBD\fRown
.IP "[cnt]^U" 16
Move the cursor up in the file by "cnt" lines.  The screen is simultaneously
scrolled down.  Mnemonic: \fBU\fRp
.IP "[cnt]^F" 16
Move the cursor to the next page.  A count moves that many pages.
Two lines of the previous page are kept on the screen for continuity if
possible.  Mnemonic: \fBF\fRorward-a-page
.IP "[cnt]^B" 16
Move the cursor to the previous page.  Two lines of the current page
are kept if possible.  Mnemonic: \fBB\fRackup-a-page
.IP "[cnt](" 16
Move the cursor to the beginning of the next sentence.
A sentence is defined as ending with a ".", "!", or "?"
followed by two spaces or a <nl>.
.IP "[cnt])" 16
Move the cursor backwards to the beginning of a sentence.
.IP "[cnt]}" 16
Move the cursor to the beginning of the next paragraph.  This command
works best inside \fBnroff\fR documents.  It understands two sets of
\fBnroff\fR macros, \fB\-ms\fR and \fB\-mm\fR, for which the
commands ".IP", ".LP", ".PP", ".QP", "P", as well as the nroff command ".bp"
are considered to be paragraph delimiters.
A blank line also delimits a paragraph.
The \fBnroff\fR macros that it accepts as paragraph delimiters is
adjustable.  See \fBparagraphs\fR under the \fBSet Commands\fR section.
.IP "[cnt]{" 16
Move the cursor backwards to the beginning of a paragraph.
.IP "]]" 16
Move the cursor to the next "section", where a section is defined by
two sets of \fBnroff\fR macros, \fB\-ms\fR and \fB\-mm\fR, in which
".NH", ".SH", and ".H" delimit a section.  A line beginning with a <ff><nl>
sequence, or a line beginning with a "{" are also considered to
be section delimiters.  The last option makes it
useful for finding the beginnings of C functions.
The \fBnroff\fR macros that are used for section delimiters can be adjusted.
See \fBsections\fR under the \fBSet Commands\fR section.
.IP "[[" 16
Move the cursor backwards to the beginning of a section.
.IP "%" 16
Move the cursor to the matching parenthesis
or brace.  This is very useful in C or lisp code.  If the
cursor is sitting on a \fB( ) {\fR or \fB}\fR the cursor
is moved to the matching character at the other end of the
section.  If the cursor is not sitting on a brace or a
parenthesis, \fBvi\fR searches forward until it finds one
and then jumps to the match mate.
.IP "[cnt]H" 16
If there is no count move the cursor to the top left position on the screen.
If there is a count, then move the cursor to the beginning of the line
"cnt" lines from the top of the screen.  Mnemonic:  \fBH\fRome
.IP "[cnt]L" 16
If there is no count move the cursor to the beginning
of the last line on the screen.
If there is a count, then move the cursor to the beginning of the line
"cnt" lines from the bottom of the screen.  Mnemonic: \fBL\fRast
.IP "M" 16
Move the cursor to the beginning of the middle line on the screen.
Mnemonic: \fBM\fRiddle
.IP "m<a-z>" 16
This command does not move the cursor, but it \fBmarks\fR the place
in the file and the character "<a-z>" becomes the label for referring
to this location in the file.  See the next two commands.  Mnemonic:
\fBm\fRark
.B NOTE:
The mark command is not a motion, and cannot be used as the target
of commands such as delete.
.IP "\(aa<a-z>" 16
Move the cursor to the beginning of the line that is marked with the label
"<a-z>".
.IP "\(ga<a-z>" 16
Move the cursor to the exact position on the line that was marked with
with the label "<a-z>".
.IP "\(aa\(aa" 16
Move the cursor back to the beginning of the line where it was before the
last "non-relative" move.  A "non-relative" move is something such as a
search or a jump to a specific line in the file, rather than moving the
cursor or scrolling the screen.
.IP "\(ga\(ga" 16
Move the cursor back to the exact spot on the line where it was located
before the last "non-relative" move.
.LE
.NH 2
Searches
.LP
The following commands allow you to search for items in a file.
.VL 16
.IP [cnt]f{chr} 16
.sp 1
Search forward on the line for the next or "cnt"'th occurrence of
the character "chr".  The cursor is placed \fBat\fR the character
of interest.  Mnemonic: \fBf\fRind character
.IP [cnt]F{chr} 16
.sp 1
Search backwards on the line for the next or "cnt"'th occurrence of
the character "chr".  The cursor is placed \fBat\fR the character
of interest.
.IP [cnt]t{chr} 16
.sp 1
Search forward on the line for the next or "cnt"'th occurrence of
the character "chr".  The cursor is placed \fBjust preceding\fR
the character of interest.  Mnemonic: move cursor up \fBt\fRo character
.IP [cnt]T{chr} 16
.sp 1
Search backwards on the line for the next or "cnt"'th occurrence of
the character "chr".  The cursor is placed \fBjust preceding\fR
the character of interest.
.IP "[cnt];" 16
Repeat the last "f", "F", "t" or "T" command.
.IP "[cnt]," 16
Repeat the last "f", "F", "t" or "T" command, but in the opposite
search direction.  This is useful if you overshoot.
.IP "[cnt]/[string]/<nl>" 16
.br
Search forward for the next occurrence of "string".
Wrap around at the end of the file
does occur.
The final \fB</>\fR is not required.
.IP "[cnt]?[string]?<nl>" 16
.br
Search backwards for the next occurrence of "string".  If a count is
specified, the count becomes the new window size.  Wrap around at the beginning
of the file does occur.
The final \fB<?>\fR is not required.
.IP n 16
Repeat the last /[string]/ or ?[string]? search.  Mnemonic: \fBn\fRext
occurrence.
.IP N 16
Repeat the last /[string]/ or ?[string]? search, but in the reverse
direction.
.IP ":g/[string]/[editor command]<nl>" 16
.sp 1
Using the \fB:\fR syntax it is possible to do global searches ala the
standard UNIX "ed" editor.
.LE
.NH 2
Text Insertion
.LP
The following commands allow for the insertion of text.  All multicharacter
text insertions are terminated with an <esc> character.
The last change
can always be \fBundone\fR by typing a \fBu\fR.
The text insert in insertion mode can contain newlines.
.VL 16
.IP a{text}<esc> 16
Insert text immediately following the cursor position.
Mnemonic: \fBa\fRppend
.IP A{text}<esc> 16
Insert text at the end of the current line.
Mnemonic: \fBA\fRppend
.IP i{text}<esc> 16
Insert text immediately preceding the cursor position.
Mnemonic: \fBi\fRnsert
.IP I{text}<esc> 16
Insert text at the beginning of the current line.
.IP o{text}<esc> 16
Insert a new line after the line on which the cursor appears and
insert text there.  Mnemonic:  \fBo\fRpen new line
.IP O{text}<esc> 16
Insert a new line preceding the line on which the cursor appears
and insert text there.
.LE
.NH 2
Text Deletion
.LP
The following commands allow the user to delete text in various ways.
All changes can always be \fBundone\fR by typing the \fBu\fR command.
.VL 16
.IP "[cnt]x" 16
Delete the character or characters starting at the cursor position.
.IP "[cnt]X" 16
Delete the character or characters starting at the character preceding
the cursor position.
.IP "D" 16
Deletes the remainder of the line starting at the cursor.
Mnemonic: \fBD\fRelete the rest of line
.IP "[cnt]d{motion}" 16
.br
Deletes one or more occurrences of the specified motion.
Any motion from sections 4.1 and 4.2 can be used here.
The d can be stuttered (e.g. [cnt]dd) to delete cnt lines.
.LE
.NH 2
Text Replacement
.LP
The following commands allow the user to simultaneously delete and
insert new text.  All such actions can be \fBundone\fR by typing
\fBu\fR following the command.
.VL 16
.IP "r<chr>" 16
Replaces the character at the current cursor position with <chr>.  This
is a one character replacement.  No <esc> is required for termination.
Mnemonic:  \fBr\fReplace character
.IP "R{text}<esc>" 16
Starts overlaying the characters on the screen with whatever you type.
It does not stop until an <esc> is typed.
.IP "[cnt]s{text}<esc>" 16
Substitute for "cnt" characters beginning at the current cursor
position.  A "$" will appear at the position in the text where the
"cnt"'th character appears so you will know how much you are erasing.
Mnemonic: \fBs\fRubstitute
.IP "[cnt]S{text}<esc>" 16
Substitute for the entire current line (or lines).  If no count is given,
a "$" appears at the end of the current line.  If a count of more than
1 is given, all the lines to be replaced are deleted before the insertion
begins.
.IP "[cnt]c{motion}{text}<esc>" 16
.br
Change the specified "motion" by replacing it with the
insertion text.  A "$" will appear at the end of the last item
that is being deleted unless the deletion involves whole lines.
Motion's can be any motion from sections 4.1 or 4.2.
Stuttering the c (e.g. [cnt]cc) changes cnt lines.
.LE
.NH 2
Moving Text
.LP
\fBVi\fR provides a number of ways of moving chunks of text around.
There are nine buffers into which each piece of text which is deleted
or "yanked" is put in addition to the "undo" buffer.
The most recent deletion or yank is in the "undo" buffer and also
usually in buffer
1, the next most recent in buffer 2, and so forth.  Each new deletion
pushes down all the older deletions.  Deletions older than 9
disappear.  There is also
a set of named registers, a-z, into which text can optionally
be placed.  If any delete or replacement type command is preceded
by \fB"<a-z>\fR, that named buffer will contain the text deleted
after the command is executed.  For example, \fB"a3dd\fR will delete
three lines starting at the current line and put them in buffer \fB"a\fR.*
.FS
* Referring to an upper case letter as a buffer name (A-Z) is the
same as referring to the lower case letter, except that text placed
in such a buffer is appended to it instead of replacing it.
.FE
There are two more basic commands and
some variations useful in getting and putting text into a file.
.VL 16
.IP ["<a-z>][cnt]y{motion} 16
.sp 1
Yank the specified item or "cnt" items and put in the "undo" buffer or
the specified buffer.  The variety of "items" that can be yanked
is the same as those that can be deleted with the "d" command or
changed with the "c" command.  In the same way that "dd" means
delete the current line and "cc" means replace the current line,
"yy" means yank the current line.
.IP ["<a-z>][cnt]Y 16
Yank the current line or the "cnt" lines starting from the current
line.  If no buffer is specified, they will go into the "undo" buffer,
like any delete would.  It is equivalent to "yy".
Mnemonic:  \fBY\fRank
.IP ["<a-z>]p 16
Put "undo" buffer or the specified buffer down \fBafter\fR the cursor.
If whole lines were yanked or deleted into the buffer, then they will be
put down on the line following the line the cursor is on.  If
something else was deleted, like a word or sentence, then it will
be inserted immediately following the cursor.
Mnemonic:  \fBp\fRut buffer
.IP
It should be noted that text in the named buffers remains there when you
start editing a new file with the \fB:e file<esc>\fR command.  Since
this is so, it is possible to copy or delete text from one file and
carry it over to another file in the buffers.
However, the undo buffer and the ability to undo are lost when
changing files.
.IP ["<a-z>]P 16
Put "undo" buffer or the specified buffer down \fBbefore\fR the cursor.
If whole lines where yanked or deleted into the buffer, then they will be
put down on the line preceding the line the cursor is on.  If
something else was deleted, like a word or sentence, then it will
be inserted immediately preceding the cursor.
.IP [cnt]>{motion} 16
The shift operator will right shift all the text from the line on which
the cursor is located to the line where the \fBmotion\fR is located.
The text is shifted by one \fBshiftwidth\fR.  (See section 6.)
\fB>>\fR means right shift the current line or lines.
.IP [cnt]<{motion} 16
The shift operator will left shift all the text from the line on which
the cursor is located to the line where the \fBitem\fR is located.
The text is shifted by one \fBshiftwidth\fR.  (See section 6.)
\fB<<\fR means left shift the current line or lines.
Once the line has reached the left margin it is not further affected.
.IP [cnt]={motion} 16
Prettyprints the indicated area according to
.B lisp
conventions.
The area should be a lisp s-expression.
.LE
.NH 2
Miscellaneous Commands
.LP
\fBVi\fR has a number of miscellaneous commands that are very
useful.  They are:
.VL 16
.IP ZZ 16
This is the normal way to exit from vi.
If any changes have been made, the file is written out.
Then you are returned to the shell.
.IP ^L 16
Redraw the current screen.  This is useful if someone "write"s you
while you are in "vi" or if for any reason garbage gets onto the
screen.
.IP ^R 16
On dumb terminals, those not having the "delete line" function
(the vt100 is such a terminal), \fBvi\fR saves redrawing the
screen when you delete a line by just marking the line with an
"@" at the beginning and blanking the line.  If you want to
actually get rid of the lines marked with "@" and see what the
page looks like, typing a ^R will do this.
.IP \s+4.\s0 16
"Dot" is a particularly useful command.  It repeats the last
text modifying command.  Therefore you can type a command once and
then to another place and repeat it by just typing ".".
.IP u 16
Perhaps the most important command in the editor,
u undoes the last command that changed the buffer.
Mnemonic:  \fBu\fRndo
.IP U 16
Undo all the text modifying commands performed on the current line
since the last time you moved onto it.
.IP [cnt]J 16
Join the current line and the following line.  The <nl> is deleted
and the two lines joined, usually with a space between the
end of the first line and the beginning of what was the second
line.  If the first line ended with a "period", then two spaces
are inserted.
A count joins the next cnt lines.
Mnemonic: \fBJ\fRoin lines
.IP Q 16
Switch to \fBex\fR editing mode.
In this mode \fBvi\fR will behave very much like \fBed\fR.
The editor in this mode will operate on single lines normally and
will not attempt to keep the "window" up to date.
Once in this mode it is also possible to switch to the \fBopen\fR
mode of editing.  By entering the command \fB[line number]open<nl>\fR
you enter this mode.  It is similar to the normal visual mode
except the window is only \fBone\fR line long.
Mnemonic: \fBQ\fRuit visual mode
.IP ^] 16
An abbreviation for a tag command.
The cursor should be positioned at the beginning of a word.
That word is taken as a tag name, and the tag with that
name is found as if it had been typed in a :tag command.
.IP [cnt]!{motion}{UNIX\ cmd}<nl> 16
.br
Any UNIX filter
(e.g. command that reads the standard input and outputs something
to the standard output) can be sent a section of the current file and
have the output of the command replace the original text.  Useful
examples are programs like \fBcb\fR, \fBsort\fR, and
\fBnroff\fR.  For instance, using \fBsort\fR it would be possible to
sort a section of the current file into a new list.
Using \fB!!\fR means take a line or lines starting at the line the
cursor is currently on and pass them to the UNIX command.
.B NOTE:
To just escape to the shell for one command,
use :!{cmd}<nl>, see section 5.
.IP z{cnt}<nl> 16
This resets the current window size to "cnt" lines and redraws the screen.
.LE
.NH 2
Special Insert Characters
.LP
There are some characters that have special meanings during
insert modes.  They are:
.VL 16
.IP ^V 16
During inserts, typing a ^V allows you to quote control characters
into the file.  Any character typed after the ^V will be inserted
into the file.
.IP [^]^D\ or\ [0]^D 16
<^D> without any argument backs up one \fBshiftwidth\fR.  This is necessary
to remove indentation that was inserted by the \fBautoindent\fR feature.
^<^D> temporarily removes all the autoindentation, thus placing the cursor
at the left margin.  On the next line, the previous indent level will be
restored.  This is useful for putting "labels" at the left margin.
0<^D> says remove all autoindents and stay that way.  Thus the cursor
moves to the left margin and stays there on successive lines until
<tab>'s are typed.  As with the <tab>, the <^D> is only effective before
any other "non-autoindent" controlling characters are typed.
Mnemonic: \fBD\fRelete a shiftwidth
.IP ^W 16
If the cursor is sitting on a word, <^W> moves the cursor back to the beginning
of the word, thus erasing the word from the insert.
Mnemonic: erase \fBW\fRord
.IP <bs> 16
The backspace always serves as an erase during insert modes in addition
to your normal "erase" character.  To insert a <bs> into your file, use
the <^V> to quote it.
.LE
.NH 1
\fB:\fR Commands
.LP
Typing a ":" during command mode causes \fBvi\fR to put the cursor at
the bottom on the screen in preparation for a command.  In the
":" mode, \fBvi\fR can be given most \fBed\fR commands.  It is
also from this mode that you exit from \fBvi\fR or switch to different
files.  All commands of this variety are terminated by a <nl>, <cr>,
or <esc>.
.VL 16
.IP ":w[!] [file]" 16
Causes \fBvi\fR to write out the current text to the disk.  It is
written to the file you are editing unless "file" is supplied.  If
"file" is supplied, the write is directed to that file instead.  If
that file already exists, \fBvi\fR will not perform the write unless
the "!" is supplied indicating you
.I really
want to destroy the older copy of the file.
.IP :q[!] 16
Causes \fBvi\fR to exit.  If you have modified the file you are
looking at currently and haven't written it out, \fBvi\fR will
refuse to exit unless the "!" is supplied.
.IP ":e[!] [+[cmd]] [file]" 16
.sp 1
Start editing a new file called "file" or start editing the current
file over again.  The command ":e!" says "ignore the changes I've made
to this file and start over from the beginning".  It is useful if
you really mess up the file.  The optional "+" says instead of starting
at the beginning, start at the "end", or,
if "cmd" is supplied, execute "cmd" first.
Useful cases of this are where cmd is "n" (any integer) which starts
at line number n,
and "/text", which searches for "text" and starts at the line where
it is found.
.IP "^^" 16
Switch back to the place you were before your last tag command.
If your last tag command stayed within the file, ^^ returns to that tag.
If you have no recent tag command, it will return to the
same place in the previous file that it was showing when you switched
to the current file.
.IP ":n[!]" 16
Start editing the next file in the argument list.  Since \fBvi\fR
can be called with multiple file names, the ":n" command tells it to
stop work on the current file and switch to the next file.  If the
current file was modifies, it has to be written out before the ":n"
will work or else the "!" must be supplied, which says discard the
changes I made to the current file.
.IP ":n[!] file [file file ...]" 16
.sp
Replace the current argument list with a new list of files and start
editing the first file in this new list.
.IP ":r file" 16
Read in a copy of "file" on the line after the cursor.
.IP ":r !cmd" 16
Execute the "cmd" and take its output and put it into the file after
the current line.
.IP ":!cmd" 16
Execute any UNIX shell command.
.IP ":ta[!] tag" 16
.B Vi
looks in the file named
.B tags
in the current directory.
.B Tags
is a file of lines in the format:
.sp 1
.ti +8
tag filename \fBvi\fR-search-command
.sp 1
If \fBvi\fR finds the tag you specified in the \fB:ta\fR command,
it stops editing the current file if necessary and if the current file is
up to date on the disk and switches to the file specified and uses the
search pattern specified to find the "tagged" item of interest.  This
is particularly useful when editing multi-file C programs such as the
operating system.  There is a program called \fBctags\fR which will
generate an appropriate \fBtags\fR file for C and f77
programs so that by saying
\fB:ta function<nl>\fR you will be switched to that function.
It could also be useful when editing multi-file documents, though the
\fBtags\fR file would have to be generated manually.
.LE
.NH 1
Special Arrangements for Startup
.PP
\fBVi\fR takes the value of \fB$TERM\fR and looks up the characteristics
of that terminal in the file \fB/etc/termcap\fR.
If you don't know \fBvi\fR's name for the terminal you are working
on, look in \fB/etc/termcap\fR.
.PP
When \fBvi\fR starts, it attempts to read the variable EXINIT
from your environment.*
If that exists, it takes the values in it as the default values
for certain of its internal constants.  See the section on "Set Values"
for further details.
If EXINIT doesn't exist you will get all the normal defaults.
.FS
* On version 6 systems
Instead of EXINIT, put the startup commands in the file .exrc
in your home directory.
.FE
.PP
Should you inadvertently hang up the phone while inside
.B vi ,
or should the computer crash,
all may not be lost.
Upon returning to the system, type:
.DS
vi \-r file
.DE
This will normally recover the file.  If there is more than one
temporary file for a specific file name, \fBvi\fR recovers the
newest one.  You can get an older version by recovering the
file more than once.
The command "vi -r" without a file name gives you the list of files
that were saved in the last system crash
(but
.I not
the file just saved when the phone was hung up).
.NH 1
Set Commands
.LP
\fBVi\fR has a number of internal variables and switches which can be
set to achieve special affects.
These options come in three forms, those that are switches, which toggle
from off to on and back, those that require a numeric value, and those
that require an alphanumeric string value.
The toggle options are set by a command of the form:
.DS
:set option<nl>
.DE
and turned off with the command:
.DS
:set nooption<nl>
.DE
Commands requiring a value are set with a command of the form:
.DS
:set option=value<nl>
.DE
To display the value of a specific option type:
.DS
:set option?<nl>
.DE
To display only those that you have changed type:
.DS
:set<nl>
.DE
and to display the long table of all the settable parameters and
their current values type:
.DS
:set all<nl>
.DE
.PP
Most of the options have a long form and an abbreviation.  Both are
listed in the following table as well as the normal default value.
.PP
To arrange to have values other than the default used every time you
enter
.B vi ,
place the appropriate
.B set
command in EXINIT in your environment, e.g.
.DS
EXINIT='set ai aw terse sh=/bin/csh'
export EXINIT
.DE
or
.DS
setenv EXINIT 'set ai aw terse sh=/bin/csh'
.DE
for
.B sh
and
.B csh ,
respectively.
These are usually placed in your .profile or .login.
If you are running a system without environments (such as version 6)
you can place the set command in the file .exrc in your home
directory.
.VL 16
.IP autoindent\ ai 16
Default: noai Type: toggle
.br
When in autoindent mode, vi helps you indent code by starting each
line in the same column as the preceding line.
Tabbing to the right with <tab> or <^T> will move this boundary to
the right, and it can be moved to the left with <^D>.
.IP autoprint\ ap 16
Default: ap Type: toggle
.br
Causes the current line to be printed after each ex text modifying command.
This is not of much interest in the normal \fBvi\fR visual mode.
.IP autowrite\ aw 16
Default: noaw type: toggle
.br
Autowrite causes an automatic write to be done if there are unsaved
changes before certain commands which change files or otherwise
interact with the outside world.
These commands are :!, :tag, :next, :rewind, ^^, and ^].
.IP beautify\ bf 16
Default: nobf Type: toggle
.br
Causes all control characters except <tab>, <nl>, and <ff> to be discarded.
.IP directory\ dir 16
Default: dir=/tmp Type: string
.br
This is the directory in which \fBvi\fR puts its temporary file.
.IP errorbells\ eb 16
Default: noeb Type: toggle
.br
Error messages are preceded by a <bell>.
.IP hardtabs\ ht 16
Default: hardtabs=8 Type: numeric
.br
This option contains the value of hardware tabs in your terminal, or
of software tabs expanded by the Unix system.
.IP ignorecase\ ic 16
Default: noic Type: toggle
.br
All upper case characters are mapped to lower case in regular expression
matching.
.IP lisp 16
Default: nolisp Type: toggle
.br
Autoindent for \fBlisp\fR code.  The commands \fB( ) [[\fR and \fB]]\fR
are modified appropriately to affect s-expressions and functions.
.IP list 16
Default: nolist Type: toggle
.br
All printed lines have the <tab> and <nl> characters displayed visually.
.IP magic 16
Default: magic Type: toggle
.br
Enable the metacharacters for matching.  These include \fB. * < > [string]
[^string]\fR and \fB[<chr>-<chr>]\fR.
.IP number\ nu 16
Default: nonu Type: toggle
.br
Each line is displayed with its line number.
.IP open 16
Default: open Type: toggle
.br
When set, prevents entering open or visual modes from ex or edit.
Not of interest from vi.
.IP optimize\ opt 16
Default: opt Type: toggle
.br
Basically of use only when using the \fBex\fR capabilities.  This
option prevents automatic <cr>s from taking place,
and speeds up output of indented lines,
at the expense of losing typeahead on some versions of UNIX.
.IP paragraphs\ para 16
Default: para=IPLPPPQPP\ bp Type: string
.br
Each pair of characters in the string indicate \fBnroff\fR macros
which are to be treated as the beginning of a paragraph for the
\fB{\fR and \fB}\fR commands.  The default string is for the \fB-ms\fR
and \fB-mm\fR macros.
To indicate one letter \fBnroff\fR macros, such as \fB.P\fR or \fB.H\fR,
quote a space in for the second character position.  For example:
.sp 1
.ti +8
:set paragraphs=P\e bp<nl>
.sp 1
would cause \fBvi\fR to consider \fB.P\fR and \fB.bp\fR as paragraph
delimiters.
.IP prompt 16
Default: prompt Type: toggle
.br
In
.B ex
command mode the prompt character \fB:\fR will be printed when
\fBex\fR is waiting for a command.  This is not of interest from vi.
.IP redraw 16
Default: noredraw Type: toggle
.br
On dumb terminals, force the screen to always be up to date,
by sending great amounts of output.  Useful only at high speeds.
.IP report 16
Default: report=5 Type: numeric
.br
This sets the threshold for the number of lines modified.  When
more than this number of lines are modified, removed, or yanked,
\fBvi\fR will report the number of lines changed at the bottom of
the screen.
.IP scroll 16
Default: scroll={1/2 window} Type: numeric
.br
This is the number of lines that the screen scrolls up or down when
using the <^U> and <^D> commands.
.IP sections 16
Default: sections=SHNHH HU Type: string
.br
Each two character pair of this string specify \fBnroff\fR macro names
which are to be treated as the beginning of a section by the
\fB]]\fR and \fB[[\fR commands.  The default string is for the \fB-ms\fR
and \fB-mm\fR macros.
To enter one letter \fBnroff\fR macros, use a quoted space as the
second character.
See \fBparagraphs\fR for a fuller explanation.
.IP shell\ sh 16
Default: sh=from environment SHELL or /bin/sh   Type: string
.br
This is the name of the \fBsh\fR to be used for "escaped" commands.
.IP shiftwidth\ sw 16
Default: sw=8 Type: numeric
.br
This is the number of spaces that a <^T> or <^D> will move over for
indenting, and the amount < and > shift by.
.IP showmatch\ sm 16
Default: nosm Type: toggle
.br
When a \fB)\fR or \fB}\fR is typed, show the matching \fB(\fR or \fB{\fR
by moving the cursor to it for one second if it is on the current screen.
.IP slowopen\ slow 16
Default: terminal dependent Type: toggle
.br
On terminals that are slow and unintelligent, this option prevents the
updating of the screen some of the time to improve speed.
.IP tabstop\ ts 16
Default: ts=8 Type: numeric
.br
<tab>s are expanded to boundaries that are multiples of this value.
.IP taglength\ tl 16
Default: tl=0 Type: numeric
.br
If nonzero, tag names are only significant to this many characters.
.IP term 16
Default: (from environment \fBTERM\fP, else dumb) Type: string
.br
This is the terminal and controls the visual displays.  It cannot be
changed when in "visual" mode,
you have to Q to command mode, type a
set term command, and do ``vi.'' to get back into visual.
Or exit vi, fix $TERM, and reenter.
The definitions that drive a particular
terminal type are found in the file \fB/etc/termcap\fR.
.IP terse 16
Default: terse Type: toggle
.br
When set, the error diagnostics are short.
.IP warn 16
Default: warn Type: toggle
.br
The user is warned if she/he tries to escape to
the shell without writing out the current changes.
.IP window 16
Default: window={8 at 600 baud or less, 16 at 1200 baud, and screen
size \- 1 at 2400 baud or more} Type: numeric
.br
This is the number of lines in the window whenever \fBvi\fR must redraw
an entire screen.  It is useful to make this size smaller if you are
on a slow line.
.IP w300,\ w1200,\ w9600
.br
These set window, but only within the corresponding speed ranges.
They are useful in an EXINIT to fine tune window sizes.
For example,
.DS
set w300=4 w1200=12
.DE
causes a 4 lines window at speed up to 600 baud, a 12 line window at 1200
baud, and a full screen (the default) at over 1200 baud.
.IP wrapscan\ ws 16
Default: ws Type: toggle
.br
Searches will wrap around the end of the file when is option is set.  When
it is off, the search will terminate when it reaches the end or the
beginning of the file.
.IP wrapmargin\ wm 16
Default: wm=0 Type: numeric
.br
\fBVi\fR will automatically insert a <nl> when it finds a natural
break point (usually a <sp> between words) that occurs within
"wm" spaces of the right margin.
Therefore with "wm=0" the option is off.  Setting it to 10 would
mean that any time you are within 10 spaces of the right margin
\fBvi\fR would be looking for a <sp> or <tab> which it could
replace with a <nl>.  This is convenient for people who forget
to look at the screen while they type.
(In version 3, wrapmargin behaves more like nroff, in that the
boundary specified by the distance from the right edge of the screen
is taken as the rightmost edge of the area where a break is allowed,
instead of the leftmost edge.)
.IP writeany\ wa 16
Default: nowa Type: toggle
.br
\fBVi\fR normally makes a number of checks before it writes out a file.
This prevents the user from inadvertently destroying a file.  When the
"writeany" option is enabled, \fBvi\fR no longer makes these checks.
.LE
.\" Copyright (c) 1980, 1993
.\"	The Regents of the University of California.  All rights reserved.
.\"
.\" Redistribution and use in source and binary forms, with or without
.\" modification, are permitted provided that the following conditions
.\" are met:
.\" 1. Redistributions of source code must retain the above copyright
.\"    notice, this list of conditions and the following disclaimer.
.\" 2. Redistributions in binary form must reproduce the above copyright
.\"    notice, this list of conditions and the following disclaimer in the
.\"    documentation and/or other materials provided with the distribution.
.\" 3. All advertising materials mentioning features or use of this software
.\"    must display the following acknowledgement:
.\"	This product includes software developed by the University of
.\"	California, Berkeley and its contributors.
.\" 4. Neither the name of the University nor the names of its contributors
.\"    may be used to endorse or promote products derived from this software
.\"    without specific prior written permission.
.\"
.\" THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
.\" ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
.\" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
.\" ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
.\" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
.\" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
.\" OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
.\" HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
.\" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
.\" OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
.\" SUCH DAMAGE.
.\"
.\"	@(#)vi.summary	8.3 (Berkeley) 8/18/96
.\"
.ds CH
.ds CF
.de TS
.br
.if !\\n(1T .RT
.ul 0
.ti \\n(.iu
.if t .sp 0.25
.if n .sp
.if \\$1H .TQ
.nr IX 1
..
.nr PS 9
.ps 9
.nr VS 11
.vs 11
.nr HM .50i
.nr FM .25i
.nr PO 1.0i
.po 1.0i
.nr LL 4.5i
.ll 4.5i
.de nc
.bp
..
.de h
.LG
.B
\\$1
.R
.NL
..
.LG
.LG
.B
.ce
Ex Quick Reference
.R
.NL
.LP
.LP
.h "Entering/leaving ex"
.TS
aw(1.4i)b aw(1.8i).
% ex \fIname\fP	edit \fIname\fP, start at end
% ex +\fIn\fP \fIname\fP	... at line \fIn\fP
% ex \-t \fItag\fP	start at \fItag\fP
% ex \-r	list saved files
% ex \-r \fIname\fP	recover file \fIname\fP
% ex \fIname\fP ...	edit first; rest via \fB:n\fP
% ex \-R \fIname\fP 	read only mode
: x	exit, saving changes
: q!	exit, discarding changes
.TE
.h "Ex states"
.TS
lw(1i) lw(2.0i).
Command	T{
Normal and initial state.  Input prompted for by \fB:\fP.
Your kill character cancels partial command.
T}
Insert	T{
Entered by \fBa\fP \fBi\fP and \fBc\fP.
Arbitrary text then terminates with line having only \fB.\fP
character on it or abnormally with interrupt.
T}
Open/visual	T{
Entered by \fBopen\fP or \fBvi\fP, terminates with \fBQ\fP
or ^\e.
T}
.TE
.h "Ex commands"
.TS
lw(.45i) lw(.08i)b lw(.45i) lw(.08i)b lw(.45i) lw(.08i)b.
abbrev	ab	next	n	unabbrev	una
append	a	number	nu	undo	u
args	ar	open	o	unmap	unm
change	c	preserve	pre	version	ve
copy	co	print	p	visual	vi
delete	d	put	pu	write	w
edit	e	quit	q	xit	x
file	f	read	re	yank	ya
global	g	recover	rec	\fIwindow\fP	z
insert	i	rewind	rew	\fIescape\fP	!
join	j	set	se	\fIlshift\fP	<
list	l	shell	sh	\fIprint next\fP	\fRCR\fP
map		source	so	\fIresubst\fP	&
mark	ma	stop	st	\fIrshift\fP	>
move	m	substitute	s	\fIscroll\fP	^D
.TE
.h "Ex command addresses"
.TS
lw(.3i)b lw(0.8i) lw(.3i)b lw(0.8i).
\fIn\fP	line \fIn\fP	/\fIpat\fP	next with \fIpat\fP
\&.	current	?\fIpat\fP	previous with \fIpat\fP
$	last	\fIx\fP-\fIn\fP	\fIn\fP before \fIx\fP
+	next	\fIx\fP,\fIy\fP	\fIx\fP through \fIy\fP
\-	previous	\(aa\fIx\fP	marked with \fIx\fP
+\fIn\fP	\fIn\fP forward	\(aa\(aa	previous context
%	1,$
.TE
.nc
.h "Specifying terminal type"
.TS
aw(1.7i)b aw(1.5i).
% setenv TERM \fItype\fP	\fIcsh\fP and all version 6
$ TERM=\fItype\fP; export TERM	\fIsh\fP in Version 7
See also \fItset\fR(1)
.TE
.h "Some terminal types"
.TS
lw(.4i) lw(.4i) lw(.4i) lw(.4i) lw(.4i).
2621	43	adm31	dw1	h19
2645	733	adm3a	dw2	i100
300s	745	c100	gt40	mime
33	act4	dm1520	gt42	owl
37	act5	dm2500	h1500	t1061
4014	adm3	dm3025	h1510	vt52
.TE
.h "Initializing options"
.TS
lw(.9i)b aw(1.5i).
EXINIT	place \fBset\fP's here in environment var.
set \fIx\fP	enable option
set no\fIx\fP	disable option
set \fIx\fP=\fIval\fP	give value \fIval\fP
set	show changed options
set all	show all options
set \fIx\fP?	show value of option \fIx\fP
.TE
.h "Useful options"
.TS
lw(.9i)b lw(.3i) lw(1.0i).
autoindent	ai	supply indent
autowrite	aw	write before changing files
ignorecase	ic	in scanning
lisp		\fB( ) { }\fP are s-exp's
list		print ^I for tab, $ at end
magic		\fB. [ *\fP special in patterns
number	nu	number lines
paragraphs	para	macro names which start ...
redraw		simulate smart terminal
scroll		command mode lines
sections	sect	macro names ...
shiftwidth	sw	for \fB< >\fP, and input \fB^D\fP
showmatch	sm	to \fB)\fP and \fB}\fP as typed
slowopen	slow	choke updates during insert
window		visual mode lines
wrapscan	ws	around end of buffer?
wrapmargin	wm	automatic line splitting
.TE
.LP
.h "Scanning pattern formation"
.TS
aw(.9i)b aw(1.0i).
\(ua	beginning of line
$	end of line
\fB.\fR	any character
\e<	beginning of word
\e>	end of word
[\fIstr\fP]	any char in \fIstr\fP
[\(ua\fIstr\fP]	... not in \fIstr\fP
[\fIx\-y\fP]	... between \fIx\fP and \fIy\fP
*	any number of preceding
.TE
.nc
.LP
.LG
.LG
.B
.ce
Vi Quick Reference
.NL
.R
.LP
.LP
.h "Entering/leaving vi"
.TS
aw(1.4i)b aw(1.8i).
% vi \fIname\fP	edit \fIname\fP at top
% vi +\fIn\fP \fIname\fP	... at line \fIn\fP
% vi + \fIname\fP	... at end
% vi \-r	list saved files
% vi \-r \fIname\fP	recover file \fIname\fP
% vi \fIname\fP ...	edit first; rest via \fB:n\fP
% vi \-t \fItag\fP	start at \fItag\fP
% vi +/\fIpat\fP \fIname\fP	search for \fIpat\fP
% view \fIname\fP	read only mode
ZZ	exit from vi, saving changes
^Z	stop vi for later resumption
.TE
.h "The display"
.TS
lw(.75i) lw(2.2i).
Last line	T{
Error messages, echoing input to \fB: / ?\fP and \fB!\fR,
feedback about i/o and large changes.
T}
@ lines	On screen only, not in file.
~ lines	Lines past end of file.
^\fIx\fP	Control characters, ^? is delete.
tabs	Expand to spaces, cursor at last.
.TE
.LP
.h "Vi states"
.TS
lw(.75i) lw(2.2i).
Command	T{
Normal and initial state.  Others return here.
ESC (escape) cancels partial command.
T}
Insert	T{
Entered by \fBa i A I o O c C s S\fP \fBR\fP.
Arbitrary text then terminates with ESC character,
or abnormally with interrupt.
T}
Last line	T{
Reading input for \fB: / ?\fP or \fB!\fP; terminate
with ESC or CR to execute, interrupt to cancel.
T}
.TE
.h "Counts before vi commands"
.TS
lw(1.5i) lw(1.7i)b.
line/column number	z  G  |	
scroll amount	^D  ^U
replicate insert	a  i  A  I
repeat effect	\fRmost rest\fP
.TE
.h "Simple commands"
.TS
lw(1.5i)b lw(1.7i).
dw	delete a word
de	... leaving punctuation
dd	delete a line
3dd	... 3 lines
i\fItext\fP\fRESC\fP	insert text \fIabc\fP
cw\fInew\fP\fRESC\fP	change word to \fInew\fP
ea\fIs\fP\fRESC\fP	pluralize word
xp	transpose characters
.TE
.nc
.h "Interrupting, cancelling"
.TS
aw(0.75i)b aw(1.6i).
ESC	end insert or incomplete cmd
^?	(delete or rubout) interrupts
^L	reprint screen if \fB^?\fR scrambles it
.TE
.h "File manipulation"
.TS
aw(0.75i)b aw(1.6i).
:w	write back changes
:wq	write and quit
:q	quit
:q!	quit, discard changes
:e \fIname\fP	edit file \fIname\fP
:e!	reedit, discard changes
:e + \fIname\fP	edit, starting at end
:e +\fIn\fR	edit starting at line \fIn\fR
:e #	edit alternate file
^\(ua	synonym for \fB:e #\fP
:w \fIname\fP	write file \fIname\fP
:w! \fIname\fP	overwrite file \fIname\fP
:sh	run shell, then return
:!\fIcmd\fP	run \fIcmd\fR, then return
:n	edit next file in arglist
:n \fIargs\fP	specify new arglist
:f	show current file and line
^G	synonym for \fB:f\fP
:ta \fItag\fP	to tag file entry \fItag\fP
^]	\fB:ta\fP, following word is \fItag\fP
.TE
.h "Positioning within file"
.TS
aw(0.75i)b aw(1.6i).
^F	forward screenfull
^B	backward screenfull
^D	scroll down half screen
^U	scroll up half screen
G	goto line (end default)
/\fIpat\fR	next line matching \fIpat\fR
?\fIpat\fR	prev line matching \fIpat\fR
n	repeat last \fB/\fR or \fB?\fR
N	reverse last \fB/\fR or \fB?\fR
/\fIpat\fP/+\fIn\fP	n'th line after \fIpat\fR
?\fIpat\fP?\-\fIn\fP	n'th line before \fIpat\fR
]]	next section/function
[[	previous section/function
%	find matching \fB( ) {\fP or \fB}\fP
.TE
.h "Adjusting the screen"
.TS
aw(0.75i)b aw(1.6i).
^L	clear and redraw
^R	retype, eliminate @ lines
z\fRCR\fP	redraw, current at window top
z\-	... at bottom
z\|.	... at center
/\fIpat\fP/z\-	\fIpat\fP line at bottom
z\fIn\fP\|.	use \fIn\fP line window
^E	scroll window down 1 line
^Y	scroll window up 1 line
.TE
.nc
.h "Marking and returning
.TS
aw(0.5i)b aw(2.0i).
\(ga\(ga	previous context
\(aa\(aa	... at first non-white in line
m\fIx\fP	mark position with letter \fIx\fP
\(ga\fIx\fP	to mark \fIx\fP
\(aa\fIx\fP	... at first non-white in line
.TE
.h "Line positioning"
.TS
aw(0.5i)b aw(2.0i).
H	home window line
L	last window line
M	middle window line
+	next line, at first non-white
\-	previous line, at first non-white
\fRCR\fP	return, same as +
\(da \fRor\fP j	next line, same column
\(ua \fRor\fP k	previous line, same column
.TE
.h "Character positioning"
.TS
aw(0.5i)b aw(2.0i).
\(ua	first non white
0	beginning of line
$	end of line
h \fRor\fP \(->	forward
l \fRor\fP \(<-	backwards
^H	same as \fB\(<-\fP
\fRspace\fP	same as \fB\(->\fP
f\fIx\fP	find \fIx\fP forward
F\fIx\fP	\fBf\fR backward
t\fIx\fP	upto \fIx\fP forward
T\fIx\fP	back upto \fIx\fP
;	repeat last \fBf F t\fP or \fBT\fP
,	inverse of \fB;\fP
|	to specified column
%	find matching \fB( { )\fP or \fB}\fR
.TE
.h "Words, sentences, paragraphs"
.TS
aw(0.5i)b aw(2.0i).
w	word forward
b	back word
e	end of word
)	to next sentence
}	to next paragraph
(	back sentence
{	back paragraph
W	blank delimited word
B	back \fBW\fP
E	to end of \fBW\fP
.TE
.h "Commands for \s-2LISP\s0"
.TS
aw(0.5i)b aw(2.0i).
)	Forward s-expression
}	... but don't stop at atoms
(	Back s-expression
{	... but don't stop at atoms
.TE
.nc
.h "Corrections during insert"
.TS
aw(.5i)b aw(2.0i).
^H	erase last character
^W	erases last word
\fRerase\fP	your erase, same as \fB^H\fP
\fRkill\fP	your kill, erase input this line
\e	escapes \fB^H\fR, your erase and kill
\fRESC\fP	ends insertion, back to command
^?	interrupt, terminates insert
^D	backtab over \fIautoindent\fP
\(ua^D	kill \fIautoindent\fP, save for next
0^D	... but at margin next also
^V	quote non-printing character
.TE
.h "Insert and replace"
.TS
aw(.5i)b aw(2.0i).
a	append after cursor
i	insert before
A	append at end of line
I	insert before first non-blank
o	open line below
O	open above
r\fIx\fP	replace single char with \fIx\fP
R	replace characters
.TE
.h "Operators (double to affect lines)"
.TS
aw(0.5i)b aw(2.0i).
d	delete
c	change
<	left shift
>	right shift
!	filter through command
\&=	indent for \s-2LISP\s0
y	yank lines to buffer
.TE
.h "Miscellaneous operations"
.TS
aw(0.5i)b aw(2.0i).
C	change rest of line
D	delete rest of line
s	substitute chars
S	substitute lines
J	join lines
x	delete characters
X	... before cursor
Y	yank lines
.TE
.h "Yank and put"
.TS
aw(0.5i)b aw(2.0i).
p	put back lines
P	put before
"\fIx\fPp	put from buffer \fIx\fP
"\fIx\fPy	yank to buffer \fIx\fP
"\fIx\fPd	delete into buffer \fIx\fP
.TE
.h "Undo, redo, retrieve"
.TS
aw(0.5i)b aw(2.0i).
u	undo last change
U	restore current line
\fB.\fP	repeat last change
"\fId\fP\|p	retrieve \fId\fP'th last delete
.TE
