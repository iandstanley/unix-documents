.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)tabs	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.ta 5n 10n 15n 20n 25n 30n 35n 40n 45n 50n 55n 60n 65n 70n 75n 80n
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.1	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.EH 'USD:4-%''An Introduction to the C shell'
.OH 'An Introduction to the C shell''USD:4-%'
.\".RP
.TL
An Introduction to the C shell
.AU
William Joy
(revised for 4.3BSD by Mark Seiden)
.AI
Computer Science Division
.br
Department of Electrical Engineering and Computer Science
.br
University of California, Berkeley
.br
Berkeley, California 94720
.AB
.I Csh
is a new command language interpreter for
.UX
systems.
It incorporates good features of other shells and a
.I history
mechanism similar to the
.I redo
of \s-2INTERLISP\s0.
While incorporating many features of other shells which make
writing shell programs (shell scripts) easier,
most of the features unique to
.I csh
are designed more for the interactive \s-2UNIX\s0 user.
.PP
\s-2UNIX\s0
users who have read a general introduction to the system
will find a valuable basic explanation of the shell here.
Simple terminal interaction with
.I csh
is possible after reading just the first section of this document.
The second section describes the shell's capabilities which you can
explore after you have begun to become acquainted with the shell.
Later sections introduce features which are useful, but not necessary
for all users of the shell.
.PP
Additional information includes an appendix listing special characters of the shell
and a glossary of terms and commands introduced in this manual.
.AE
.SH
.if n .ND
Introduction
.PP
A
.I shell
is a command language interpreter.
.I Csh
is the name of one particular command interpreter on
\s-2UNIX\s0.
The primary purpose of
.I csh
is to translate command lines typed at a terminal into
system actions, such as invocation of other programs.
.I Csh
is a user program just like any you might write.
Hopefully,
.I csh
will be a very useful program for you
in interacting with the \s-2UNIX\s0 system.
.PP
In addition to this document, you will want to refer to a copy
of the \s-2UNIX\s0 User Reference Manual.
The
.I csh
documentation in section 1 of the manual provides a full description of all
features of the shell and is the definitive reference for questions
about the shell.
.PP
Many words in this document are shown in
.I italics.
These are important words;
names of commands, and words which have special meaning in discussing
the shell and \s-2UNIX\s0.
Many of the words are defined in a glossary at the end of this document.
If you don't know what is meant by a word, you should look
for it in the glossary.
.SH
Acknowledgements
.PP
Numerous people have provided good input about previous versions
of
.I csh
and aided in its debugging and in the debugging of its documentation.
I would especially like to thank Michael Ubell
who made the crucial observation that history commands could be
done well over the word structure of input text, and implemented
a prototype history mechanism in an older version of the shell.
Eric Allman has also provided a large number of useful comments on the
shell, helping to unify those concepts which are present and to identify
and eliminate useless and marginally useful features.
Mike O'Brien suggested the pathname hashing
mechanism which speeds command execution.
Jim Kulp added the job control and directory stack primitives and
added their documentation to this introduction.
.br
.bp
.NH
Terminal usage of the shell
.NH 2
The basic notion of commands
.PP
A
.I shell
in
\s-2UNIX\s0
acts mostly as a medium through which other
.I programs
are invoked.
While it has a set of
.I builtin
functions which it performs directly,
most commands cause execution of programs that are, in fact,
external to the shell.
The shell is thus distinguished from the command interpreters of other
systems both by the fact that it is just a user program, and by the fact
that it is used almost exclusively as a mechanism for invoking other programs.
.PP
.I Commands
in the \s-2UNIX\s0 system consist of a list of strings or
.I words
interpreted as a
.I "command name"
followed by
.I arguments.
Thus the command
.DS
mail bill
.DE
consists of two words.
The first word
.I mail
names the command to be executed, in this case the
mail program which sends messages to other users.
The shell uses the name of the command in attempting to execute it for you.
It will look in a number of
.I directories
for a file with the name
.I mail
which is expected to contain the mail program.
.PP
The rest of the words of the command are given as
.I arguments
to the command itself when it is executed.
In this case we specified also the argument
.I bill
which is interpreted by the
.I mail
program to be the name of a user to whom mail is to be sent.
In normal terminal usage we might use the
.I mail
command as follows.
.DS
% mail bill
I have a question about the csh documentation.
My document seems to be missing page 5.
Does a page five exist?
	Bill
EOT
%
.DE
.PP
Here we typed a message to send to
.I bill
and ended this message with a ^D which sent an end-of-file to
the mail program.
(Here and throughout this document, the notation ``^\fIx\fR''
is to be read ``control-\fIx\fR'' and represents the striking of the \fIx\fR
key while the control key is held down.)
The mail program
then echoed the characters `EOT' and transmitted our message.
The characters `% ' were printed before and after the mail command
by the shell to indicate that input was needed.
.PP
After typing the `% ' prompt the shell was reading command input from
our terminal.
We typed a complete command `mail bill'.
The shell then executed the
.I mail
program with argument
.I bill
and went dormant waiting for it to complete.
The mail program then read input from our terminal until we signalled
an end-of-file via typing a ^D after which the shell noticed
that mail had completed
and signaled us that it was ready to read from the terminal again by
printing another `% ' prompt.
.PP
This is the essential pattern of all interaction with \s-2UNIX\s0
through the shell.
A complete command is typed at the terminal, the shell executes
the command and when this execution completes, it prompts for a new command.
If you run the editor for an hour, the shell will patiently wait for
you to finish editing and obediently prompt you again whenever you finish
editing.
.PP
An example of a useful command you can execute now is the
.I tset
command, which sets the default
.I erase
and
.I kill
characters on your terminal \- the erase character erases the last
character you typed and the kill character erases the entire line you
have entered so far.
By default, the erase character is the delete key (equivalent to `^?')
and the kill character is `^U'.  Some people prefer to make the erase character
the backspace key (equivalent to `^H').
You can make this be true by typing
.DS
tset \-e
.DE
which tells the program
.I tset
to set the erase character to tset's default setting for this character
(a backspace).
.NH 2
Flag arguments
.PP
A useful notion in \s-2UNIX\s0 is that of a
.I flag
argument.
While many arguments to commands specify file names or user names,
some arguments rather specify an optional capability of the command
which you wish to invoke.
By convention, such arguments begin with the character `\-' (hyphen).
Thus the command
.DS
ls
.DE
will produce a list of the files in the current
.I "working directory" .
The option
.I \-s
is the size option, and
.DS
ls \-s
.DE
causes
.I ls
to also give, for each file the size of the file in blocks of 512
characters.
The manual section for each command in the \s-2UNIX\s0 reference manual
gives the available options for each command.
The
.I ls
command has a large number of useful and interesting options.
Most other commands have either no options or only one or two options.
It is hard to remember options of commands which are not used very
frequently, so most \s-2UNIX\s0 utilities perform only one or two functions
rather than having a large number of hard to remember options.
.NH 2
Output to files
.PP
Commands that normally read input or write output on the terminal
can also be executed with this input and/or output done to
a file.
.PP
Thus suppose we wish to save the current date in a file called `now'.
The command
.DS
date
.DE
will print the current date on our terminal.
This is because our terminal is the default
.I "standard output"
for the date command and the date command prints the date on its
standard output.
The shell lets us
.I redirect
the
.I "standard output"
of a command through a
notation using the
.I metacharacter
`>' and the name of the file where output is to be placed.
Thus the command
.DS
date > now
.DE
runs the
.I date
command such that its standard output is
the file `now' rather than the terminal.
Thus this command places the current date and time into the file `now'.
It is important to know that the
.I date
command was unaware that its output was going to a file rather than
to the terminal.
The shell performed this
.I redirection
before the command began executing.
.PP
One other thing to note here is that the file `now'
need not have existed before the
.I date
command was executed; the shell would have created the file if it did
not exist.
And if the file did exist?
If it had existed previously these previous contents would have been discarded!
A shell option
.I noclobber
exists to prevent this from happening accidentally;
it is discussed in section 2.2.
.PP
The system normally keeps files which you create with `>' and all other files.
Thus the default is for files to be permanent.  If you wish to create a file
which will be removed automatically, you can begin its name with a `#'
character, this `scratch' character denotes the fact that the file will
be a scratch file.*
.FS
*Note that if your erase character is a `#', you will have to precede the
`#' with a `\e'.  The fact that the `#' character is the old (pre-\s-2CRT\s0)
standard erase character means that it seldom appears in a file name, and
allows this convention to be used for scratch files.  If you are using a
\s-2CRT\s0, your erase character should be a ^H, as we demonstrated
in section 1.1 how this could be set up.
.FE
The system will remove such files after a couple of days,
or sooner if file space becomes very tight.
Thus, in running the
.I date
command above, we don't really want to save the output forever, so we
would more likely do
.DS
date > #now
.DE
.NH 2
Metacharacters in the shell
.PP
The shell has a large number of
special characters (like `>')
which indicate special functions.
We say that these notations have
.I syntactic
and
.I semantic
meaning to the shell.
In general, most characters which are neither letters nor digits
have special meaning to the shell.
We shall shortly learn a means of
.I quotation
which allows us to use
.I metacharacters
without the shell treating them in any special way.
.PP
Metacharacters normally have effect only when the shell is reading
our input.
We need not worry about placing shell metacharacters in a letter
we are sending via
.I mail,
or when we are typing in text or data to some other program.
Note that the shell is only reading input when it has prompted with
`% ' (although we can type our input even before it prompts).
.NH 2
Input from files; pipelines
.PP
We learned above how to
.I redirect
the
.I "standard output"
of a command
to a file.
It is also possible to redirect the
.I "standard input"
of a command from a file.
This is not often necessary since most commands will read from
a file whose name is given as an argument.
We can give the command
.DS
sort < data
.DE
to run the
.I sort
command with standard input, where the command normally
reads its input, from the file
`data'.
We would more likely say
.DS
sort data
.DE
letting the
.I sort
command open the file
`data'
for input itself since this is less to type.
.PP
We should note that if we just typed
.DS
sort
.DE
then the sort program would sort lines from its
.I "standard input."
Since we did not
.I redirect
the standard input, it would sort lines as we typed them on the terminal
until we typed a ^D to indicate an end-of-file.
.PP
A most useful capability is the ability to combine the standard output
of one command with the standard input of another, i.e. to run the
commands in a sequence known as a
.I pipeline.
For instance the command
.DS
ls \-s
.DE
normally produces a list of the files in our directory with the size
of each in blocks of 512 characters.
If we are interested in learning which of our files is largest we
may wish to have this sorted by size rather than by name, which is
the default way in which
.I ls
sorts.
We could look at the many options of
.I ls
to see if there was an option to do this but would eventually discover
that there is not.
Instead we can use a couple of simple options of the
.I sort
command, combining it with
.I ls
to get what we want.
.PP
The
.I \-n
option of sort specifies a numeric sort rather than an alphabetic sort.
Thus
.DS
ls \-s | sort \-n
.DE
specifies that the output of the
.I ls
command run with the option
.I \-s
is to be
.I piped
to the command
.I sort
run with the numeric sort option.
This would give us a sorted list of our files by size, but with the
smallest first.
We could then use the
.I \-r
reverse sort option and the
.I head
command in combination with the previous command doing
.DS
ls \-s | sort \-n \-r | head \-5
.DE
Here we have taken a list of our files sorted alphabetically,
each with the size in blocks.
We have run this to the standard input of the
.I sort
command asking it to sort numerically in reverse order (largest first).
This output has then been run into the command
.I head
which gives us the first few lines.
In this case we have asked
.I head
for the first 5 lines.
Thus this command gives us the names and sizes of our 5 largest files.
.PP
The notation introduced above is called the
.I pipe
mechanism.
Commands separated by `\||\|' characters are connected together by the
shell and the standard output of each is run into the standard input of the
next.
The leftmost command in a pipeline will normally take its standard
input from the terminal and the rightmost will place its standard
output on the terminal.
Other examples of pipelines will be given later when we discuss the
history mechanism;
one important use of pipes which is illustrated there is in the
routing of information to the line printer.
.NH 2
Filenames
.PP
Many commands to be executed will need the names of files as arguments.
\s-2UNIX\s0
.I pathnames
consist of a number of
.I components
separated by `/'.
Each component except the last names a directory in which the next
component resides, in effect specifying the
.I path
of directories to follow to reach the file.
Thus the pathname
.DS
/etc/motd
.DE
specifies a file in the directory
`etc'
which is a subdirectory of the
.I root
directory `/'.
Within this directory the file named is `motd' which stands
for `message of the day'.
A
.I pathname
that begins with a slash is said to be an
.I absolute
pathname since it is specified from the absolute top of the entire
directory hierarchy of the system (the
.I root ).
.I Pathnames
which do not begin with `/' are interpreted as starting in the current
.I "working directory" ,
which is, by default, your
.I home
directory and can be changed dynamically by the
.I cd
change directory command.
Such pathnames are said to be
.I relative
to the working directory since they are found by starting
in the working directory and descending to lower levels of directories
for each
.I component
of the pathname.  If the pathname contains no slashes at all then the
file is contained in the working directory itself and the pathname is merely
the name of the file in this directory.
Absolute pathnames have no relation
to the working directory.
.PP
Most filenames consist of a number of alphanumeric characters and
`.'s (periods).
In fact, all printing characters except `/' (slash) may appear in filenames.
It is inconvenient to have most non-alphabetic characters in filenames
because many of these have special meaning to the shell.
The character `.' (period) is not a shell-metacharacter and is often used
to separate the
.I extension
of a file name from the base of the name.
Thus
.DS
prog.c prog.o prog.errs prog.output
.DE
are four related files.
They share a
.I base
portion of a name
(a base portion being that part of the name that is left when a trailing
`.' and following characters which are not `.' are stripped off).
The file
`prog.c'
might be the source for a C program,
the file `prog.o' the corresponding object file,
the file
`prog.errs' the errors resulting from a compilation of the program
and the file
`prog.output' the output of a run of the program.
.PP
If we wished to refer to all four of these files in a command, we could
use the notation
.DS
prog.*
.DE
This expression is expanded by the shell, before the command to which it is
an argument is executed, into a list of names which begin with `prog.'.
The character `*' here matches any sequence (including the empty sequence)
of characters in a file name.
The names which match are alphabetically sorted and placed in the
.I "argument list"
of the command.
Thus the command
.DS
echo prog.*
.DE
will echo the names
.DS
prog.c prog.errs prog.o prog.output
.DE
Note that the names are in sorted order here, and a different
order than we listed them above.
The
.I echo
command receives four words as arguments, even though we only typed
one word as an argument directly.
The four words were generated by
.I "filename expansion"
of the one input word.
.PP
Other notations for
.I "filename expansion"
are also available.
The character `?' matches any single character in a filename.
Thus
.DS
echo ? \|?? \|???
.DE
will echo a line of filenames; first those with one character names,
then those with two character names, and finally those with three
character names.
The names of each length will be independently sorted.
.PP
Another mechanism consists of a sequence of characters between `[' and `]'.
This metasequence matches any single character from the enclosed set.
Thus
.DS
prog.[co]
.DE
will match
.DS
prog.c prog.o
.DE
in the example above.
We can also place two characters around a `\-' in this notation to denote
a range.
Thus
.DS
chap.[1\-5]
.DE
might match files
.DS
chap.1 chap.2 chap.3 chap.4 chap.5
.DE
if they existed.
This is shorthand for
.DS
chap.[12345]
.DE
and otherwise equivalent.
.PP
An important point to note is that if a list of argument words to
a command (an
.I "argument list)"
contains filename expansion syntax, and if this filename expansion syntax
fails to match any existing file names, then the shell considers this
to be an error and prints a diagnostic
.DS
No match.
.DE
and does not execute the command.
.PP
Another very important point is that files with the character `.' at the
beginning are treated specially.
Neither `*' or `?' or the `[' `]' mechanism will match it.
This prevents accidental matching of the filenames `.' and `..'
in the working directory which have special meaning to the system,
as well as other files such as
.I \&.cshrc
which are not normally
visible.
We will discuss the special role of the file
.I \&.cshrc
later.
.PP
Another filename expansion mechanism gives access to the pathname of
the
.I home
directory of other users.
This notation consists of the character `~' (tilde) followed by another user's
login name.
For instance the word `~bill' would map to the pathname `/usr/bill'
if the home directory for `bill' was `/usr/bill'.
Since, on large systems, users may have login directories scattered over
many different disk volumes with different prefix directory names,
this notation provides a convenient way of accessing the files
of other users.
.PP
A special case of this notation consists of a `~' alone, e.g. `~/mbox'.
This notation is expanded by the shell into the file `mbox' in your
.I home
directory, i.e. into `/usr/bill/mbox' for me on Ernie Co-vax, the UCB
Computer Science Department VAX machine, where this document was prepared.
This can be very useful if you have used
.I cd
to change to another directory and have found a file you wish to
copy using
.I cp.
If I give the command
.DS
cp thatfile ~
.DE
the shell will expand this command to
.DS
cp thatfile /usr/bill
.DE
since my home directory is /usr/bill.
.PP
There also exists a mechanism using the characters `{' and `}' for
abbreviating a set of words which have common parts but cannot
be abbreviated by the above mechanisms because they are not files,
are the names of files which do not yet exist,
are not thus conveniently described.
This mechanism will be described much later,
in section 4.2,
as it is used less frequently.
.NH 2
Quotation
.PP
We have already seen a number of metacharacters used by the shell.
These metacharacters pose a problem in that we cannot use them directly
as parts of words.
Thus the command
.DS
echo *
.DE
will not echo the character `*'.
It will either echo a sorted list of filenames in the
current
.I "working directory,"
or print the message `No match' if there are
no files in the working directory.
.PP
The recommended mechanism for placing characters which are neither numbers,
digits, `/', `.' or `\-' in an argument word to a command is to enclose
it with single quotation characters `\'', i.e.
.DS
echo \'*\'
.DE
There is one special character `!' which is used by the
.I history
mechanism of the shell and which cannot be
.I escaped
by placing it within `\'' characters.
It and the character `\'' itself can be preceded by a single `\e'
to prevent their special meaning.
Thus
.DS
echo \e\'\e!
.DE
prints
.DS
\'!
.DE
These two mechanisms suffice to place any printing character into a word
which is an argument to a shell command.  They can be combined, as in
.DS
echo \e\'\'*\'
.DE
which prints
.DS
\'*
.DE
since the first `\e' escaped the first `\'' and the `*' was enclosed
between `\'' characters.
.NH 2
Terminating commands
.PP
When you are executing a command and the shell is
waiting for it to complete there are several ways
to force it to stop.
For instance if you type the command
.DS
cat /etc/passwd
.DE
the system will print a copy of a list of all users of the system
on your terminal.
This is likely to continue for several minutes unless you stop it.
You can send an
\s-2INTERRUPT\s0
.I signal
to the
.I cat
command by typing ^C on your terminal.*
.FS
*On some older Unix systems the \s-2DEL\s0 or \s-2RUBOUT\s0 key
has the same effect. "stty all" will tell you the INTR key value.
.FE
Since
.I cat
does not take any precautions to avoid or otherwise handle this signal
the
\s-2INTERRUPT\s0
will cause it to terminate.
The shell notices that
.I cat
has terminated and prompts you again with `% '.
If you hit \s-2INTERRUPT\s0 again, the shell will just
repeat its prompt since it handles \s-2INTERRUPT\s0 signals
and chooses to continue to execute commands rather than terminating
like
.I cat
did, which would have the effect of logging you out.
.PP
Another way in which many programs terminate is when they get an end-of-file
from their standard input.
Thus the
.I mail
program in the first example above was terminated when we typed a ^D
which generates an end-of-file from the standard input.
The shell also terminates when it gets an end-of-file printing `logout';
\s-2UNIX\s0 then logs you off the system.
Since this means that typing too many ^D's can accidentally log us off,
the shell has a mechanism for preventing this.
This
.I ignoreeof
option will be discussed in section 2.2.
.PP
If a command has its standard input redirected from a file, then it will
normally terminate when it reaches the end of this file.
Thus if we execute
.DS
mail bill < prepared.text
.DE
the mail command will terminate without our typing a ^D.
This is because it read to the end-of-file of our file
`prepared.text' in which we placed a message for `bill' with an editor program.
We could also have done
.DS
cat prepared.text \||\| mail bill
.DE
since the
.I cat
command would then have written the text through the pipe to the
standard input of the mail command.
When the
.I cat
command completed it would have terminated,
closing down the pipeline
and the
.I mail
command would have received an end-of-file from it and terminated.
Using a pipe here is more complicated than redirecting input
so we would more likely use the first form.
These commands could also have been stopped by sending an \s-2INTERRUPT\s0.
.PP
Another possibility for stopping a command is to suspend its execution
temporarily, with the possibility of continuing execution later.  This is
done by sending a \s-2STOP\s0 signal via typing a ^Z.
This signal causes all commands running on the terminal
(usually one but more if a pipeline is executing) to become suspended.
The shell notices that the command(s) have been suspended, types
`Stopped' and then prompts for a new command.
The previously executing command has been suspended, but otherwise
unaffected by the \s-2STOP\s0 signal.  Any other commands can be executed
while the original command remains suspended.  The suspended command can
be continued using the
.I fg
command with no arguments.  The shell will then retype the command
to remind you which command is being continued, and cause the command
to resume execution.  Unless any input files in use by the suspended
command have been changed in the meantime, the suspension has no effect
whatsoever on the execution of the command.  This feature can be very useful
during editing, when you need to look at another file before continuing.
An
example of command suspension follows.
.DS
% mail harold
Someone just copied a big file into my directory and its name is
^Z
Stopped
% ls
funnyfile
prog.c
prog.o
% jobs
.ta 1.75i
[1]  + Stopped	mail harold
% fg
mail harold
funnyfile. Do you know who did it?
EOT
%
.DE
In this example someone was sending a message to Harold and forgot the
name of the file he wanted to mention.  The mail command was suspended
by typing ^Z.  When the shell noticed that the mail program was
suspended, it typed `Stopped' and prompted for a new command.  Then the
.I ls
command was typed to find out the name of the file.  The
.I jobs
command was run to find out which command was suspended.
At this time the
.I fg
command was typed to continue execution of the mail program.  Input
to the mail program was then continued and ended with a ^D
which indicated the end of the message at which time the mail
program typed EOT.  The
.I jobs
command will show which commands are suspended.
The ^Z should only be typed at the beginning of a line since
everything typed on the current line is discarded when a signal is sent
from the keyboard.  This also happens on \s-2INTERRUPT\s0, and \s-2QUIT\s0
signals.  More information on
suspending jobs and controlling them is given in
section 2.6.
.PP
If you write or run programs which are not fully debugged then it may
be necessary to stop them somewhat ungracefully.
This can be done by sending them a \s-2QUIT\s0
signal, sent by typing a ^\e.
This will usually provoke the shell to produce a message like:
.DS
Quit (Core dumped)
.DE
indicating that a file
`core' has been created containing information about the running program's
state when it terminated due to the \s-2QUIT\s0 signal.
You can examine this file yourself, or forward information to the
maintainer of the program telling him/her where the
.I "core file"
is.
.PP
If you run background commands (as explained in section 2.6) then these
commands will ignore \s-2INTERRUPT\s0 and \s-2QUIT\s0 signals at the
terminal.  To stop them you must use the
.I kill
command.  See section 2.6 for an example.
.PP
If you want to examine the output of a command without having it move
off the screen as the output of the
.DS
cat /etc/passwd
.DE
command will, you can use the command
.DS
more /etc/passwd
.DE
The
.I more
program pauses after each complete screenful and types `\-\-More\-\-'
at which point you can hit a space to get another screenful, a return
to get another line, a `?' to get some help on other commands, or a `q' to end the
.I more
program.  You can also use more as a filter, i.e.
.DS
cat /etc/passwd | more
.DE
works just like the more simple more command above.
.PP
For stopping output of commands not involving
.I more
you can use the
^S key to stop the typeout.  The typeout will resume when you
hit ^Q or any other key, but ^Q is normally used because
it only restarts the output and does not become input to the program
which is running.  This works well on low-speed terminals, but at 9600
baud it is hard to type ^S and ^Q fast enough to paginate
the output nicely, and a program like
.I more
is usually used.
.PP
An additional possibility is to use the ^O flush output
character; when this character is typed, all output from the current
command is thrown away (quickly) until the next input read occurs
or until the next shell prompt.  This can be used to allow a command
to complete without having to suffer through the output on a slow
terminal; ^O is a toggle, so flushing can be turned off by
typing ^O again while output is being flushed.
.NH 2
What now?
.PP
We have so far seen a number of mechanisms of the shell and learned a lot
about the way in which it operates.
The remaining sections will go yet further into the internals of the
shell, but you will surely want to try using the
shell before you go any further.
To try it you can log in to \s-2UNIX\s0 and type the following
command to the system:
.DS
chsh myname /bin/csh
.DE
Here `myname' should be replaced by the name you typed to
the system prompt of `login:' to get onto the system.
Thus I would use `chsh bill /bin/csh'.
.B
You only have to do this once; it takes effect at next login.
.R
You are now ready to try using
.I csh.
.PP
Before you do the `chsh' command, the shell you are using when
you log into the system is `/bin/sh'.
In fact, much of the above discussion is applicable to `/bin/sh'.
The next section will introduce many features particular to
.I csh
so you should change your shell to
.I csh
before you begin reading it.
.bp
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.2	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.nr H1 1
.NH
Details on the shell for terminal users
.NH 2
Shell startup and termination
.PP
When you login, the shell is started by the system in your
.I home
directory and begins by reading commands from a file
.I \&.cshrc
in this directory.
All shells which you may start during your terminal session will
read from this file.
We will later see what kinds of commands are usefully placed there.
For now we need not have this file and the shell does not complain about
its absence.
.PP
A
.I "login shell" ,
executed after you login to the system,
will, after it reads commands from
.I \&.cshrc,
read commands from a file
.I \&.login
also in your home directory.
This file contains commands which you wish to do each time you login
to the \s-2UNIX\s0 system.
My
.I \&.login
file looks something like:
.DS
set ignoreeof
set mail=(/usr/spool/mail/bill)
echo "${prompt}users" ; users
alias ts \e
	\'set noglob ; eval \`tset \-s \-m dialup:c100rv4pna \-m plugboard:?hp2621nl \!*\`\';
ts; stty intr ^C kill ^U crt
set time=15 history=10
msgs \-f
if (\-e $mail) then
	echo "${prompt}mail"
	mail
endif
.DE
.PP
This file contains several commands to be executed by \s-2UNIX\s0
each time I login.
The first is a
.I set
command which is interpreted directly by the shell.  It sets the shell
variable
.I ignoreeof
which causes the shell to not log me off if I hit ^D.  Rather,
I use the
.I logout
command to log off of the system.
By setting the
.I mail
variable, I ask the shell to watch for incoming mail to me.  Every 5 minutes
the shell looks for this file and tells me if more mail has arrived there.
An alternative to this is to put the command
.DS
biff y
.DE
in place of this
.I set;
this will cause me to be notified immediately when mail arrives, and to
be shown the first few lines of the new message.
.PP
Next I set the shell variable `time' to `15' causing the shell to automatically
print out statistics lines for commands which execute for at least 15 seconds
of \s-2CPU\s+2 time.  The variable `history' is set to 10 indicating that
I want the shell to remember the last 10 commands I type in its
.I "history list" ,
(described later).
.PP
I create an
.I alias
``ts'' which executes a
\fItset\fR\|(1) command setting up the modes of the terminal.
The parameters to
.I tset
indicate the kinds of terminal which I usually use when not on a hardwired
port.  I then execute ``ts'' and also use the
.I stty
command to change the interrupt character to ^C and the line kill
character to ^U.
.PP
I then run the `msgs' program, which provides me with any
system messages which I have not seen before; the `\-f' option here prevents
it from telling me anything if there are no new messages.
Finally, if my mailbox file exists, then I run the `mail' program to
process my mail.
.PP
When the `mail' and `msgs' programs finish, the shell will finish
processing my
.I \&.login
file and begin reading commands from the terminal, prompting for each with
`% '.
When I log off (by giving the
.I logout
command) the shell
will print `logout' and execute commands from the file `.logout'
if it exists in my home directory.
After that the shell will terminate and \s-2UNIX\s0 will log
me off the system.
If the system is not going down, I will receive a new login message.
In any case, after the `logout' message the shell is committed to terminating
and will take no further input from my terminal.
.NH 2
Shell variables
.PP
The shell maintains a set of
.I variables.
We saw above the variables
.I history
and
.I time
which had values `10' and `15'.
In fact, each shell variable has as value an array of
zero or more
.I strings.
Shell variables may be assigned values by the set command.  It has
several forms, the most useful of which was given above and is
.DS
set name=value
.DE
.PP
Shell variables may be used to store values which are to
be used in commands later through a substitution mechanism.
The shell variables most commonly referenced are, however, those which the
shell itself refers to.
By changing the values of these variables one can directly affect the
behavior of the shell.
.PP
One of the most important variables is the variable
.I path.
This variable contains a sequence of directory names where the shell
searches for commands.
The
.I set
command with no arguments
shows the value of all variables currently defined (we usually say
.I set)
in the shell.
The default value for path will be shown by
.I set
to be
.DS
% set
.ta .75i
argv	()
cwd	/usr/bill
home	/usr/bill
path	(. /usr/ucb /bin /usr/bin)
prompt	%
shell	/bin/csh
status	0
term	c100rv4pna
user	bill
%
.DE
This output indicates that the variable path points to the current
directory `.' and then `/usr/ucb', `/bin' and `/usr/bin'.
Commands which you may write might be in `.' (usually one of
your directories).
Commands developed at Berkeley, live in `/usr/ucb'
while commands developed at Bell Laboratories live in `/bin' and `/usr/bin'.
.PP
A number of locally developed programs on the system live in the directory
`/usr/local'.
If we wish that all shells which we invoke to have
access to these new programs we can place the command
.DS
set path=(. /usr/ucb /bin /usr/bin /usr/local)
.DE
in our file
.I \&.cshrc
in our home directory.
Try doing this and then logging out and back in and do
.DS
set
.DE
again to see that the value assigned to
.I path
has changed.
.FS \(dg
Another directory that might interest you is /usr/new, which contains
many useful user-contributed programs provided with Berkeley Unix.
.FE
.PP
One thing you should be aware of is that the shell examines each directory
which you insert into your path and determines which commands are contained
there.  Except for the current directory `.', which the shell treats specially,
this means that if commands are added to a directory in your search path after
you have started the shell, they will not necessarily be found by the shell.
If you wish to use a command which has been added in this way, you should
give the command
.DS
rehash
.DE
to the shell, which will cause it to recompute its internal table of command
locations, so that it will find the newly added command.
Since the shell has to look in the current directory `.' on each command,
placing it at the end of the path specification usually works equivalently
and reduces overhead.
.PP
Other useful built in variables are the variable
.I home
which shows your home directory,
.I cwd
which contains your current working directory,
the variable
.I ignoreeof
which can be set in your
.I \&.login
file to tell the shell not to exit when it receives an end-of-file from
a terminal (as described above).
The variable `ignoreeof'
is one of several variables which the shell does not care about the
value of, only whether they are
.I set
or
.I unset.
Thus to set this variable you simply do
.DS
set ignoreeof
.DE
and to unset it do
.DS
unset ignoreeof
.DE
These give the variable `ignoreeof' no value, but none is desired or required.
.PP
Finally, some other built-in shell variables of use are the
variables
.I noclobber
and
.I mail.
The metasyntax
.DS
> filename
.DE
which redirects the standard output of a command
will overwrite and destroy the previous contents of the named file.
In this way you may accidentally overwrite a file which is valuable.
If you would prefer that the shell not overwrite files in this
way you can
.DS
set noclobber
.DE
in your
.I \&.login
file.
Then trying to do
.DS
date > now
.DE
would cause a diagnostic if `now' existed already.
You could type
.DS
date >!  now
.DE
if you really wanted to overwrite the contents of `now'.
The `>!' is a special metasyntax indicating that clobbering the
file is ok.\(dg
.FS
\(dgThe space between the `!' and the word `now' is critical here, as `!now'
would be an invocation of the
.I history
mechanism, and have a totally different effect.
.FE
.NH 2
The shell's history list
.PP
The shell can maintain a
.I "history list"
into which it places the words
of previous commands.
It is possible to use a notation to reuse commands or words
from commands in forming new commands.
This mechanism can be used to repeat previous commands or to
correct minor typing mistakes in commands.
.PP
The following figure gives a sample session involving typical usage of the
history mechanism of the shell.
.KF
.DS
% cat bug.c
main()

{
	printf("hello);
}
% cc !$
cc bug.c
"bug.c", line 4: newline in string or char constant
"bug.c", line 5: syntax error
% ed !$
ed bug.c
29
4s/);/"&/p
        printf("hello");
w
30
q
% !c
cc bug.c
% a.out
hello% !e
ed bug.c
30
4s/lo/lo\e\en/p
        printf("hello\en");
w
32
q
% !c \-o bug
cc bug.c \-o bug
% size a.out bug
a.out: 2784+364+1028 = 4176b = 0x1050b
bug: 2784+364+1028 = 4176b = 0x1050b
% ls \-l !*
ls \-l a.out bug
\(mirwxr\(mixr\(mix 1 bill       3932 Dec 19 09:41 a.out
\(mirwxr\(mixr\(mix 1 bill       3932 Dec 19 09:42 bug
% bug
hello
% num bug.c | spp
spp: Command not found.
% ^spp^ssp
num bug.c | ssp
    1	main()
    3	{
    4		printf("hello\en");
    5	}
% !! | lpr
num bug.c | ssp | lpr
%
.DE
.KE
In this example we have a very simple C program which has a bug (or two)
in it in the file `bug.c', which we `cat' out on our terminal.  We then
try to run the C compiler on it, referring to the file again as `!$',
meaning the last argument to the previous command.  Here the `!' is the
history mechanism invocation metacharacter, and the `$' stands for the last
argument, by analogy to `$' in the editor which stands for the end of the line.
The shell echoed the command, as it would have been typed without use of
the history mechanism, and then executed it.
The compilation yielded error diagnostics so we now run the editor on the
file we were trying to compile, fix the bug, and run the C compiler again,
this time referring to this command simply as `!c', which repeats the last
command which started with the letter `c'.  If there were other
commands starting with `c' done recently we could have said `!cc' or even
`!cc:p' which would have printed the last command starting with `cc'
without executing it.
.PP
After this recompilation, we ran the resulting `a.out' file, and then
noting that there still was a bug, ran the editor again.  After fixing
the program we ran the C compiler again, but tacked onto the command
an extra `\-o bug' telling the compiler to place the resultant binary in
the file `bug' rather than `a.out'.  In general, the history mechanisms
may be used anywhere in the formation of new commands and other characters
may be placed before and after the substituted commands.
.PP
We then ran the `size' command to see how large the binary program images
we have created were, and then an `ls \-l' command with the same argument
list, denoting the argument list `\!*'.
Finally we ran the program `bug' to see that its output is indeed correct.
.PP
To make a numbered listing of the program we ran the `num' command on the file `bug.c'.
In order to compress out blank lines in the output of `num' we ran the
output through the filter `ssp', but misspelled it as spp.  To correct this
we used a shell substitute, placing the old text and new text between `^'
characters.  This is similar to the substitute command in the editor.
Finally, we repeated the same command with `!!', but sent its output to the
line printer.
.PP
There are other mechanisms available for repeating commands.  The
.I history
command prints out a number of previous commands with numbers by which
they can be referenced.  There is a way to refer to a previous command
by searching for a string which appeared in it, and there are other,
less useful, ways to select arguments to include in a new command.
A complete description of all these mechanisms
is given in the C shell manual pages in the \s-2UNIX\s0 Programmer's Manual.
.NH 2
Aliases
.PP
The shell has an
.I alias
mechanism which can be used to make transformations on input commands.
This mechanism can be used to simplify the commands you type,
to supply default arguments to commands,
or to perform transformations on commands and their arguments.
The alias facility is similar to a macro facility.
Some of the features obtained by aliasing can be obtained also
using shell command files, but these take place in another instance
of the shell and cannot directly affect the current shells environment
or involve commands such as
.I cd
which must be done in the current shell.
.PP
As an example, suppose that there is a new version of the mail program
on the system called `newmail'
you wish to use, rather than the standard mail program which is called
`mail'.
If you place the shell command
.DS
alias mail newmail
.DE
in your
.I \&.cshrc
file, the shell will transform an input line of the form
.DS
mail bill
.DE
into a call on `newmail'.
More generally, suppose we wish the command `ls' to always show
sizes of files, that is to always do `\-s'.
We can do
.DS
alias ls ls \-s
.DE
or even
.DS
alias dir ls \-s
.DE
creating a new command syntax `dir'
which does an `ls \-s'.
If we say
.DS
dir ~bill
.DE
then the shell will translate this to
.DS
ls \-s /mnt/bill
.DE
.PP
Thus the
.I alias
mechanism can be used to provide short names for commands,
to provide default arguments,
and to define new short commands in terms of other commands.
It is also possible to define aliases which contain multiple
commands or pipelines, showing where the arguments to the original
command are to be substituted using the facilities of the
history mechanism.
Thus the definition
.DS
alias cd \'cd \e!* ; ls \'
.DE
would do an
.I ls
command after each change directory
.I cd
command.
We enclosed the entire alias definition in `\'' characters to prevent
most substitutions from occurring and the character `;' from being
recognized as a metacharacter.
The `!' here is escaped with a `\e' to prevent it from being interpreted
when the alias command is typed in.
The `\e!*' here substitutes the entire argument list to the pre-aliasing
.I cd
command, without giving an error if there were no arguments.
The `;' separating commands is used here
to indicate that one command is to be done and then the next.
Similarly the definition
.DS
alias whois \'grep \e!^ /etc/passwd\'
.DE
defines a command which looks up its first argument in the password file.
.PP
.B Warning:
The shell currently reads the
.I \&.cshrc
file each time it starts up.  If you place a large number of commands
there, shells will tend to start slowly.  A mechanism for saving the shell
environment after reading the \fI\&.cshrc\fR file and quickly restoring it is
under development, but for now you should try to limit the number of
aliases you have to a reasonable number... 10 or 15 is reasonable,
50 or 60 will cause a noticeable delay in starting up shells, and make
the system seem sluggish when you execute commands from within the editor
and other programs.
.NH 2
More redirection; >> and >&
.PP
There are a few more notations useful to the terminal user
which have not been introduced yet.
.PP
In addition to the standard output, commands also have a
.I "diagnostic output"
which is normally directed to the terminal even when the standard output
is redirected to a file or a pipe.
It is occasionally desirable to direct the diagnostic output along with
the standard output.
For instance if you want to redirect the output of a long running command
into a file and wish to have a record of any error diagnostic it produces
you can do
.DS
command >& file
.DE
The `>&' here tells the shell to route both the diagnostic output and the
standard output into `file'.
Similarly you can give the command
.DS
command |\|& lpr
.DE
to route both standard and diagnostic output through the pipe
to the line printer daemon
.I lpr.\(dd
.FS
\(dd A command of the form
.br
.ti +5
command >&! file
.br
exists, and is used when
.I noclobber
is set and
.I file
already exists.
.FE
.PP
Finally, it is possible to use the form
.DS
command >> file
.DE
to place output at the end of an existing file.\(dg
.FS
\(dg If
.I noclobber
is set, then an error will result if
.I file
does not exist, otherwise the shell will create
.I file
if it doesn't exist.
A form
.br
.ti +5
command >>! file
.br
makes it not be an error for file to not exist when
.I noclobber
is set.
.FE
.NH 2
Jobs; Background, Foreground, or Suspended
.PP
When one or more commands
are typed together as a pipeline or as a sequence of commands separated by
semicolons, a single
.I job
is created by the shell consisting of these commands together as a unit.
Single commands without pipes or semicolons create the simplest jobs.
Usually, every line typed to the shell creates a job.
Some lines that create jobs (one per line) are
.DS
sort < data
ls \-s | sort \-n | head \-5
mail harold
.DE
.PP
If the metacharacter `&' is typed
at the end of the commands, then the job is started as a
.I background
job.  This means that the shell does not wait for it to complete but
immediately prompts and is ready for another command.  The job runs
.I "in the background"
at the same time that normal jobs, called
.I foreground
jobs, continue to be read and executed by the shell one at a time.
Thus
.DS
du > usage &
.DE
would run the
.I du
program, which reports on the disk usage of your working directory (as well as
any directories below it), put the output into the file `usage' and return
immediately with a prompt for the next command without out waiting for
.I du
to finish.  The
.I du
program would continue executing in the background
until it finished, even though you can type and execute more commands in the
mean time.
When a background
job terminates, a message is typed by the shell just before the next prompt
telling you that the job has completed.
In the following example the
.I du
job finishes sometime during the
execution of the
.I mail
command and its completion is reported just before
the prompt after the
.I mail
job is finished.
.DS
% du > usage &
[1] 503
% mail bill
How do you know when a background job is finished?
EOT
.ta 1.75i
[1] \- Done	du > usage
%
.DE
If the job did not terminate normally the `Done' message might say
something else like `Killed'.
If you want the
terminations of background jobs to be reported at the time they occur
(possibly interrupting the output of other foreground jobs), you can set
the
.I notify
variable.  In the previous example this would mean that the
`Done' message might have come right in the middle of the message to
Bill.
Background jobs are unaffected by any signals from the keyboard like
the \s-2STOP\s0, \s-2INTERRUPT\s0, or \s-2QUIT\s0 signals mentioned earlier.
.PP
Jobs are recorded in a table inside the shell until they terminate.
In this table, the shell remembers the command names, arguments and the
.I "process numbers"
of all commands in the job as well as the working directory where the job was
started.
Each job in the table is either running
.I "in the foreground"
with the shell waiting for it to terminate, running
.I "in the background,"
or
.I suspended.
Only one job can be running in the foreground at one time, but several
jobs can be suspended or running in the background at once.  As each job
is started, it is assigned a small identifying
number called the
.I "job number"
which can be used later to refer to the job in the commands described below.
Job numbers remain
the same until the job terminates and then are re-used.
.PP
When a job is started in the background using `&', its number, as well
as the process numbers of all its (top level) commands, is typed by the shell
before prompting you for another command.
For example,
.DS
% ls \-s | sort \-n > usage &
[2] 2034 2035
%
.DE
runs the `ls' program with the `\-s' options, pipes this output into
the `sort' program with the `\-n' option which puts its output into the
file `usage'.
Since the `&' was at the end of the line, these two programs were started
together as a background job.  After starting the job, the shell prints
the job number in brackets (2 in this case) followed by the process number
of each program started in the job.  Then the shell immediates prompts for
a new command, leaving the job running simultaneously.
.PP
As mentioned in section 1.8, foreground jobs become
.I suspended
by typing ^Z
which sends a \s-2STOP\s0 signal to the currently running
foreground job.  A background job can become suspended by using the
.I stop
command described below.  When jobs are suspended they merely stop
any further progress until started again, either in the foreground
or the background.  The shell notices when a job becomes stopped and
reports this fact, much like it reports the termination of background jobs.
For foreground jobs this looks like
.DS
% du > usage
^Z
Stopped
%
.DE
`Stopped' message is typed by the shell when it notices that the
.I du
program stopped.
For background jobs, using the
.I stop
command, it is
.DS
% sort usage &
[1] 2345
% stop %1
.ta 1.75i
[1] + Stopped (signal)	sort usage
%
.DE
Suspending foreground jobs can be very useful when you need to temporarily
change what you are doing (execute other commands) and then return to
the suspended job.  Also, foreground jobs can be suspended and then
continued as background jobs using the
.I bg
command, allowing you to continue other work and
stop waiting for the foreground job to finish.  Thus
.DS
% du > usage
^Z
Stopped
% bg
[1] du > usage &
%
.DE
starts `du' in the foreground, stops it before it finishes, then continues
it in the background allowing more foreground commands to be executed.
This is especially helpful
when a foreground job ends up taking longer than you expected and you
wish you had started it in the background in the beginning.
.PP
All
.I "job control"
commands can take an argument that identifies a particular
job.
All job name arguments begin with the character `%', since some of the
job control commands also accept process numbers (printed by the
.I ps
command.)
The default job (when no argument is given) is called the
.I current
job and is identified by a `+' in the output of the
.I jobs
command, which shows you which jobs you have.
When only one job is stopped or running in the background (the usual case)
it is always the current job thus no argument is needed.
If a job is stopped while running in the foreground it becomes the
.I current
job and the existing current job becomes the
.I previous
job \- identified by a `\-' in the output of
.I jobs.
When the current job terminates, the previous job becomes the current job.
When given, the argument is either `%\-' (indicating
the previous job); `%#', where # is the job number;
`%pref' where pref is some unique prefix of the command name
and arguments of one of the jobs; or `%?' followed by some string found
in only one of the jobs.
.PP
The
.I jobs
command types the table of jobs, giving the job number,
commands and status (`Stopped' or `Running') of each background or
suspended job.  With the `\-l' option the process numbers are also
typed.
.DS
% du > usage &
[1] 3398
% ls \-s | sort \-n > myfile &
[2] 3405
% mail bill
^Z
Stopped
% jobs
.ta 1.75i
[1] \(mi Running	du > usage
[2]    Running	ls \-s | sort \-n > myfile
[3] \(pl Stopped	mail bill
% fg %ls
ls \-s | sort \-n > myfile
% more myfile
.DE
.PP
The
.I fg
command runs a suspended or background job in the foreground.  It is
used to restart a previously suspended job or change a background job
to run in the foreground (allowing signals or input from the terminal).
In the above example we used
.I fg
to change the `ls' job from the
background to the foreground since we wanted to wait for it to
finish before looking at its output file.
The
.I bg
command runs a suspended job in the background.  It is usually used
after stopping the currently running foreground job with the
\s-2STOP\s0 signal.  The combination of the \s-2STOP\s0 signal and the
.I bg
command changes a foreground job into a background job.
The
.I stop
command suspends a background job.
.PP
The
.I kill
command terminates a background or suspended job immediately.
In addition to jobs, it may be given process numbers as arguments,
as printed by
.I ps.
Thus, in the example above, the running
.I du
command could have been terminated by the command
.DS
% kill %1
.ta 1.75i
[1]  Terminated	du > usage
%
.DE
.PP
The
.I notify
command (not the variable mentioned earlier) indicates that the termination
of a specific job should be
reported at the time it finishes instead of waiting for the next prompt.
.PP
If a job running in the background tries to read input from the terminal
it is automatically stopped.  When such a job is then run in the
foreground, input can be given to the job.  If desired, the job can
be run in the background again until it requests input again.
This is illustrated in the following sequence where the `s' command in the
text editor might take a long time.
.ID
.nf
% ed bigfile
120000
1,$s/thisword/thatword/
^Z
Stopped
% bg
[1] ed bigfile &
%
 . . .  some foreground commands
.ta 1.75i
[1] Stopped (tty input)	ed bigfile
% fg
ed bigfile
w
120000
q
%
.DE
So after the `s' command was issued, the `ed' job was stopped with ^Z
and then put in the background using
.I bg.
Some time later when the `s' command was finished,
.I ed
tried to read another command and was stopped because jobs
in the background cannot read from the terminal.  The
.I fg
command returned the `ed' job to the foreground where it could once again
accept commands from the terminal.
.PP
The command
.DS
stty tostop
.DE
causes all background jobs run on your terminal to stop
when they are about to
write output to the terminal.  This prevents messages from background
jobs from interrupting foreground job output and allows you to run
a job in the background without losing terminal output.  It also
can be used for interactive programs that sometimes have long
periods without interaction.  Thus each time it outputs a prompt for more
input it will stop before the prompt.  It can then be run in the
foreground using
.I fg,
more input can be given and, if necessary stopped and returned to
the background.  This
.I stty
command might be a good thing to put in your
.I \&.login
file if you do not like output from background jobs interrupting
your work.  It also can reduce the need for redirecting the output
of background jobs if the output is not very big:
.DS
% stty tostop
% wc hugefile &
[1] 10387
% ed text
\&. . . some time later
q
.ta 1.75i
[1] Stopped (tty output)	wc hugefile
% fg wc
wc hugefile
   13371   30123   302577
% stty \-tostop
.DE
Thus after some time the `wc' command, which counts the lines, words
and characters in a file, had one line of output.  When it tried to
write this to the terminal it stopped.  By restarting it in the
foreground we allowed it to write on the terminal exactly when we were
ready to look at its output.
Programs which attempt to change the mode of the terminal will also
block, whether or not
.I tostop
is set, when they are not in the foreground, as
it would be very unpleasant to have a background job change the state
of the terminal.
.PP
Since the
.I jobs
command only prints jobs started in the currently executing shell,
it knows nothing about background jobs started in other login sessions
or within shell files.  The
.I ps
can be used in this case to find out about background jobs not started
in the current shell.
.NH 2
Working Directories
.PP
As mentioned in section 1.6, the shell is always in a particular
.I "working directory."
The `change directory' command
.I chdir
(its
short form
.I cd
may also be used)
changes the working directory of the shell,
that is, changes the directory you
are located in.
.PP
It is useful to make a directory for each project you wish to work on
and to place all files related to that project in that directory.
The `make directory' command,
.I mkdir,
creates a new directory.
The
.I pwd
(`print working directory') command
reports the absolute pathname of the working directory of the shell,
that is, the directory you are
located in.
Thus in the example below:
.DS
% pwd
/usr/bill
% mkdir newpaper
% chdir newpaper
% pwd
/usr/bill/newpaper
%
.DE
the user has created and moved to the
directory
.I newpaper.
where, for example, he might
place a group of related files.
.PP
No matter where you have moved to in a directory hierarchy,
you can return to your `home' login directory by doing just
.DS
cd
.DE
with no arguments.
The name `..' always means the directory above the current one in
the hierarchy, thus
.DS
cd ..
.DE
changes the shell's working directory to the one directly above the
current one.
The name `..' can be used in any
pathname, thus,
.DS
cd ../programs
.DE
means
change to the directory `programs' contained in the directory
above the current one.
If you have several directories for different
projects under, say, your home directory,
this shorthand notation
permits you to switch easily between them.
.PP
The shell always remembers the pathname of its current working directory in
the variable
.I cwd.
The shell can also be requested to remember the previous directory when
you change to a new working directory.  If the `push directory' command
.I pushd
is used in place of the
.I cd
command, the shell saves the name of the current working directory
on a
.I "directory stack"
before changing to the new one.
You can see this list at any time by typing the `directories'
command
.I dirs.
.ID
.nf
% pushd newpaper/references
~/newpaper/references  ~
% pushd /usr/lib/tmac
/usr/lib/tmac  ~/newpaper/references  ~
% dirs
/usr/lib/tmac  ~/newpaper/references  ~
% popd
~/newpaper/references  ~
% popd
~
%
.DE
The list is printed in a horizontal line, reading left to right,
with a tilde (~) as
shorthand for your home directory\(emin this case `/usr/bill'.
The directory stack is printed whenever there is more than one
entry on it and it changes.
It is also printed by a
.I dirs
command.
.I Dirs
is usually faster and more informative than
.I pwd
since it shows the current working directory as well as any
other directories remembered in the stack.
.PP
The
.I pushd
command with no argument
alternates the current directory with the first directory in the
list.
The `pop directory'
.I popd
command without an argument returns you to the directory you were in prior to
the current one, discarding the previous current directory from the
stack (forgetting it).
Typing
.I popd
several times in a series takes you backward through the directories
you had been in (changed to) by
.I pushd
command.
There are other options to
.I pushd
and
.I popd
to manipulate the contents of the directory stack and to change
to directories not at the top of the stack; see the
.I csh
manual page for details.
.PP
Since the shell remembers the working directory in which each job
was started, it warns you when you might be confused by restarting
a job in the foreground which has a different working directory than the
current working directory of the shell.  Thus if you start a background
job, then change the shell's working directory and then cause the
background job to run in the foreground, the shell warns you that the
working directory of the currently running foreground job is different
from that of the shell.
.DS
% dirs \-l
/mnt/bill
% cd myproject
% dirs
~/myproject
% ed prog.c
1143
^Z
Stopped
% cd ..
% ls
myproject
textfile
% fg
ed prog.c (wd: ~/myproject)
.DE
This way the shell warns you when there
is an implied change of working directory, even though no cd command was
issued.  In the above example the `ed' job was still in `/mnt/bill/project'
even though the shell had changed to `/mnt/bill'.
A similar warning is given when such a foreground job
terminates or is suspended (using the \s-2STOP\s0 signal) since
the return to the shell again implies a change of working directory.
.DS
% fg
ed prog.c (wd: ~/myproject)
 . . . after some editing
q
(wd now: ~)
%
.DE
These messages are sometimes confusing if you use programs that change
their own working directories, since the shell only remembers which
directory a job is started in, and assumes it stays there.
The `\-l' option of
.I jobs
will type the working directory
of suspended or background jobs when it is different
from the current working directory of the shell.
.NH 2
Useful built-in commands
.PP
We now give a few of the useful built-in commands of the shell describing
how they are used.
.PP
The
.I alias
command described above is used to assign new aliases and to show the
existing aliases.
With no arguments it prints the current aliases.
It may also be given only one argument such as
.DS
alias ls
.DE
to show the current alias for, e.g., `ls'.
.PP
The
.I echo
command prints its arguments.
It is often used in
.I "shell scripts"
or as an interactive command
to see what filename expansions will produce.
.PP
The
.I history
command will show the contents of the history list.
The numbers given with the history events can be used to reference
previous events which are difficult to reference using the
contextual mechanisms introduced above.
There is also a shell variable called
.I prompt.
By placing a `!' character in its value the shell will there substitute
the number of the current command in the history list.
You can use this number to refer to this command in a history substitution.
Thus you could
.DS
set prompt=\'\e! % \'
.DE
Note that the `!' character had to be
.I escaped
here even within `\'' characters.
.PP
The
.I limit
command is used to restrict use of resources.
With no arguments it prints the current limitations:
.DS
.ta 1i
cputime	unlimited
filesize	unlimited
datasize	5616 kbytes
stacksize	512 kbytes
coredumpsize	unlimited
.DE
Limits can be set, e.g.:
.DS
limit coredumpsize 128k
.DE
Most reasonable units abbreviations will work; see the
.I csh
manual page for more details.
.PP
The
.I logout
command can be used to terminate a login shell which has
.I ignoreeof
set.
.PP
The
.I rehash
command causes the shell to recompute a table of where commands are
located.  This is necessary if you add a command to a directory
in the current shell's search path and wish the shell to find it,
since otherwise the hashing algorithm may tell the shell that the
command wasn't in that directory when the hash table was computed.
.PP
The
.I repeat
command can be used to repeat a command several times.
Thus to make 5 copies of the file
.I one
in the file
.I five
you could do
.DS
repeat 5 cat one >> five
.DE
.PP
The
.I setenv
command can be used
to set variables in the environment.
Thus
.DS
setenv TERM adm3a
.DE
will set the value of the environment variable \s-2TERM\s0
to
`adm3a'.
A user program
.I printenv
exists which will print out the environment.
It might then show:
.DS
% printenv
HOME=/usr/bill
SHELL=/bin/csh
PATH=:/usr/ucb:/bin:/usr/bin:/usr/local
TERM=adm3a
USER=bill
%
.DE
.PP
The
.I source
command can be used to force the current shell to read commands from
a file.
Thus
.DS
source .cshrc
.DE
can be used after editing in a change to the
.I \&.cshrc
file which you wish to take effect right away.
.PP
The
.I time
command can be used to cause a command to be timed no matter how much
\s-2CPU\s0 time it takes.
Thus
.DS
% time cp /etc/rc /usr/bill/rc
0.0u 0.1s 0:01 8% 2+1k 3+2io 1pf+0w
% time wc /etc/rc /usr/bill/rc
     52    178   1347 /etc/rc
     52    178   1347 /usr/bill/rc
    104    356   2694 total
0.1u 0.1s 0:00 13% 3+3k 5+3io 7pf+0w
%
.DE
indicates that the
.I cp
command used a negligible amount of user time (u)
and about 1/10th of a system time (s); the elapsed time was 1 second (0:01),
there was an average memory usage of 2k bytes of program space and 1k
bytes of data space over the cpu time involved (2+1k); the program
did three disk reads and two disk writes (3+2io), and took one page fault
and was not swapped (1pf+0w).
The word count command
.I wc
on the other hand used 0.1 seconds of user time and 0.1 seconds of system
time in less than a second of elapsed time.
The percentage `13%' indicates that over the period when it was active
the command `wc' used an average of 13 percent of the available \s-2CPU\s0
cycles of the machine.
.PP
The
.I unalias
and
.I unset
commands can be used
to remove aliases and variable definitions from the shell, and
.I unsetenv
removes variables from the environment.
.NH 2
What else?
.PP
This concludes the basic discussion of the shell for terminal users.
There are more features of the shell to be discussed here, and all
features of the shell are discussed in its manual pages.
One useful feature which is discussed later is the
.I foreach
built-in command which can be used to run the same command
sequence with a number of different arguments.
.PP
If you intend to use \s-2UNIX\s0 a lot you should look through
the rest of this document and the csh manual pages (section1) to become familiar
with the other facilities which are available to you.
.bp
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.3	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.nr H1 2
.NH
Shell control structures and command scripts
.NH 2
Introduction
.PP
It is possible to place commands in files and to cause shells to be
invoked to read and execute commands from these files,
which are called
.I "shell scripts."
We here detail those features of the shell useful to the writers of such
scripts.
.NH 2
Make
.PP
It is important to first note what shell scripts are
.I not
useful for.
There is a program called
.I make
which is very useful for maintaining a group of related files
or performing sets of operations on related files.
For instance a large program consisting of one or more files
can have its dependencies described in a
.I makefile
which contains definitions of the commands used to create these
different files when changes occur.
Definitions of the means for printing listings, cleaning up the directory
in which the files reside, and installing the resultant programs
are easily, and most appropriately placed in this
.I makefile.
This format is superior and preferable to maintaining a group of shell
procedures to maintain these files.
.PP
Similarly when working on a document a
.I makefile
may be created which defines how different versions of the document
are to be created and which options of
.I nroff
or
.I troff
are appropriate.
.NH 2
Invocation and the argv variable
.PP
A
.I csh
command script may be interpreted by saying
.DS
% csh script ...
.DE
where
.I script
is the name of the file containing a group of
.I csh
commands and
`\&...' is replaced by a sequence of arguments.
The shell places these arguments in the variable
.I argv
and then begins to read commands from the script.
These parameters are then available through the same mechanisms
which are used to reference any other shell variables.
.PP
If you make the file
`script'
executable by doing
.DS
chmod 755 script
.DE
and place a shell comment at the beginning of the shell script
(i.e. begin the file with a `#' character)
then a `/bin/csh' will automatically be invoked to execute `script' when
you type
.DS
script
.DE
If the file does not begin with a `#' then the standard shell
`/bin/sh' will be used to execute it.
This allows you to convert your older shell scripts to use
.I csh
at your convenience.
.NH 2
Variable substitution
.PP
After each input line is broken into words and history substitutions
are done on it, the input line is parsed into distinct commands.
Before each command is executed a mechanism know as
.I "variable substitution"
is done on these words.
Keyed by the character `$' this substitution replaces the names
of variables by their values.
Thus
.DS
echo $argv
.DE
when placed in a command script would cause the current value of the
variable
.I argv
to be echoed to the output of the shell script.
It is an error for
.I argv
to be unset at this point.
.PP
A number of notations are provided for accessing components and attributes
of variables.
The notation
.DS
$?name
.DE
expands to `1' if name is
.I set
or to `0'
if name is not
.I set.
It is the fundamental mechanism used for checking whether particular
variables have been assigned values.
All other forms of reference to undefined variables cause errors.
.PP
The notation
.DS
$#name
.DE
expands to the number of elements in the variable
.I name.
Thus
.DS
% set argv=(a b c)
% echo $?argv
1
% echo $#argv
3
% unset argv
% echo $?argv
0
% echo $argv
Undefined variable: argv.
%
.DE
.PP
It is also possible to access the components of a variable
which has several values.
Thus
.DS
$argv[1]
.DE
gives the first component of
.I argv
or in the example above `a'.
Similarly
.DS
$argv[$#argv]
.DE
would give `c',
and
.DS
$argv[1\-2]
.DE
would give `a b'. Other notations useful in shell scripts are
.DS
$\fIn\fR
.DE
where
.I n
is an integer as a shorthand for
.DS
$argv[\fIn\fR\|]
.DE
the
.I n\|th
parameter and
.DS
$*
.DE
which is a shorthand for
.DS
$argv
.DE
The form
.DS
$$
.DE
expands to the process number of the current shell.
Since this process number is unique in the system it can
be used in generation of unique temporary file names.
The form
.DS
$<
.DE
is quite special and is replaced by the next line of input read from
the shell's standard input (not the script it is reading).  This is
useful for writing shell scripts that are interactive, reading
commands from the terminal, or even writing a shell script that
acts as a filter, reading lines from its input file.
Thus the sequence
.DS
echo 'yes or no?\ec'
set a=($<)
.DE
would write out the prompt `yes or no?' without a newline and then
read the answer into the variable `a'.  In this case `$#a' would be
`0' if either a blank line or end-of-file (^D) was typed.
.PP
One minor difference between `$\fIn\fR\|' and `$argv[\fIn\fR\|]'
should be noted here.
The form
`$argv[\fIn\fR\|]'
will yield an error if
.I n
is not in the range
`1\-$#argv'
while `$n'
will never yield an out of range subscript error.
This is for compatibility with the way older shells handled parameters.
.PP
Another important point is that it is never an error to give a subrange
of the form `n\-'; if there are less than
.I n
components of the given variable then no words are substituted.
A range of the form `m\-n' likewise returns an empty vector without giving
an error when \fIm\fR exceeds the number of elements of the given variable,
provided the subscript \fIn\fR is in range.
.NH 2
Expressions
.PP
In order for interesting shell scripts to be constructed it
must be possible to evaluate expressions in the shell based on the
values of variables.
In fact, all the arithmetic operations of the language C are available
in the shell
with the same precedence that they have in C.
In particular, the operations `==' and `!=' compare strings
and the operators `&&' and `|\|\||' implement the boolean and/or operations.
The special operators `=~' and `!~' are similar to `==' and `!=' except
that the string on the right side can have pattern matching characters
(like *, ? or []) and the test is whether the string on the left matches
the pattern on the right.
.PP
The shell also allows file enquiries of the form
.DS
\-? filename
.DE
where `?' is replace by a number of single characters.
For instance the expression primitive
.DS
\-e filename
.DE
tell whether the file
`filename'
exists.
Other primitives test for read, write and execute access to the file,
whether it is a directory, or has non-zero length.
.PP
It is possible to test whether a command terminates normally,
by a primitive of the
form `{ command }' which returns true, i.e. `1' if the command
succeeds exiting normally with exit status 0, or `0' if the command
terminates abnormally or with exit status non-zero.
If more detailed information about the execution status of a command
is required, it can be executed and the variable `$status' examined
in the next command.
Since `$status' is set by every command, it is very transient.
It can be saved if it is inconvenient to use it only in the single
immediately following command.
.PP
For a full list of expression components available see the manual
section for the shell.
.NH 2
Sample shell script
.PP
A sample shell script which makes use of the expression mechanism
of the shell and some of its control structure follows:
.DS
% cat copyc
#
# Copyc copies those C programs in the specified list
# to the directory ~/backup if they differ from the files
# already in ~/backup
#
set noglob
foreach i ($argv)

        if ($i !~ *.c) continue  # not a .c file so do nothing

        if (! \-r ~/backup/$i:t) then
                echo $i:t not in backup... not cp\e\'ed
                continue
        endif

        cmp \-s $i ~/backup/$i:t # to set $status

        if ($status != 0) then
                echo new backup of $i
                cp $i ~/backup/$i:t
        endif
end
.DE
.PP
This script makes use of the
.I foreach
command, which causes the shell to execute the commands between the
.I foreach
and the matching
.I end
for each of the values given between `(' and `)' with the named
variable, in this case `i' set to successive values in the list.
Within this loop we may use the command
.I break
to stop executing the loop
and
.I continue
to prematurely terminate one iteration
and begin the next.
After the
.I foreach
loop the iteration variable
(\fIi\fR in this case)
has the value at the last iteration.
.PP
We set the variable
.I noglob
here to prevent filename expansion of the members of
.I argv.
This is a good idea, in general, if the arguments to a shell script
are filenames which have already been expanded or if the arguments
may contain filename expansion metacharacters.
It is also possible to quote each use of a `$' variable expansion,
but this is harder and less reliable.
.PP
The other control construct used here is a statement of the form
.DS
\fBif\fR ( expression ) \fBthen\fR
	command
	...
\fBendif\fR
.DE
The placement of the keywords here is
.B not
flexible due to the current implementation of the shell.\(dg
.FS
\(dgThe following two formats are not currently acceptable to the shell:
.sp
.in +5
.nf
\fBif\fR ( expression )		# \fBWon't work!\fR
\fBthen\fR
	command
	...
\fBendif\fR
.fi
.in -5
.sp
and
.sp
.in +5
.nf
\fBif\fR ( expression ) \fBthen\fR command \fBendif\fR		# \fBWon't work\fR
.in -5
.fi
.FE
.PP
The shell does have another form of the if statement of the form
.DS
\fBif\fR ( expression ) \fBcommand\fR
.DE
which can be written
.DS
\fBif\fR ( expression ) \e
	command
.DE
Here we have escaped the newline for the sake of appearance.
The command must not involve `\||\|', `&' or `;'
and must not be another control command.
The second form requires the final `\e' to
.B immediately
precede the end-of-line.
.PP
The more general
.I if
statements above also admit a sequence of
.I else\-if
pairs followed by a single
.I else
and an
.I endif,
e.g.:
.DS
\fBif\fR ( expression ) \fBthen\fR
	commands
\fBelse\fR \fBif\fR (expression ) \fBthen\fR
	commands
\&...

\fBelse\fR
	commands
\fBendif\fR
.DE
.PP
Another important mechanism used in shell scripts is the `:' modifier.
We can use the modifier `:r' here to extract a root of a filename or
`:e' to extract the
.I extension.
Thus if the variable
.I i
has the value
`/mnt/foo.bar'
then
.sp
.in +5
.nf
% echo $i $i:r $i:e
/mnt/foo.bar /mnt/foo bar
%
.sp
.in -5
.fi
shows how the `:r' modifier strips off the trailing `.bar' and the
the `:e' modifier leaves only the `bar'.
Other modifiers will take off the last component of a pathname leaving
the head `:h' or all but the last component of a pathname leaving the
tail `:t'.
These modifiers are fully described in the
.I csh
manual pages in the User's Reference Manual.
It is also possible to use the
.I "command substitution"
mechanism described in the next major section to perform modifications
on strings to then reenter the shell's environment.
Since each usage of this mechanism involves the creation of a new process,
it is much more expensive to use than the `:' modification mechanism.\(dd
.FS
\(dd It is also important to note that
the current implementation of the shell limits the number of `:' modifiers
on a `$' substitution to 1.
Thus
.sp
.nf
.in +5
% echo $i $i:h:t
/a/b/c /a/b:t
%
.in -5
.fi
.sp
does not do what one would expect.
.FE
Finally, we note that the character `#' lexically introduces a shell
comment in shell scripts (but not from the terminal).
All subsequent characters on the input line after a `#' are discarded
by the shell.
This character can be quoted using `\'' or `\e' to place it in
an argument word.
.NH 2
Other control structures
.PP
The shell also has control structures
.I while
and
.I switch
similar to those of C.
These take the forms
.DS
\fBwhile\fR ( expression )
	commands
\fBend\fR
.DE
and
.DS
\fBswitch\fR ( word )

\fBcase\fR str1:
	commands
	\fBbreaksw\fR

\& ...

\fBcase\fR strn:
	commands
	\fBbreaksw\fR

\fBdefault:\fR
	commands
	\fBbreaksw\fR

\fBendsw\fR
.DE
For details see the manual section for
.I csh.
C programmers should note that we use
.I breaksw
to exit from a
.I switch
while
.I break
exits a
.I while
or
.I foreach
loop.
A common mistake to make in
.I csh
scripts is to use
.I break
rather than
.I breaksw
in switches.
.PP
Finally,
.I csh
allows a
.I goto
statement, with labels looking like they do in C, i.e.:
.DS
loop:
	commands
	\fBgoto\fR loop
.DE
.NH 2
Supplying input to commands
.PP
Commands run from shell scripts receive by default the standard
input of the shell which is running the script.
This is different from previous shells running
under \s-2UNIX\s0.  It allows shell scripts to fully participate
in pipelines, but mandates extra notation for commands which are to take
inline data.
.PP
Thus we need a metanotation for supplying inline data to commands in
shell scripts.
As an example, consider this script which runs the editor to
delete leading blanks from the lines in each argument file:
.DS
% cat deblank
# deblank \-\- remove leading blanks
foreach i ($argv)
ed \- $i << \'EOF\'
1,$s/^[ ]*//
w
q
\&\'EOF\'
end
%
.DE
The notation `<< \'EOF\''
means that the standard input for the
.I ed
command is to come from the text in the shell script file
up to the next line consisting of exactly `\'EOF\''.
The fact that the `EOF' is enclosed in `\'' characters, i.e. quoted,
causes the shell to not perform variable substitution on the
intervening lines.
In general, if any part of the word following the `<<' which the
shell uses to terminate the text to be given to the command is quoted
then these substitutions will not be performed.
In this case since we used the form `1,$' in our editor script
we needed to insure that this `$' was not variable substituted.
We could also have insured this by preceding the `$' here with a `\e',
i.e.:
.DS
1,\e$s/^[ ]*//
.DE
but quoting the `EOF' terminator is a more reliable way of achieving the
same thing.
.NH 2
Catching interrupts
.PP
If our shell script creates temporary files, we may wish to catch
interruptions of the shell script so that we can clean up
these files.
We can then do
.DS
onintr label
.DE
where
.I label
is a label in our program.
If an interrupt is received the shell will do a
`goto label'
and we can remove the temporary files and then do an
.I exit
command (which is built in to the shell)
to exit from the shell script.
If we wish to exit with a non-zero status we can do
.DS
exit(1)
.DE
e.g. to exit with status `1'.
.NH 2
What else?
.PP
There are other features of the shell useful to writers of shell
procedures.
The
.I verbose
and
.I echo
options and the related
.I \-v
and
.I \-x
command line options can be used to help trace the actions of the shell.
The
.I \-n
option causes the shell only to read commands and not to execute
them and may sometimes be of use.
.PP
One other thing to note is that
.I csh
will not execute shell scripts which do not begin with the
character `#', that is shell scripts that do not begin with a comment.
Similarly, the `/bin/sh' on your system may well defer to `csh'
to interpret shell scripts which begin with `#'.
This allows shell scripts for both shells to live in harmony.
.PP
There is also another quotation mechanism using `"' which allows
only some of the expansion mechanisms we have so far discussed to occur
on the quoted string and serves to make this string into a single word
as `\'' does.
.bp
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.4	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.nr H1 3
.NH
Other, less commonly used, shell features
.NH 2
Loops at the terminal; variables as vectors
.PP
It is occasionally useful to use the
.I foreach
control structure at the terminal to aid in performing a number
of similar commands.
For instance, there were at one point three shells in use on the Cory \s-2UNIX\s0
system at Cory Hall,
`/bin/sh',
`/bin/nsh',
and
`/bin/csh'.
To count the number of persons using each shell one could have issued
the commands
.DS
% grep \-c csh$ /etc/passwd
27
% grep \-c nsh$ /etc/passwd
128
% grep \-c \-v sh$ /etc/passwd
430
%
.DE
Since these commands are very similar we can use
.I foreach
to do this more easily.
.DS
% foreach i (\'sh$\' \'csh$\' \'\-v sh$\')
? grep \-c $i /etc/passwd
? end
27
128
430
%
.DE
Note here that the shell prompts for
input with `? ' when reading the body of the loop.
.PP
Very useful with loops are variables which contain lists of filenames
or other words.
You can, for example, do
.DS
% set a=(\`ls\`)
% echo $a
csh.n csh.rm
% ls
csh.n
csh.rm
% echo $#a
2
%
.DE
The
.I set
command here gave the variable
.I a
a list of all the filenames in the current directory as value.
We can then iterate over these names to perform any chosen function.
.PP
The output of a command within `\`' characters is converted by
the shell to a list of words.
You can also place the `\`' quoted string within `"' characters
to take each (non-empty) line as a component of the variable;
preventing the lines from being split into words at blanks and tabs.
A modifier `:x' exists which can be used later to expand each component
of the variable into another variable splitting it into separate words
.NH 2
Braces { ... } in argument expansion
.PP
Another form of filename expansion, alluded
to before involves the characters `{' and `}'.
These characters specify that the contained strings, separated by `,'
are to be consecutively substituted into the containing characters
and the results expanded left to right.
Thus
.DS
A{str1,str2,...strn}B
.DE
expands to
.DS
Astr1B Astr2B ... AstrnB
.DE
This expansion occurs before the other filename expansions, and may
be applied recursively (i.e. nested).
The results of each expanded string are sorted separately, left
to right order being preserved.
The resulting filenames are not required to exist if no other expansion
mechanisms are used.
This means that this mechanism can be used to generate arguments which are
not filenames, but which have common parts.
.PP
A typical use of this would be
.DS
mkdir ~/{hdrs,retrofit,csh}
.DE
to make subdirectories `hdrs', `retrofit' and `csh'
in your home directory.
This mechanism is most useful when the common prefix is longer
than in this example, i.e.
.DS
chown root /usr/{ucb/{ex,edit},lib/{ex?.?*,how_ex}}
.DE
.NH 2
Command substitution
.PP
A command enclosed in `\`' characters is replaced, just before
filenames are expanded, by the output from that command.
Thus it is possible to do
.DS
set pwd=\`pwd\`
.DE
to save the current directory in the variable
.I pwd
or to do
.DS
ex \`grep \-l TRACE *.c\`
.DE
to run the editor
.I ex
supplying as arguments those files whose names end in `.c'
which have the string `TRACE' in them.*
.FS
*Command expansion also occurs in input redirected with `<<'
and within `"' quotations.
Refer to the shell manual section for full details.
.FE
.NH 2
Other details not covered here
.PP
In particular circumstances it may be necessary to know the exact
nature and order of different substitutions performed by the shell.
The exact meaning of certain combinations of quotations is also
occasionally important.
These are detailed fully in its manual section.
.PP
The shell has a number of command line option flags mostly of use
in writing \s-2UNIX\s0 programs,
and debugging shell scripts.
See the csh(1) manual section for a list of these options.
.bp
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.a	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.SH
Appendix \- Special characters
.LP
The following table lists the special characters of
.I csh
and the \s-2UNIX\s0 system, giving for each the section(s) in which it
is discussed.
A number of these characters also have special meaning in expressions.
See the
.I csh
manual section
for a complete list.
.ta .75i 1.5i 2.25i
.LP
Syntactic metacharacters
.DS
;	2.4	separates commands to be executed sequentially
|	1.5	separates commands in a pipeline
( )	2.2,3.6	brackets expressions and variable values
&	2.5	follows commands to be executed without waiting for completion
.DE
.LP
Filename metacharacters
.DS
/	1.6	separates components of a file's pathname
\&.	1.6	separates root parts of a file name from extensions
?	1.6	expansion character matching any single character
*	1.6	expansion character matching any sequence of characters
[ ]	1.6	expansion sequence matching any single character from a set
~	1.6	used at the beginning of a filename to indicate home directories
{ }	4.2	used to specify groups of arguments with common parts
.DE
.LP
Quotation metacharacters
.DS
\e	1.7	prevents meta-meaning of following single character
\'	1.7	prevents meta-meaning of a group of characters
"	4.3	like \', but allows variable and command expansion
.DE
.LP
Input/output metacharacters
.DS
<	1.5	indicates redirected input
>	1.3	indicates redirected output
.DE
.LP
Expansion/substitution metacharacters
.DS
$	3.4	indicates variable substitution
!	2.3	indicates history substitution
:	3.6	precedes substitution modifiers
^	2.3	used in special forms of history substitution
\`	4.3	indicates command substitution
.DE
.LP
Other metacharacters
.DS
#	1.3,3.6	begins scratch file names; indicates shell comments
\-	1.2	prefixes option (flag) arguments to commands
%	2.6	prefixes job name specifications
.DE
.bp
.\"-
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
.\" 3. Neither the name of the University nor the names of its contributors
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
.\"	@(#)csh.g	8.1 (Berkeley) 6/8/93
.\" $FreeBSD$
.\"
.SH
Glossary
.PP
This glossary lists the most important terms introduced in the
introduction to the
shell and gives references to sections of the shell
document for further information about them.
References of the form
`pr (1)'
indicate that the command
.I pr
is in the \s-2UNIX\s0 User Reference manual in section 1.
You can look at an online copy of its manual page by doing
.DS
man 1 pr
.DE
References of the form (2.5)
indicate that more information can be found in section 2.5 of this
manual.
.IP \&\fB.\fR 15n
Your current directory has the name `.' as well as the name printed
by the command
.I pwd;
see also
.I dirs.
The current directory `.' is usually the first
.I component
of the search path contained in the variable
.I path ,
thus commands which are in `.' are found first (2.2).
The character `.' is also used in separating
.I components
of filenames
(1.6).
The character `.' at the beginning of a
.I component
of a
.I pathname
is treated specially and not matched by the
.I "filename expansion"
metacharacters `?', `*', and `[' `]' pairs (1.6).
.IP \&\fB..\fR
Each directory has a file `..' in it which is a reference to its
parent directory.
After changing into the directory with
.I chdir ,
i.e.
.DS
chdir paper
.DE
you can return to the parent directory by doing
.DS
chdir ..
.DE
The current directory is printed by
.I pwd
(2.7).
.IP a.out
Compilers which create executable images create them, by default, in the
file
.I a.out.
for historical reasons (2.3).
.IP "absolute pathname"
.br
A
.I pathname
which begins with a `/' is
.I absolute
since it specifies the
.I path
of directories from the beginning
of the entire directory system \- called the
.I root
directory.
.I Pathname s
which are not
.I absolute
are called
.I relative
(see definition of
.I "relative pathname" )
(1.6).
.IP alias
An
.I alias
specifies a shorter or different name for a \s-2UNIX\s0
command, or a transformation on a command to be performed in
the shell.
The shell has a command
.I alias
which establishes
.I aliases
and can print their current values.
The command
.I unalias
is used to remove
.I aliases
(2.4).
.IP argument
Commands in \s-2UNIX\s0 receive a list of
.I argument
words.
Thus the command
.DS
echo a b c
.DE
consists of the
.I "command name"
`echo' and three
.I argument
words `a', `b' and `c'.
The set of
.I arguments
after the
.I "command name"
is said to be the
.I "argument list"
of the command (1.1).
.IP argv
The list of arguments to a command written in the shell language
(a shell script or shell procedure) is stored in a variable called
.I argv
within the shell.
This name is taken from the conventional name in the
C programming language (3.4).
.IP background
Commands started without waiting for them to complete are called
.I background
commands (2.6).
.IP base
A filename is sometimes thought of as consisting of a
.I base
part, before any `.' character, and an
.I extension
\- the part after
the `.'.  See
.I filename
and
.I extension
(1.6) and basename (1).
.IP bg
The
.I bg
command causes a
.I suspended
job to continue execution in the
.I background
(2.6).
.IP bin
A directory containing binaries of programs and shell scripts to be
executed is typically called a
.I bin
directory.
The standard system
.I bin
directories are `/bin' containing the most
heavily used commands and `/usr/bin' which contains most other user
programs.
Programs developed at UC Berkeley live in `/usr/ucb', while locally
written programs live in `/usr/local'.  Games are kept in the directory
`/usr/games'.
You can place binaries in any directory.
If you wish to execute them often, the name of the directories
should be a
.I component
of the variable
.I path .
.IP break
.I Break
is a builtin command used to exit from loops within the control
structure of the shell (3.7).
.IP breaksw
The
.I breaksw
builtin command is used to exit from a
.I switch
control structure, like a
.I break
exits from loops (3.7).
.IP builtin
A command executed directly by the shell is called a
.I builtin
command.
Most commands in \s-2UNIX\s0 are not built into the shell,
but rather exist as files in
.I bin
directories.
These commands are accessible because the directories in which
they reside are named in the
.I path
variable.
.IP case
A
.I case
command is used as a label in a
.I switch
statement in the shell's control structure, similar to that of the
language C.
Details are given in the shell documentation `csh (1)' (3.7).
.IP cat
The
.I cat
program catenates a list of specified files on the
.I "standard output" .
It is usually used to look at the contents of a single file on the terminal,
to `cat a file' (1.8, 2.3).
.IP cd
The
.I cd
command is used to change the
.I "working directory" .
With no arguments,
.I cd
changes your
.I "working directory"
to be your
.I home
directory (2.4, 2.7).
.IP chdir
The
.I chdir
command is a synonym for
.I cd .
.I Cd
is usually used because it is easier to type.
.IP chsh
The
.I chsh
command is used to change the shell which you use on \s-2UNIX\s0.
By default, you use a different version of the shell
which resides in `/bin/sh'.
You can change your shell to `/bin/csh' by doing
.DS
chsh your-login-name /bin/csh
.DE
Thus I would do
.DS
chsh bill /bin/csh
.DE
It is only necessary to do this once.
The next time you log in to \s-2UNIX\s0 after doing this command,
you will be using
.I csh
rather than the shell in `/bin/sh' (1.9).
.IP cmp
.I Cmp
is a program which compares files.
It is usually used on binary files, or to see if two files are identical (3.6).
For comparing text files the program
.I diff ,
described in `diff (1)' is used.
.IP command
A function performed by the system, either by the shell
(a builtin
.I command )
or by a program residing in a file in
a directory within the \s-2UNIX\s0 system, is called a
.I command
(1.1).
.IP "command name"
.br
When a command is issued, it consists of a
.I "command name" ,
which is the first word of the command,
followed by arguments.
The convention on \s-2UNIX\s0 is that the first word of a
command names the function to be performed (1.1).
.IP "command substitution"
.br
The replacement of a command enclosed in `\`' characters
by the text output by that command
is called
.I "command substitution"
(4.3).
.IP component
A part of a
.I pathname
between `/' characters is called a
.I component
of that
.I pathname .
A variable
which has multiple strings as value is said to have
several
.I component s;
each string is a
.I component
of the variable.
.IP continue
A builtin command which causes execution of the enclosing
.I foreach
or
.I while
loop to cycle prematurely.
Similar to the
.I continue
command in the programming language C (3.6).
.IP control-
Certain special characters, called
.I control
characters, are produced by holding down the \s-2CONTROL\s0 key
on your terminal and simultaneously pressing another character, much like
the \s-2SHIFT\s0 key is used to produce upper case characters. Thus
.I control- c
is produced by holding down the \s-2CONTROL\s0 key while pressing the
`c' key.  Usually \s-2UNIX\s0 prints a caret (^) followed by the
corresponding letter when you type a
.I control
character (e.g. `^C' for
.I control- c
(1.8).
.IP "core\ dump"
When a program terminates abnormally, the system places an image
of its current state in a file named `core'.
This
.I "core dump"
can be examined with the system debugger `adb (1)'
or `sdb (1)' in order to determine what went wrong with the program (1.8).
If the shell produces a message of the form
.DS
Illegal instruction (core dumped)
.DE
(where `Illegal instruction' is only one of several possible
messages), you should report this to the author of the program
or a system administrator,
saving the `core' file.
.IP cp
The
.I cp
(copy) program is used to copy the contents of one file into another
file.
It is one of the most commonly used \s-2UNIX\s0 commands (1.6).
.IP csh
The name of the shell
program that this document describes.
.IP \&.cshrc
The file
.I \&.cshrc
in your
.I home
directory is read by each shell as it begins execution.
It is usually used to change the setting of the variable
.I path
and to set
.I alias
parameters which are to take effect globally (2.1).
.IP cwd
The
.I cwd
variable in the shell holds the
.I "absolute pathname"
of the current
.I "working directory" \&.
It is changed by the shell whenever your current
.I "working directory"
changes and should not be changed otherwise (2.2).
.IP date
The
.I date
command prints the current date and time (1.3).
.IP debugging
.I Debugging
is the process of correcting mistakes in programs and shell scripts.
The shell has several options and variables which may be used
to aid in shell
.I debugging
(4.4).
.IP default:
The label
.I default:
is used within shell
.I switch
statements, as it is in the C language
to label the code to be executed if none of the
.I case
labels matches the value switched on (3.7).
.IP \s-2DELETE\s0
The
\s-2DELETE\s0
or
\s-2RUBOUT\s0
key on the terminal normally causes an interrupt to be sent to the current job.
Many users change the interrupt character to be ^C.
.IP detached
A command that continues running in the
.I background
after you logout is said to be
.I detached .
.IP diagnostic
An error message produced by a program is often referred to as a
.I diagnostic .
Most error messages are not written to the
.I "standard output" ,
since that is often directed away from the terminal (1.3, 1.5).
Error messsages are instead written to the
.I "diagnostic output"
which may be directed away from the terminal, but usually is not.
Thus
.I diagnostics
will usually appear on the terminal (2.5).
.IP directory
A structure which contains files.
At any time you are in one particular
.I directory
whose names can be printed by the command
.I pwd .
The
.I chdir
command will change you to another
.I directory ,
and make the files
in that
.I directory
visible. The
.I directory
in which you are when you first login is your
.I home
directory (1.1, 2.7).
.IP "directory\ stack"
The shell saves the names of previous
.I "working directories"
in the
.I "directory stack"
when you change your current
.I "working directory"
via the
.I pushd
command.  The
.I "directory stack"
can be printed by using the
.I dirs
command, which includes your current
.I "working directory"
as the first directory name on the left (2.7).
.IP dirs
The
.I dirs
command prints the shell's
.I "directory stack"
(2.7).
.IP du
The
.I du
command is a program (described in `du (1)') which
prints the number of disk blocks is all directories below
and including your current
.I "working directory"
(2.6).
.IP echo
The
.I echo
command prints its arguments (1.6, 3.6).
.IP else
The
.I else
command is part of the `if-then-else-endif' control
command construct (3.6).
.IP endif
If an
.I if
statement is ended with the word
.I then ,
all lines following the
.I if
up to a line starting with the word
.I endif
or
.I else
are executed if the condition between parentheses after the
.I if
is true (3.6).
.IP \s-2EOF\s0
An
.I "end\f1-\fPof\f1-\fPfile"
is generated by the terminal by a control-d,
and whenever a command reads to the end of a file which
it has been given as input.
Commands receiving input from a
.I pipe
receive an
.I "end\f1-\fPof\f1-\fPfile"
when the command sending them input completes.
Most commands terminate when they receive an
.I "end\f1-\fPof\f1-\fPfile" .
The shell has an option to ignore
.I "end\f1-\fPof\f1-\fPfile"
from a terminal
input which may help you keep from logging out accidentally
by typing too many control-d's (1.1, 1.8, 3.8).
.IP escape
A character `\e' used to prevent the special meaning of a metacharacter
is said to
.I escape
the character from its special meaning.
Thus
.DS
echo \e*
.DE
will echo the character `*' while just
.DS
echo *
.DE
will echo the names of the file in the current directory.
In this example, \e
.I escape s
`*' (1.7).
There is also a non-printing character called
.I escape ,
usually labelled
\s-2ESC\s0
or
\s-2ALTMODE\s0
on terminal keyboards.
Some older \s-2UNIX\s0 systems use this character to indicate that
output is to be
.I suspended .
Most systems use control-s to stop the output and control-q to start it.
.IP /etc/passwd
This file contains information about the accounts currently on the
system.
It consists of a line for each account with fields separated by
`:' characters (1.8).
You can look at this file by saying
.DS
cat /etc/passwd
.DE
The commands
.I finger
and
.I grep
are often used to search for information in this file.
See `finger (1)', `passwd(5)', and `grep (1)' for more details.
.IP exit
The
.I exit
command is used to force termination of a shell script,
and is built into the shell (3.9).
.IP "exit\ status"
A command which discovers a problem may reflect this back to the command
(such as a shell) which invoked (executed) it.
It does this by returning a non-zero number as its
.I "exit status" ,
a status of zero being considered
`normal termination'.
The
.I exit
command can be used to force a shell command script to give a non-zero
.I "exit status"
(3.6).
.IP expansion
The replacement of strings in the shell input which contain metacharacters
by other strings is referred to as the process of
.I expansion .
Thus the replacement of the word `*' by a sorted list of files
in the current directory is a `filename expansion'.
Similarly the replacement of the characters `!!' by the text of
the last command is a `history expansion'.
.I Expansions
are also referred to as
.I substitutions
(1.6, 3.4, 4.2).
.IP expressions
.I Expressions
are used in the shell
to control the conditional structures used in the writing of shell
scripts and in calculating values for these scripts.
The operators available in shell
.I expressions
are those of the language
C (3.5).
.IP extension
Filenames often consist of a
.I base
name and an
.I extension
separated by the character `.'.
By convention, groups of related files often share the same
.I root
name.
Thus if `prog.c' were a C program, then the object file for this
program would be stored in `prog.o'.
Similarly a paper written with the
`\-me'
nroff macro package might be stored in
`paper.me'
while a formatted version of this paper might be kept in
`paper.out' and a list of spelling errors in
`paper.errs' (1.6).
.IP fg
The
.I "job control"
command
.I fg
is used to run a
.I background
or
.I suspended
job in the
.I foreground
(1.8, 2.6).
.IP filename
Each file in \s-2UNIX\s0 has a name consisting of up to 14 characters
and not including the character `/' which is used in
.I pathname
building.  Most
.I filenames
do not begin with the character `.', and contain
only letters and digits with perhaps a `.' separating the
.I base
portion of the
.I filename
from an
.I extension
(1.6).
.IP "filename expansion"
.br
.I "Filename expansion"
uses the metacharacters `*', `?' and `[' and `]'
to provide a convenient mechanism for naming files.
Using
.I "filename expansion"
it is easy to name all the files in
the current directory, or all files which have a common
.I root
name. Other
.I "filename expansion"
mechanisms use the metacharacter `~' and allow
files in other users' directories to be named easily (1.6, 4.2).
.IP flag
Many \s-2UNIX\s0 commands accept arguments which are not the names
of files or other users but are used to modify the action of the commands.
These are referred to as
.I flag
options, and by convention consist of one or more letters preceded by
the character `\-' (1.2).
Thus the
.I ls
(list files) command has an option
`\-s' to list the sizes of files.
This is specified
.DS
ls \-s
.DE
.IP foreach
The
.I foreach
command is used in shell scripts and at the terminal to specify
repetition of a sequence of commands while the value of a certain
shell variable ranges through a specified list (3.6, 4.1).
.IP foreground
When commands are executing in the normal way such that the
shell is waiting for them to finish before prompting for another
command they are said to be
.I "foreground jobs"
or
.I "running in the foreground" \&.
This is as opposed to
.I background .
.I Foreground
jobs can be stopped by signals
from the terminal caused by typing different
control characters at the keyboard (1.8, 2.6).
.IP goto
The shell has a command
.I goto
used in shell scripts to transfer control to a given label (3.7).
.IP grep
The
.I grep
command searches through a list of argument files for a specified string.
Thus
.DS
grep bill /etc/passwd
.DE
will print each line in the file
.I "/etc/passwd"
which contains the string `bill'.
Actually,
.I grep
scans for
.I "regular expressions"
in the sense of the editors
`ed (1)' and `ex (1)'.
.I Grep
stands for
`globally find
.I "regular expression"
and print' (2.4).
.IP head
The
.I head
command prints the first few lines of one or more files.
If you have a bunch of files containing text which you are wondering
about it is sometimes useful to run
.I head
with these files as arguments.
This will usually show enough of what is in these files to let you decide
which you are interested in (1.5).
.br
.I Head
is also used to describe the part of a
.I pathname
before and including the last `/' character.  The
.I tail
of a
.I pathname
is the part after the last `/'.  The `:h' and `:t' modifiers allow the
.I head
or
.I tail
of a
.I pathname
stored in a shell variable to be used (3.6).
.IP history
The
.I history
mechanism of the shell allows previous commands to be repeated,
possibly after modification to correct typing mistakes or to change
the meaning of the command.
The shell has a
.I "history list"
where these commands are kept, and a
.I history
variable which controls how large this list is (2.3).
.IP "home\ directory"
.br
Each user has a
.I "home directory" ,
which is given in your entry
in the password file,
.I /etc/passwd .
This is the directory which you are placed in when you first login.
The
.I cd
or
.I chdir
command with no arguments takes you back to this directory, whose
name is recorded in the shell variable
.I home .
You can also access the
.I "home directories"
of other users in forming
filenames using a
.I "filename expansion"
notation and the character `~' (1.6).
.IP if
A conditional command within the shell, the
.I if
command is used in shell command scripts to make decisions
about what course of action to take next (3.6).
.IP ignoreeof
Normally, your shell will exit, printing
`logout'
if you type a control-d at a prompt of `% '.
This is the way you usually log off the system.
You can
.I set
the
.I ignoreeof
variable if you wish in your
.I \&.login
file and then use the command
.I logout
to logout.
This is useful if you sometimes accidentally type too many control-d
characters, logging yourself off
(2.2).
.IP input
Many commands on \s-2UNIX\s0 take information from the terminal or from
files which they then act on.
This information is called
.I input .
Commands normally read for
.I input
from their
.I "standard input"
which is, by default, the terminal.
This
.I "standard input"
can be redirected from a file using a shell metanotation
with the character `<'.
Many commands will also read from a file specified as argument.
Commands placed in
.I pipelines
will read from the output of the previous
command in the
.I pipeline .
The leftmost command in a
.I pipeline
reads from the terminal if
you neither redirect its
.I input
nor give it a filename to use as
.I "standard input" .
Special mechanisms exist for supplying input to commands in shell
scripts (1.5, 3.8).
.IP interrupt
An
.I interrupt
is a signal to a program that is generated by typing ^C. (On older versions
of UNIX the \s-2RUBOUT\s0 or \s-2DELETE\s0 key were used for this purpose.)
It causes most programs to stop execution.
Certain programs, such as the shell and the editors,
handle an
.I interrupt
in special ways, usually by stopping what they
are doing and prompting for another command.
While the shell is executing another command and waiting for it
to finish, the shell does not listen to
.I interrupts.
The shell often wakes up when you hit
.I interrupt
because many commands
die when they receive an
.I interrupt
(1.8, 3.9).
.IP job
One or more commands
typed on the same input line separated by `|' or `;' characters
are run together and are called a
.I job \&.
Simple commands run by themselves without any `|' or `;' characters
are the simplest
.I jobs.
.I Jobs
are classified as
.I foreground ,
.I background ,
or
.I suspended
(2.6).
.IP "job\ control"
The builtin functions that control the execution of
jobs are called
.I "job control"
commands.  These are
.I "bg, fg, stop, kill"
(2.6).
.IP "job\ number"
When each job
is started it is assigned a small number called a
.I "job number"
which is printed next to the job in the output of the
.I jobs
command.  This number, preceded by a `%' character, can be used as an argument
to
.I "job control"
commands to indicate
a specific job (2.6).
.IP jobs
The
.I jobs
command prints a table showing
jobs that are either running in the
.I background
or are
.I suspended
(2.6).
.IP kill
A command which sends a
signal
to a job causing it to terminate (2.6).
.IP \&.login
The file
.I \&.login
in your
.I home
directory is read by the shell each time you login to \s-2UNIX\s0
and the commands there are executed.
There are a number of commands which are usefully placed here,
especially
.I set
commands to the shell itself (2.1).
.IP "login\ shell"
The shell that is started on your terminal when you login is called
your
.I "login shell" .
It is different from other shells which you may run (e.g. on
shell scripts)
in that it reads the
.I \&.login
file before reading commands from the terminal and it reads the
.I \&.logout
file after you logout
(2.1).
.IP logout
The
.I logout
command causes a login shell to exit.
Normally, a login shell will exit when you hit control-d
generating an
.I end\f1-\fPof\f1-\fPfile,
but if you have set
.I ignoreeof
in you
.I \&.login
file then this will not work and you must use
.I logout
to log off the \s-2UNIX\s0 system (2.8).
.IP \&.logout
When you log off of \s-2UNIX\s0 the shell will execute commands from
the file
.I \&.logout
in your
.I home
directory after it prints `logout'.
.IP lpr
The command
.I lpr
is the line printer daemon.
The standard input of
.I lpr
spooled and printed on the \s-2UNIX\s0 line printer.
You can also give
.I lpr
a list of filenames as arguments to be printed.
It is most common to use
.I lpr
as the last component of a
.I pipeline
(2.3).
.IP ls
The
.I ls
(list files) command is one of the most commonly used \s-2UNIX\s0
commands.
With no argument filenames it prints the names of the files in the
current directory.
It has a number of useful
.I flag
arguments, and can also be given the names of directories
as arguments, in which case it lists the names of the files in these
directories (1.2).
.IP mail
The
.I mail
program is used to send and receive messages from other \s-2UNIX\s0
users (1.1, 2.1), whether they are logged on or not.
.IP make
The
.I make
command is used to maintain one or more related files and to
organize functions to be performed on these files.
In many ways
.I make
is easier to use, and more helpful than
shell command scripts (3.2).
.IP makefile
The file containing commands for
.I make
is called
.I makefile
or
.I Makefile
(3.2).
.IP manual
The
.I manual
often referred to is the
`\s-2UNIX\s0 manual'.
It contains 8 numbered sections with a description of each \s-2UNIX\s0
program (section 1), system call (section 2), subroutine (section 3),
device (section 4), special data structure (section 5), game (section 6),
miscellaneous item (section 7) and system administration program (section 8).
There are also supplementary documents (tutorials and reference guides)
for individual programs which require explanation in more detail.
An online version of the
.I manual
is accessible through the
.I man
command.
Its documentation can be obtained online via
.DS
man man
.DE
If you can't decide what manual page to look in, try the
.I apropos (1)
command.
The supplementary documents are in subdirectories of /usr/doc.
.IP metacharacter
.br
Many characters which are neither letters nor digits have special meaning
either to the shell or to \s-2UNIX\s0.
These characters are called
.I metacharacters .
If it is necessary to place these characters in arguments to commands
without them having their special meaning then they must be
.I quoted .
An example of a
.I metacharacter
is the character `>' which is used
to indicate placement of output into a file.
For the purposes of the
.I history
mechanism,
most unquoted
.I metacharacters
form separate words (1.4).
The appendix to this user's manual lists the
.I metacharacters
in groups by their function.
.IP mkdir
The
.I mkdir
command is used to create a new directory.
.IP modifier
Substitutions with the
.I history
mechanism, keyed by the character `!'
or of variables using the metacharacter `$', are often subjected
to modifications, indicated by placing the character `:' after the
substitution and following this with the
.I modifier
itself.
The
.I "command substitution"
mechanism can also be used to perform modification in a similar way,
but this notation is less clear (3.6).
.IP more
The program
.I more
writes a file on your terminal allowing you to control how much text
is displayed at a time.
.I More
can move through the file screenful by screenful, line by line,
search forward for a string, or start again at the beginning of the file.
It is generally the easiest way of viewing a file (1.8).
.IP noclobber
The shell has a variable
.I noclobber
which may be set in the file
.I \&.login
to prevent accidental destruction of files by the `>' output redirection
metasyntax of the shell (2.2, 2.5).
.IP noglob
The shell variable
.I noglob
is set to suppress the
.I "filename expansion"
of arguments containing the metacharacters `~', `*', `?', `[' and `]' (3.6).
.IP notify
The
.I notify
command tells the shell to report on the termination of a specific
.I "background job"
at the exact time it occurs as opposed to waiting
until just before the next prompt to report the termination.
The
.I notify
variable, if set, causes the shell to always report the termination
of
.I background
jobs exactly when they occur (2.6).
.IP onintr
The
.I onintr
command is built into the shell and is used to control the action
of a shell command script when an
.I interrupt
signal is received (3.9).
.IP output
Many commands in \s-2UNIX\s0 result in some lines of text which are
called their
.I output.
This
.I output
is usually placed on what is known as the
.I "standard output"
which is normally connected to the user's terminal.
The shell has a syntax using the metacharacter `>' for redirecting
the
.I "standard output"
of a command to a file (1.3).
Using the
.I pipe
mechanism and the metacharacter `|' it is also possible for
the
.I "standard output"
of one command to become the
.I "standard input"
of another command (1.5).
Certain commands such as the line printer daemon
.I p
do not place their results on the
.I "standard output"
but rather in more
useful places such as on the line printer (2.3).
Similarly the
.I write
command places its output on another user's terminal rather than its
.I "standard output"
(2.3).
Commands also have a
.I "diagnostic output"
where they write their error messages.
Normally these go to the terminal even if the
.I "standard output"
has been sent to a file or another command, but it is possible
to direct error diagnostics along with
.I "standard output"
using a special metanotation (2.5).
.IP path
The shell has a variable
.I path
which gives the names of the directories in which it searches for
the commands which it is given.
It always checks first to see if the command it is given is
built into the shell.
If it is, then it need not search for the command as it can do it internally.
If the command is not builtin, then the shell searches for a file
with the name given in each of the directories in the
.I path
variable, left to right.
Since the normal definition of the
.I path
variable is
.DS
path	(. /usr/ucb /bin /usr/bin)
.DE
the shell normally looks in the current directory, and then in
the standard system directories `/usr/ucb', `/bin' and `/usr/bin' for the named
command (2.2).
If the command cannot be found the shell will print an error diagnostic.
Scripts of shell commands will be executed using another shell to interpret
them if they have `execute' permission set.
This is normally true because a command of the form
.DS
chmod 755 script
.DE
was executed to turn this execute permission on (3.3).
If you add new commands to a directory in the
.I path ,
you should issue
the command
.I rehash
(2.2).
.IP pathname
A list of names, separated by `/' characters, forms a
.I pathname.
Each
.I component,
between successive `/' characters, names a directory
in which the next
.I component
file resides.
.I Pathnames
which begin with the character `/' are interpreted relative
to the
.I root
directory in the file system.
Other
.I pathnames
are interpreted relative to the current directory
as reported by
.I pwd.
The last component of a
.I pathname
may name a directory, but
usually names a file.
.IP pipeline
A group of commands which are connected together, the
.I "standard output"
of each connected to the
.I "standard input"
of the next,
is called a
.I pipeline.
The
.I pipe
mechanism used to connect these commands is indicated by
the shell metacharacter `|' (1.5, 2.3).
.IP popd
The
.I popd
command changes the shell's
.I "working directory"
to the directory you most recently left using the
.I pushd
command.  It returns to the directory without having to type its name,
forgetting the name of the current
.I "working directory"
before doing so (2.7).
.IP port
The part of a computer system to which each terminal is
connected is called a
.I port .
Usually the system has a fixed number of
.I ports ,
some of which are connected to telephone lines
for dial-up access, and some of which are permanently
wired directly to specific terminals.
.IP pr
The
.I pr
command is used to prepare listings of the contents of files
with headers giving the name of the file and the date and
time at which the file was last modified (2.3).
.IP printenv
The
.I printenv
command is used
to print the current setting of variables in the environment
(2.8).
.IP process
An instance of a running program is called a
.I process
(2.6).
\s-2UNIX\s0 assigns each
.I process
a unique number when it is
started \- called the
.I "process number" .
.I "Process numbers"
can be used to stop individual
.I processes
using the
.I kill
or
.I stop
commands when the
.I processes
are part of a detached
.I background
job.
.IP program
Usually synonymous with
.I command ;
a binary file or shell command script
which performs a useful function is often
called a
.I program .
.IP prompt
Many programs will print a
.I prompt
on the terminal when they expect input.
Thus the editor
`ex (1)' will print a `:' when it expects input.
The shell
.I prompts
for input with `% ' and occasionally with `? ' when
reading commands from the terminal (1.1).
The shell has a variable
.I prompt
which may be set to a different value to change the shell's main
.I prompt .
This is mostly used when debugging the shell (2.8).
.IP pushd
The
.I pushd
command, which means `push directory', changes the shell's
.I "working directory"
and also remembers the current
.I "working directory"
before the change is made, allowing you to return to the same
directory via the
.I popd
command later without retyping its name (2.7).
.IP ps
The
.I ps
command is used to show the processes you are currently running.
Each process is shown with its unique process number,
an indication of the terminal name it is attached to,
an indication of the state of the process (whether it is running,
stopped, awaiting some event (sleeping), and whether it is swapped out),
and the amount of \s-2CPU\s0 time it has used so far.
The command is identified by printing some of the words used
when it was invoked (2.6).
Shells, such as the
.I csh
you use to run the
.I ps
command, are not normally shown in the output.
.IP pwd
The
.I pwd
command prints the full
.I pathname
of the current
.I "working directory" \&.
The
.I dirs
builtin command is usually a better and faster choice.
.IP quit
The
.I quit
signal, generated by a control-\e,
is used to terminate programs which are behaving unreasonably.
It normally produces a core image file (1.8).
.IP quotation
The process by which metacharacters are prevented their special
meaning, usually by using the character `\' in pairs, or by
using the character `\e', is referred to as
.I quotation
(1.7).
.IP redirection
The routing of input or output from or to a file is known
as
.I redirection
of input or output (1.3).
.IP rehash
The
.I rehash
command tells the shell to rebuild its internal table of which commands
are found in which directories in your
.I path .
This is necessary when a new program is installed in one of these
directories (2.8).
.IP "relative pathname"
.br
A
.I pathname
which does not begin with a `/' is called a
.I "relative pathname"
since it is interpreted
.I relative
to the current
.I "working directory" .
The first
.I component
of such a
.I pathname
refers to some file or directory in the
.I "working directory" ,
and subsequent
.I components
between `/' characters refer to directories below the
.I "working directory" .
.I Pathnames
that are not
.I relative
are called
.I "absolute pathnames"
(1.6).
.IP repeat
The
.I repeat
command iterates another command a specified number of times.
.IP root
The directory
that is at the top of the entire directory structure is called the
.I root
directory since it is the `root' of the entire tree structure of
directories.  The name used in
.I pathnames
to indicate the
.I root
is `/'.
.I Pathnames
starting with `/' are said to be
.I absolute
since they start at the
.I root
directory.
.I Root
is also used as the part of a
.I pathname
that is left after removing
the
.I extension .
See
.I filename
for a further explanation (1.6).
.IP \s-2RUBOUT\s0
The \s-2RUBOUT\s0 or \s-2DELETE\s0
key is often used to erase the previously typed character; some users
prefer the \s-2BACKSPACE\s0 for this purpose.  On older versions of \s-2UNIX\s0
this key served as the \s-2INTR\s0 character.
.IP "scratch file"
Files whose names begin with a `#' are referred to as
.I "scratch files" ,
since they are automatically removed by the system after a couple of
days of non-use, or more frequently if disk space becomes tight (1.3).
.IP script
Sequences of shell commands placed in a file are called shell command
.I scripts .
It is often possible to perform simple tasks using these
.I scripts
without writing a program in a language such as C, by
using the shell to selectively run other programs (3.3, 3.10).
.IP set
The builtin
.I set
command is used to assign new values to shell variables
and to show the values of the current variables.
Many shell variables have special meaning to the shell itself.
Thus by using the
.I set
command the behavior of the shell can be affected (2.1).
.IP setenv
Variables in the environment `environ (5)'
can be changed by using the
.I setenv
builtin command (2.8).
The
.I printenv
command can be used to print the value of the variables in the environment.
.IP shell
A
.I shell
is a command language interpreter.
It is possible to write and run your own
.I shell ,
as
.I shells
are no different than any other programs as far as the
system is concerned.
This manual deals with the details of one particular
.I shell ,
called
.I csh.
.IP "shell script"
See
.I script
(3.3, 3.10).
.IP signal
A
.I signal
in \s-2UNIX\s0 is a short message that is sent to a running program
which causes something to happen to that process.
.I Signals
are sent either by typing special
.I control
characters on the keyboard or by using the
.I kill
or
.I stop
commands (1.8, 2.6).
.IP sort
The
.I sort
program sorts a sequence of lines in ways that can be controlled
by argument
.I flags
(1.5).
.IP source
The
.I source
command causes the shell to read commands from a specified file.
It is most useful for reading files such as
.I \&.cshrc
after changing them (2.8).
.IP "special character"
.br
See
.I metacharacters
and the
appendix to this manual.
.IP standard
We refer often to the
.I "standard input"
and
.I "standard output"
of commands.
See
.I input
and
.I output
(1.3, 3.8).
.IP status
A command normally returns a
.I status
when it finishes.
By convention a
.I status
of zero indicates that the command succeeded.
Commands may return non-zero
.I status
to indicate that some abnormal event has occurred.
The shell variable
.I status
is set to the
.I status
returned by the last command.
It is most useful in shell commmand scripts (3.6).
.IP stop
The
.I stop
command causes a
.I background
job to become
.I suspended
(2.6).
.IP string
A sequential group of characters taken together is called a
.I string \&.
.I Strings
can contain any printable characters (2.2).
.IP stty
The
.I stty
program changes certain parameters inside \s-2UNIX\s0 which determine
how your terminal is handled.  See `stty (1)' for a complete description (2.6).
.IP substitution
The shell implements a number of
.I substitutions
where sequences indicated by metacharacters are replaced by other sequences.
Notable examples of this are history
.I substitution
keyed by the
metacharacter `!' and variable
.I substitution
indicated by `$'.
We also refer to
.I substitutions
as
.I expansions
(3.4).
.IP suspended
A job becomes
.I suspended
after a \s-2STOP\s0 signal is sent to it, either by typing a
.I control -z
at the terminal (for
.I foreground
jobs) or by using the
.I stop
command (for
.I background
jobs).  When
.I suspended ,
a job temporarily stops running until it is restarted by either the
.I fg
or
.I bg
command (2.6).
.IP switch
The
.I switch
command of the shell allows the shell
to select one of a number of sequences of commands based on an
argument string.
It is similar to the
.I switch
statement in the language C (3.7).
.IP termination
When a command which is being executed finishes we say it undergoes
.I termination
or
.I terminates.
Commands normally terminate when they read an
.I end\f1-\fPof\f1-\fPfile
from their
.I "standard input" .
It is also possible to terminate commands by sending them
an
.I interrupt
or
.I quit
signal (1.8).
The
.I kill
program terminates specified jobs (2.6).
.IP then
The
.I then
command is part of the shell's
`if-then-else-endif' control construct used in command scripts (3.6).
.IP time
The
.I time
command can be used to measure the amount of \s-2CPU\s0
and real time consumed by a specified command as well
as the amount of disk i/o, memory utilized, and number
of page faults and swaps taken by the command (2.1, 2.8).
.IP tset
The
.I tset
program is used to set standard erase and kill characters
and to tell the system what kind of terminal you are using.
It is often invoked in a
.I \&.login
file (2.1).
.IP tty
The word
.I tty
is a historical abbreviation for `teletype' which is frequently used
in \s-2UNIX\s0 to indicate the
.I port
to which a given terminal is connected.  The
.I tty
command will print the name of the
.I tty
or
.I port
to which your terminal is presently connected.
.IP unalias
The
.I unalias
command removes aliases (2.8).
.IP \s-2UNIX\s0
\s-2UNIX\s0 is an operating system on which
.I csh
runs.
\s-2UNIX\s0 provides facilities which allow
.I csh
to invoke other programs such as editors and text formatters which
you may wish to use.
.IP unset
The
.I unset
command removes the definitions of shell variables (2.2, 2.8).
.IP "variable expansion"
.br
See
.I variables
and
.I expansion
(2.2, 3.4).
.IP variables
.I Variables
in
.I csh
hold one or more strings as value.
The most common use of
.I variables
is in controlling the behavior
of the shell.
See
.I path ,
.I noclobber ,
and
.I ignoreeof
for examples.
.I Variables
such as
.I argv
are also used in writing shell programs (shell command scripts)
(2.2).
.IP verbose
The
.I verbose
shell variable can be set to cause commands to be echoed
after they are history expanded.
This is often useful in debugging shell scripts.
The
.I verbose
variable is set by the shell's
.I \-v
command line option (3.10).
.IP wc
The
.I wc
program calculates the number of characters, words, and lines in the
files whose names are given as arguments (2.6).
.IP while
The
.I while
builtin control construct is used in shell command scripts (3.7).
.IP word
A sequence of characters which forms an argument to a command is called
a
.I word .
Many characters which are neither letters, digits, `\-', `.' nor `/'
form
.I words
all by themselves even if they are not surrounded
by blanks.
Any sequence of characters may be made into a
.I word
by surrounding it
with `\'' characters
except for the characters `\'' and `!' which require special treatment
(1.1).
This process of placing special characters in
.I words
without their special meaning is called
.I quoting .
.IP "working directory"
.br
At any given time you are in one particular directory, called
your
.I "working directory" .
This directory's name is printed by the
.I pwd
command and the files listed by
.I ls
are the ones in this directory.
You can change
.I "working directories"
using
.I chdir .
.IP write
The
.I write
command is an obsolete way of communicating with other users who are logged in to
\s-2UNIX\s0 (you have to take turns typing).  If you are both using display
terminals, use \fItalk\fP(1), which is much more pleasant.
