.\"	$NetBSD: 0.t,v 1.3 2003/08/07 10:30:53 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)0.t	8.1 (Berkeley) 6/8/93
.\"
.EQ
delim $$
.EN
.if n .ND
.TL
A Fast File System for UNIX*
.EH 'SMM:05-%''A Fast File System for \s-2UNIX\s+2'
.OH 'A Fast File System for \s-2UNIX\s+2''SMM:05-%'
.AU
Marshall Kirk McKusick, William N. Joy\(dg,
Samuel J. Leffler\(dd, Robert S. Fabry
.AI
Computer Systems Research Group
Computer Science Division
Department of Electrical Engineering and Computer Science
University of California, Berkeley
Berkeley, CA  94720
.AB
.FS
* UNIX is a trademark of Bell Laboratories.
.FE
.FS
\(dg William N. Joy is currently employed by:
Sun Microsystems, Inc, 2550 Garcia Avenue, Mountain View, CA 94043
.FE
.FS
\(dd Samuel J. Leffler is currently employed by:
Lucasfilm Ltd., PO Box 2009, San Rafael, CA 94912
.FE
.FS
This work was done under grants from
the National Science Foundation under grant MCS80-05144,
and the Defense Advance Research Projects Agency (DoD) under
ARPA Order No. 4031 monitored by Naval Electronic System Command under
Contract No. N00039-82-C-0235.
.FE
A reimplementation of the UNIX file system is described.
The reimplementation provides substantially higher throughput
rates by using more flexible allocation policies
that allow better locality of reference and can
be adapted to a wide range of peripheral and processor characteristics.
The new file system clusters data that is sequentially accessed
and provides two block sizes to allow fast access to large files
while not wasting large amounts of space for small files.
File access rates of up to ten times faster than the traditional
UNIX file system are experienced.
Long needed enhancements to the programmers'
interface are discussed.
These include a mechanism to place advisory locks on files, 
extensions of the name space across file systems,
the ability to use long file names,
and provisions for administrative control of resource usage.
.sp
.LP
Revised February 18, 1984
.AE
.LP
.sp 2
CR Categories and Subject Descriptors:
D.4.3
.B "[Operating Systems]":
File Systems Management \-
.I "file organization, directory structures, access methods";
D.4.2
.B "[Operating Systems]":
Storage Management \-
.I "allocation/deallocation strategies, secondary storage devices";
D.4.8
.B "[Operating Systems]":
Performance \-
.I "measurements, operational analysis";
H.3.2
.B "[Information Systems]":
Information Storage \-
.I "file organization"
.sp
Additional Keywords and Phrases:
UNIX,
file system organization,
file system performance,
file system design,
application program interface.
.sp
General Terms:
file system,
measurement,
performance.
.bp 
.ce
.B "TABLE OF CONTENTS"
.LP
.sp 1
.nf
.B "1.  Introduction"
.LP
.sp .5v
.nf
.B "2.  Old file system
.LP
.sp .5v
.nf
.B "3.  New file system organization
3.1.    Optimizing storage utilization
3.2.    File system parameterization
3.3.    Layout policies
.LP
.sp .5v
.nf
.B "4.  Performance
.LP
.sp .5v
.nf
.B "5.  File system functional enhancements
5.1.     Long file names
5.2.     File locking
5.3.     Symbolic links
5.4.     Rename
5.5.     Quotas
.LP
.sp .5v
.nf
.B Acknowledgements
.LP
.sp .5v
.nf
.B References
.\"	$NetBSD: 1.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)1.t	8.1 (Berkeley) 6/8/93
.\"
.ds RH Introduction
.NH
Introduction
.PP
This paper describes the changes from the original 512 byte UNIX file
system to the new one released with the 4.2 Berkeley Software Distribution.
It presents the motivations for the changes,
the methods used to effect these changes,
the rationale behind the design decisions,
and a description of the new implementation.
This discussion is followed by a summary of
the results that have been obtained,
directions for future work,
and the additions and changes
that have been made to the facilities that are
available to programmers.
.PP
The original UNIX system that runs on the PDP-11\(dg
.FS
\(dg DEC, PDP, VAX, MASSBUS, and UNIBUS are
trademarks of Digital Equipment Corporation.
.FE
has simple and elegant file system facilities.  File system input/output
is buffered by the kernel;
there are no alignment constraints on
data transfers and all operations are made to appear synchronous.
All transfers to the disk are in 512 byte blocks, which can be placed
arbitrarily within the data area of the file system.  Virtually
no constraints other than available disk space are placed on file growth
[Ritchie74], [Thompson78].*
.FS
* In practice, a file's size is constrained to be less than about
one gigabyte.
.FE
.PP
When used on the VAX-11 together with other UNIX enhancements,
the original 512 byte UNIX file
system is incapable of providing the data throughput rates
that many applications require.
For example, 
applications
such as VLSI design and image processing
do a small amount of processing
on a large quantities of data and
need to have a high throughput from the file system.
High throughput rates are also needed by programs
that map files from the file system into large virtual
address spaces.
Paging data in and out of the file system is likely
to occur frequently [Ferrin82b].
This requires a file system providing
higher bandwidth than the original 512 byte UNIX
one that provides only about
two percent of the maximum disk bandwidth or about
20 kilobytes per second per arm [White80], [Smith81b].
.PP
Modifications have been made to the UNIX file system to improve
its performance.
Since the UNIX file system interface
is well understood and not inherently slow,
this development retained the abstraction and simply changed
the underlying implementation to increase its throughput.
Consequently, users of the system have not been faced with
massive software conversion.
.PP
Problems with file system performance have been dealt with
extensively in the literature; see [Smith81a] for a survey.
Previous work to improve the UNIX file system performance has been
done by [Ferrin82a].
The UNIX operating system drew many of its ideas from Multics,
a large, high performance operating system [Feiertag71].
Other work includes Hydra [Almes78],
Spice [Thompson80],
and a file system for a LISP environment [Symbolics81].
A good introduction to the physical latencies of disks is
described in [Pechura83].
.ds RH Old file system
.sp 2
.ne 1i
.\"	$NetBSD: 2.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)2.t	8.1 (Berkeley) 6/8/93
.\"
.ds RH Old file system
.NH
Old File System
.PP
In the file system developed at Bell Laboratories
(the ``traditional'' file system),
each disk drive is divided into one or more
partitions.  Each of these disk partitions may contain
one file system.  A file system never spans multiple
partitions.\(dg
.FS
\(dg By ``partition'' here we refer to the subdivision of
physical space on a disk drive.  In the traditional file
system, as in the new file system, file systems are really
located in logical disk partitions that may overlap.  This
overlapping is made available, for example,
to allow programs to copy entire disk drives containing multiple
file systems.
.FE
A file system is described by its super-block,
which contains the basic parameters of the file system.
These include the number of data blocks in the file system,
a count of the maximum number of files,
and a pointer to the \fIfree list\fP, a linked
list of all the free blocks in the file system.
.PP
Within the file system are files.
Certain files are distinguished as directories and contain
pointers to files that may themselves be directories.
Every file has a descriptor associated with it called an
.I "inode".
An inode contains information describing ownership of the file,
time stamps marking last modification and access times for the file,
and an array of indices that point to the data blocks for the file.
For the purposes of this section, we assume that the first 8 blocks
of the file are directly referenced by values stored
in an inode itself*.
.FS
* The actual number may vary from system to system, but is usually in
the range 5-13.
.FE
An inode may also contain references to indirect blocks
containing further data block indices.
In a file system with a 512 byte block size, a singly indirect
block contains 128 further block addresses,
a doubly indirect block contains 128 addresses of further singly indirect
blocks,
and a triply indirect block contains 128 addresses of further doubly indirect
blocks.
.PP
A 150 megabyte traditional UNIX file system consists
of 4 megabytes of inodes followed by 146 megabytes of data.
This organization segregates the inode information from the data;
thus accessing a file normally incurs a long seek from the
file's inode to its data.
Files in a single directory are not typically allocated
consecutive slots in the 4 megabytes of inodes,
causing many non-consecutive blocks of inodes
to be accessed when executing
operations on the inodes of several files in a directory.
.PP
The allocation of data blocks to files is also suboptimum.
The traditional
file system never transfers more than 512 bytes per disk transaction
and often finds that the next sequential data block is not on the same
cylinder, forcing seeks between 512 byte transfers.
The combination of the small block size,
limited read-ahead in the system,
and many seeks severely limits file system throughput.
.PP
The first work at Berkeley on the UNIX file system attempted to improve both
reliability and throughput.
The reliability was improved by staging modifications
to critical file system information so that they could
either be completed or repaired cleanly by a program
after a crash [Kowalski78].
The file system performance was improved by a factor of more than two by
changing the basic block size from 512 to 1024 bytes.
The increase was because of two factors:
each disk transfer accessed twice as much data, 
and most files could be described without need to access
indirect blocks since the direct blocks contained twice as much data.
The file system with these changes will henceforth be referred to as the
.I "old file system."
.PP
This performance improvement gave a strong indication that
increasing the block size was a good method for improving
throughput.
Although the throughput had doubled, 
the old file system was still using only about
four percent of the disk bandwidth.
The main problem was that although the free list was initially
ordered for optimal access,
it quickly became scrambled as files were created and removed.
Eventually the free list became entirely random,
causing files to have their blocks allocated randomly over the disk.
This forced a seek before every block access.
Although old file systems provided transfer rates of up
to 175 kilobytes per second when they were first created,
this rate deteriorated to 30 kilobytes per second after a
few weeks of moderate use because of this
randomization of data block placement.
There was no way of restoring the performance of an old file system
except to dump, rebuild, and restore the file system.
Another possibility, as suggested by [Maruyama76],
would be to have a process that periodically
reorganized the data on the disk to restore locality.
.ds RH New file system
.sp 2
.ne 1i
.\"	$NetBSD: 3.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)3.t	8.1 (Berkeley) 6/8/93
.\"
.ds RH New file system
.NH
New file system organization
.PP
In the new file system organization (as in the
old file system organization),
each disk drive contains one or more file systems.
A file system is described by its super-block,
located at the beginning of the file system's disk partition.
Because the super-block contains critical data,
it is replicated to protect against catastrophic loss.
This is done when the file system is created;
since the super-block data does not change,
the copies need not be referenced unless a head crash
or other hard disk error causes the default super-block
to be unusable.
.PP
To insure that it is possible to create files as large as
$2 sup 32$ bytes with only two levels of indirection,
the minimum size of a file system block is 4096 bytes.
The size of file system blocks can be any power of two
greater than or equal to 4096.
The block size of a file system is recorded in the 
file system's super-block
so it is possible for file systems with different block sizes
to be simultaneously accessible on the same system.
The block size must be decided at the time that
the file system is created;
it cannot be subsequently changed without rebuilding the file system.
.PP
The new file system organization divides a disk partition
into one or more areas called
.I "cylinder groups".
A cylinder group is comprised of one or more consecutive
cylinders on a disk.
Associated with each cylinder group is some bookkeeping information
that includes a redundant copy of the super-block,
space for inodes,
a bit map describing available blocks in the cylinder group,
and summary information describing the usage of data blocks
within the cylinder group.
The bit map of available blocks in the cylinder group replaces
the traditional file system's free list.
For each cylinder group a static number of inodes
is allocated at file system creation time.
The default policy is to allocate one inode for each 2048
bytes of space in the cylinder group, expecting this
to be far more than will ever be needed. 
.PP
All the cylinder group bookkeeping information could be
placed at the beginning of each cylinder group.
However if this approach were used,
all the redundant information would be on the top platter.
A single hardware failure that destroyed the top platter
could cause the loss of all redundant copies of the super-block.
Thus the cylinder group bookkeeping information
begins at a varying offset from the beginning of the cylinder group.
The offset for each successive cylinder group is calculated to be
about one track further from the beginning of the cylinder group
than the preceding cylinder group.
In this way the redundant
information spirals down into the pack so that any single track, cylinder,
or platter can be lost without losing all copies of the super-block.
Except for the first cylinder group,
the space between the beginning of the cylinder group
and the beginning of the cylinder group information
is used for data blocks.\(dg
.FS
\(dg While it appears that the first cylinder group could be laid
out with its super-block at the ``known'' location,
this would not work for file systems
with blocks sizes of 16 kilobytes or greater.
This is because of a requirement that the first 8 kilobytes of the disk
be reserved for a bootstrap program and a separate requirement that
the cylinder group information begin on a file system block boundary.
To start the cylinder group on a file system block boundary,
file systems with block sizes larger than 8 kilobytes 
would have to leave an empty space between the end of
the boot block and the beginning of the cylinder group.
Without knowing the size of the file system blocks,
the system would not know what roundup function to use
to find the beginning of the first cylinder group.
.FE
.NH 2
Optimizing storage utilization
.PP
Data is laid out so that larger blocks can be transferred
in a single disk transaction, greatly increasing file system throughput.
As an example, consider a file in the new file system
composed of 4096 byte data blocks.
In the old file system this file would be composed of 1024 byte blocks.
By increasing the block size, disk accesses in the new file
system may transfer up to four times as much information per
disk transaction.
In large files, several
4096 byte blocks may be allocated from the same cylinder so that
even larger data transfers are possible before requiring a seek.
.PP
The main problem with 
larger blocks is that most UNIX
file systems are composed of many small files.
A uniformly large block size wastes space.
Table 1 shows the effect of file system
block size on the amount of wasted space in the file system.
The files measured to obtain these figures reside on
one of our time sharing
systems that has roughly 1.2 gigabytes of on-line storage.
The measurements are based on the active user file systems containing
about 920 megabytes of formatted space.
.KF
.DS B
.TS
box;
l|l|l
a|n|l.
Space used	% waste	Organization
_
775.2 Mb	0.0	Data only, no separation between files
807.8 Mb	4.2	Data only, each file starts on 512 byte boundary
828.7 Mb	6.9	Data + inodes, 512 byte block UNIX file system
866.5 Mb	11.8	Data + inodes, 1024 byte block UNIX file system
948.5 Mb	22.4	Data + inodes, 2048 byte block UNIX file system
1128.3 Mb	45.6	Data + inodes, 4096 byte block UNIX file system
.TE
Table 1 \- Amount of wasted space as a function of block size.
.DE
.KE
The space wasted is calculated to be the percentage of space
on the disk not containing user data.
As the block size on the disk
increases, the waste rises quickly, to an intolerable
45.6% waste with 4096 byte file system blocks.
.PP
To be able to use large blocks without undue waste,
small files must be stored in a more efficient way.
The new file system accomplishes this goal by allowing the division
of a single file system block into one or more
.I "fragments".
The file system fragment size is specified
at the time that the file system is created;
each file system block can optionally be broken into
2, 4, or 8 fragments, each of which is addressable.
The lower bound on the size of these fragments is constrained
by the disk sector size,
typically 512 bytes.
The block map associated with each cylinder group
records the space available in a cylinder group
at the fragment level;
to determine if a block is available, aligned fragments are examined.
Figure 1 shows a piece of a map from a 4096/1024 file system.
.KF
.DS B
.TS
box;
l|c c c c.
Bits in map	XXXX	XXOO	OOXX	OOOO
Fragment numbers	0-3	4-7	8-11	12-15
Block numbers	0	1	2	3
.TE
Figure 1 \- Example layout of blocks and fragments in a 4096/1024 file system.
.DE
.KE
Each bit in the map records the status of a fragment;
an ``X'' shows that the fragment is in use,
while a ``O'' shows that the fragment is available for allocation.
In this example,
fragments 0\-5, 10, and 11 are in use,
while fragments 6\-9, and 12\-15 are free.
Fragments of adjoining blocks cannot be used as a full block,
even if they are large enough.
In this example,
fragments 6\-9 cannot be allocated as a full block;
only fragments 12\-15 can be coalesced into a full block.
.PP
On a file system with a block size of 4096 bytes
and a fragment size of 1024 bytes,
a file is represented by zero or more 4096 byte blocks of data,
and possibly a single fragmented block.
If a file system block must be fragmented to obtain
space for a small amount of data,
the remaining fragments of the block are made
available for allocation to other files.
As an example consider an 11000 byte file stored on
a 4096/1024 byte file system.
This file would uses two full size blocks and one
three fragment portion of another block.
If no block with three aligned fragments is
available at the time the file is created,
a full size block is split yielding the necessary
fragments and a single unused fragment.
This remaining fragment can be allocated to another file as needed.
.PP
Space is allocated to a file when a program does a \fIwrite\fP
system call.
Each time data is written to a file, the system checks to see if
the size of the file has increased*.
.FS
* A program may be overwriting data in the middle of an existing file
in which case space would already have been allocated.
.FE
If the file needs to be expanded to hold the new data,
one of three conditions exists:
.IP 1)
There is enough space left in an already allocated
block or fragment to hold the new data.
The new data is written into the available space.
.IP 2)
The file contains no fragmented blocks (and the last
block in the file
contains insufficient space to hold the new data).
If space exists in a block already allocated,
the space is filled with new data.
If the remainder of the new data contains more than
a full block of data, a full block is allocated and
the first full block of new data is written there.
This process is repeated until less than a full block
of new data remains.
If the remaining new data to be written will
fit in less than a full block,
a block with the necessary fragments is located,
otherwise a full block is located.
The remaining new data is written into the located space.
.IP 3)
The file contains one or more fragments (and the 
fragments contain insufficient space to hold the new data).
If the size of the new data plus the size of the data
already in the fragments exceeds the size of a full block,
a new block is allocated.
The contents of the fragments are copied
to the beginning of the block
and the remainder of the block is filled with new data.
The process then continues as in (2) above.
Otherwise, if the new data to be written will
fit in less than a full block,
a block with the necessary fragments is located,
otherwise a full block is located.
The contents of the existing fragments
appended with the new data
are written into the allocated space.
.PP
The problem with expanding a file one fragment at a
a time is that data may be copied many times as a 
fragmented block expands to a full block.
Fragment reallocation can be minimized
if the user program writes a full block at a time,
except for a partial block at the end of the file.
Since file systems with different block sizes may reside on
the same system,
the file system interface has been extended to provide
application programs the optimal size for a read or write.
For files the optimal size is the block size of the file system
on which the file is being accessed.
For other objects, such as pipes and sockets,
the optimal size is the underlying buffer size.
This feature is used by the Standard
Input/Output Library,
a package used by most user programs.
This feature is also used by
certain system utilities such as archivers and loaders
that do their own input and output management
and need the highest possible file system bandwidth.
.PP
The amount of wasted space in the 4096/1024 byte new file system
organization is empirically observed to be about the same as in the
1024 byte old file system organization.
A file system with 4096 byte blocks and 512 byte fragments
has about the same amount of wasted space as the 512 byte
block UNIX file system.
The new file system uses less space
than the 512 byte or 1024 byte
file systems for indexing information for
large files and the same amount of space
for small files.
These savings are offset by the need to use
more space for keeping track of available free blocks.
The net result is about the same disk utilization
when a new file system's fragment size
equals an old file system's block size.
.PP
In order for the layout policies to be effective,
a file system cannot be kept completely full.
For each file system there is a parameter, termed
the free space reserve, that
gives the minimum acceptable percentage of file system
blocks that should be free.
If the number of free blocks drops below this level
only the system administrator can continue to allocate blocks.
The value of this parameter may be changed at any time,
even when the file system is mounted and active.
The transfer rates that appear in section 4 were measured on file
systems kept less than 90% full (a reserve of 10%).
If the number of free blocks falls to zero,
the file system throughput tends to be cut in half,
because of the inability of the file system to localize
blocks in a file.
If a file system's performance degrades because
of overfilling, it may be restored by removing
files until the amount of free space once again
reaches the minimum acceptable level.
Access rates for files created during periods of little
free space may be restored by moving their data once enough
space is available.
The free space reserve must be added to the
percentage of waste when comparing the organizations given
in Table 1.
Thus, the percentage of waste in
an old 1024 byte UNIX file system is roughly
comparable to a new 4096/512 byte file system
with the free space reserve set at 5%.
(Compare 11.8% wasted with the old file system
to 6.9% waste + 5% reserved space in the
new file system.)
.NH 2 
File system parameterization
.PP
Except for the initial creation of the free list,
the old file system ignores the parameters of the underlying hardware.
It has no information about either the physical characteristics
of the mass storage device,
or the hardware that interacts with it.
A goal of the new file system is to parameterize the 
processor capabilities and
mass storage characteristics
so that blocks can be allocated in an
optimum configuration-dependent way. 
Parameters used include the speed of the processor,
the hardware support for mass storage transfers,
and the characteristics of the mass storage devices.
Disk technology is constantly improving and
a given installation can have several different disk technologies
running on a single processor.
Each file system is parameterized so that it can be
adapted to the characteristics of the disk on which
it is placed.
.PP
For mass storage devices such as disks,
the new file system tries to allocate new blocks
on the same cylinder as the previous block in the same file. 
Optimally, these new blocks will also be 
rotationally well positioned.
The distance between ``rotationally optimal'' blocks varies greatly;
it can be a consecutive block
or a rotationally delayed block
depending on system characteristics.
On a processor with an input/output channel that does not require
any processor intervention between mass storage transfer requests,
two consecutive disk blocks can often be accessed
without suffering lost time because of an intervening disk revolution.
For processors without input/output channels,
the main processor must field an interrupt and
prepare for a new disk transfer.
The expected time to service this interrupt and
schedule a new disk transfer depends on the
speed of the main processor.
.PP
The physical characteristics of each disk include
the number of blocks per track and the rate at which
the disk spins.
The allocation routines use this information to calculate
the number of milliseconds required to skip over a block.
The characteristics of the processor include
the expected time to service an interrupt and schedule a
new disk transfer.
Given a block allocated to a file,
the allocation routines calculate the number of blocks to
skip over so that the next block in the file will
come into position under the disk head in the expected
amount of time that it takes to start a new
disk transfer operation.
For programs that sequentially access large amounts of data,
this strategy minimizes the amount of time spent waiting for
the disk to position itself.
.PP
To ease the calculation of finding rotationally optimal blocks,
the cylinder group summary information includes
a count of the available blocks in a cylinder
group at different rotational positions.
Eight rotational positions are distinguished,
so the resolution of the
summary information is 2 milliseconds for a typical 3600
revolution per minute drive.
The super-block contains a vector of lists called
.I "rotational layout tables".
The vector is indexed by rotational position.
Each component of the vector
lists the index into the block map for every data block contained
in its rotational position.
When looking for an allocatable block,
the system first looks through the summary counts for a rotational
position with a non-zero block count.
It then uses the index of the rotational position to find the appropriate
list to use to index through
only the relevant parts of the block map to find a free block.
.PP
The parameter that defines the
minimum number of milliseconds between the completion of a data
transfer and the initiation of
another data transfer on the same cylinder
can be changed at any time,
even when the file system is mounted and active.
If a file system is parameterized to lay out blocks with
a rotational separation of 2 milliseconds,
and the disk pack is then moved to a system that has a
processor requiring 4 milliseconds to schedule a disk operation,
the throughput will drop precipitously because of lost disk revolutions
on nearly every block.
If the eventual target machine is known, 
the file system can be parameterized for it
even though it is initially created on a different processor.
Even if the move is not known in advance,
the rotational layout delay can be reconfigured after the disk is moved
so that all further allocation is done based on the
characteristics of the new host.
.NH 2
Layout policies
.PP
The file system layout policies are divided into two distinct parts.
At the top level are global policies that use file system
wide summary information to make decisions regarding
the placement of new inodes and data blocks.
These routines are responsible for deciding the
placement of new directories and files.
They also calculate rotationally optimal block layouts,
and decide when to force a long seek to a new cylinder group
because there are insufficient blocks left
in the current cylinder group to do reasonable layouts.
Below the global policy routines are
the local allocation routines that use a locally optimal scheme to
lay out data blocks.
.PP
Two methods for improving file system performance are to increase
the locality of reference to minimize seek latency 
as described by [Trivedi80], and
to improve the layout of data to make larger transfers possible
as described by [Nevalainen77].
The global layout policies try to improve performance
by clustering related information.
They cannot attempt to localize all data references,
but must also try to spread unrelated data
among different cylinder groups.
If too much localization is attempted,
the local cylinder group may run out of space
forcing the data to be scattered to non-local cylinder groups.
Taken to an extreme,
total localization can result in a single huge cluster of data
resembling the old file system.
The global policies try to balance the two conflicting
goals of localizing data that is concurrently accessed
while spreading out unrelated data.
.PP
One allocatable resource is inodes.
Inodes are used to describe both files and directories.
Inodes of files in the same directory are frequently accessed together.
For example, the ``list directory'' command often accesses 
the inode for each file in a directory.
The layout policy tries to place all the inodes of
files in a directory in the same cylinder group.
To ensure that files are distributed throughout the disk,
a different policy is used for directory allocation.
A new directory is placed in a cylinder group that has a greater
than average number of free inodes,
and the smallest number of directories already in it.
The intent of this policy is to allow the inode clustering policy
to succeed most of the time.
The allocation of inodes within a cylinder group is done using a
next free strategy.
Although this allocates the inodes randomly within a cylinder group,
all the inodes for a particular cylinder group can be read with
8 to 16 disk transfers.
(At most 16 disk transfers are required because a cylinder
group may have no more than 2048 inodes.)
This puts a small and constant upper bound on the number of
disk transfers required to access the inodes
for all the files in a directory.
In contrast, the old file system typically requires
one disk transfer to fetch the inode for each file in a directory.
.PP
The other major resource is data blocks.
Since data blocks for a file are typically accessed together,
the policy routines try to place all data
blocks for a file in the same cylinder group,
preferably at rotationally optimal positions in the same cylinder.
The problem with allocating all the data blocks
in the same cylinder group is that large files will
quickly use up available space in the cylinder group,
forcing a spill over to other areas.
Further, using all the space in a cylinder group
causes future allocations for any file in the cylinder group
to also spill to other areas.
Ideally none of the cylinder groups should ever become completely full.
The heuristic solution chosen is to
redirect block allocation
to a different cylinder group
when a file exceeds 48 kilobytes,
and at every megabyte thereafter.*
.FS
* The first spill over point at 48 kilobytes is the point
at which a file on a 4096 byte block file system first
requires a single indirect block.  This appears to be
a natural first point at which to redirect block allocation.
The other spillover points are chosen with the intent of
forcing block allocation to be redirected when a
file has used about 25% of the data blocks in a cylinder group.
In observing the new file system in day to day use, the heuristics appear
to work well in minimizing the number of completely filled
cylinder groups.
.FE
The newly chosen cylinder group is selected from those cylinder
groups that have a greater than average number of free blocks left.
Although big files tend to be spread out over the disk,
a megabyte of data is typically accessible before
a long seek must be performed,
and the cost of one long seek per megabyte is small.
.PP
The global policy routines call local allocation routines with 
requests for specific blocks.
The local allocation routines will
always allocate the requested block 
if it is free, otherwise it
allocates a free block of the requested size that is
rotationally closest to the requested block.
If the global layout policies had complete information,
they could always request unused blocks and
the allocation routines would be reduced to simple bookkeeping.
However, maintaining complete information is costly;
thus the implementation of the global layout policy 
uses heuristics that employ only partial information.
.PP
If a requested block is not available, the local allocator uses
a four level allocation strategy:
.IP 1)
Use the next available block rotationally closest
to the requested block on the same cylinder.  It is assumed
here that head switching time is zero.  On disk 
controllers where this is not the case, it may be possible
to incorporate the time required to switch between disk platters
when constructing the rotational layout tables.  This, however,
has not yet been tried.
.IP 2)
If there are no blocks available on the same cylinder,
use a block within the same cylinder group.
.IP 3)
If that cylinder group is entirely full, 
quadratically hash the cylinder group number to choose
another cylinder group to look for a free block.
.IP 4)
Finally if the hash fails, apply an exhaustive search
to all cylinder groups.
.PP
Quadratic hash is used because of its speed in finding
unused slots in nearly full hash tables [Knuth75].
File systems that are parameterized to maintain at least
10% free space rarely use this strategy.
File systems that are run without maintaining any free
space typically have so few free blocks that almost any
allocation is random;
the most important characteristic of
the strategy used under such conditions is that the strategy be fast.
.ds RH Performance
.sp 2
.ne 1i
.\"	$NetBSD: 4.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)4.t	8.1 (Berkeley) 6/8/93
.\"
.ds RH Performance
.NH 
Performance
.PP
Ultimately, the proof of the effectiveness of the
algorithms described in the previous section
is the long term performance of the new file system.
.PP
Our empirical studies have shown that the inode layout policy has
been effective.
When running the ``list directory'' command on a large directory
that itself contains many directories (to force the system
to access inodes in multiple cylinder groups),
the number of disk accesses for inodes is cut by a factor of two.
The improvements are even more dramatic for large directories
containing only files,
disk accesses for inodes being cut by a factor of eight.
This is most encouraging for programs such as spooling daemons that
access many small files,
since these programs tend to flood the
disk request queue on the old file system.
.PP
Table 2 summarizes the measured throughput of the new file system.
Several comments need to be made about the conditions under which these
tests were run.
The test programs measure the rate at which user programs can transfer
data to or from a file without performing any processing on it.
These programs must read and write enough data to
insure that buffering in the
operating system does not affect the results.
They are also run at least three times in succession;
the first to get the system into a known state
and the second two to insure that the 
experiment has stabilized and is repeatable.
The tests used and their results are
discussed in detail in [Kridle83]\(dg.
.FS
\(dg A UNIX command that is similar to the reading test that we used is
``cp file /dev/null'', where ``file'' is eight megabytes long.
.FE
The systems were running multi-user but were otherwise quiescent.
There was no contention for either the CPU or the disk arm.
The only difference between the UNIBUS and MASSBUS tests
was the controller.
All tests used an AMPEX Capricorn 330 megabyte Winchester disk.
As Table 2 shows, all file system test runs were on a VAX 11/750.
All file systems had been in production use for at least
a month before being measured.
The same number of system calls were performed in all tests;
the basic system call overhead was a negligible portion of
the total running time of the tests.
.KF
.DS B
.TS
box;
c c|c s s
c c|c c c.
Type of	Processor and	Read
File System	Bus Measured	Speed	Bandwidth	% CPU
_
old 1024	750/UNIBUS	29 Kbytes/sec	29/983 3%	11%
new 4096/1024	750/UNIBUS	221 Kbytes/sec	221/983 22%	43%
new 8192/1024	750/UNIBUS	233 Kbytes/sec	233/983 24%	29%
new 4096/1024	750/MASSBUS	466 Kbytes/sec	466/983 47%	73%
new 8192/1024	750/MASSBUS	466 Kbytes/sec	466/983 47%	54%
.TE
.ce 1
Table 2a \- Reading rates of the old and new UNIX file systems.
.TS
box;
c c|c s s
c c|c c c.
Type of	Processor and	Write
File System	Bus Measured	Speed	Bandwidth	% CPU
_
old 1024	750/UNIBUS	48 Kbytes/sec	48/983 5%	29%
new 4096/1024	750/UNIBUS	142 Kbytes/sec	142/983 14%	43%
new 8192/1024	750/UNIBUS	215 Kbytes/sec	215/983 22%	46%
new 4096/1024	750/MASSBUS	323 Kbytes/sec	323/983 33%	94%
new 8192/1024	750/MASSBUS	466 Kbytes/sec	466/983 47%	95%
.TE
.ce 1
Table 2b \- Writing rates of the old and new UNIX file systems.
.DE
.KE
.PP
Unlike the old file system,
the transfer rates for the new file system do not
appear to change over time.
The throughput rate is tied much more strongly to the
amount of free space that is maintained.
The measurements in Table 2 were based on a file system
with a 10% free space reserve.
Synthetic work loads suggest that throughput deteriorates
to about half the rates given in Table 2 when the file
systems are full.
.PP
The percentage of bandwidth given in Table 2 is a measure
of the effective utilization of the disk by the file system.
An upper bound on the transfer rate from the disk is calculated 
by multiplying the number of bytes on a track by the number
of revolutions of the disk per second.
The bandwidth is calculated by comparing the data rates
the file system is able to achieve as a percentage of this rate.
Using this metric, the old file system is only
able to use about 3\-5% of the disk bandwidth,
while the new file system uses up to 47%
of the bandwidth.
.PP
Both reads and writes are faster in the new system than in the old system.
The biggest factor in this speedup is because of the larger
block size used by the new file system.
The overhead of allocating blocks in the new system is greater
than the overhead of allocating blocks in the old system,
however fewer blocks need to be allocated in the new system
because they are bigger.
The net effect is that the cost per byte allocated is about
the same for both systems.
.PP
In the new file system, the reading rate is always at least
as fast as the writing rate.
This is to be expected since the kernel must do more work when
allocating blocks than when simply reading them.
Note that the write rates are about the same 
as the read rates in the 8192 byte block file system;
the write rates are slower than the read rates in the 4096 byte block
file system.
The slower write rates occur because
the kernel has to do twice as many disk allocations per second,
making the processor unable to keep up with the disk transfer rate.
.PP
In contrast the old file system is about 50%
faster at writing files than reading them.
This is because the write system call is asynchronous and
the kernel can generate disk transfer
requests much faster than they can be serviced,
hence disk transfers queue up in the disk buffer cache.
Because the disk buffer cache is sorted by minimum seek distance,
the average seek between the scheduled disk writes is much
less than it would be if the data blocks were written out
in the random disk order in which they are generated.
However when the file is read,
the read system call is processed synchronously so
the disk blocks must be retrieved from the disk in the
non-optimal seek order in which they are requested.
This forces the disk scheduler to do long
seeks resulting in a lower throughput rate.
.PP
In the new system the blocks of a file are more optimally
ordered on the disk.
Even though reads are still synchronous, 
the requests are presented to the disk in a much better order.
Even though the writes are still asynchronous,
they are already presented to the disk in minimum seek
order so there is no gain to be had by reordering them.
Hence the disk seek latencies that limited the old file system
have little effect in the new file system.
The cost of allocation is the factor in the new system that 
causes writes to be slower than reads.
.PP
The performance of the new file system is currently
limited by memory to memory copy operations
required to move data from disk buffers in the
system's address space to data buffers in the user's
address space.  These copy operations account for
about 40% of the time spent performing an input/output operation.
If the buffers in both address spaces were properly aligned, 
this transfer could be performed without copying by
using the VAX virtual memory management hardware.
This would be especially desirable when transferring
large amounts of data.
We did not implement this because it would change the
user interface to the file system in two major ways:
user programs would be required to allocate buffers on page boundaries, 
and data would disappear from buffers after being written.
.PP
Greater disk throughput could be achieved by rewriting the disk drivers
to chain together kernel buffers.
This would allow contiguous disk blocks to be read
in a single disk transaction.
Many disks used with UNIX systems contain either
32 or 48 512 byte sectors per track.
Each track holds exactly two or three 8192 byte file system blocks,
or four or six 4096 byte file system blocks.
The inability to use contiguous disk blocks
effectively limits the performance
on these disks to less than 50% of the available bandwidth.
If the next block for a file cannot be laid out contiguously,
then the minimum spacing to the next allocatable
block on any platter is between a sixth and a half a revolution.
The implication of this is that the best possible layout without
contiguous blocks uses only half of the bandwidth of any given track.
If each track contains an odd number of sectors, 
then it is possible to resolve the rotational delay to any number of sectors
by finding a block that begins at the desired 
rotational position on another track.
The reason that block chaining has not been implemented is because it
would require rewriting all the disk drivers in the system,
and the current throughput rates are already limited by the
speed of the available processors.
.PP
Currently only one block is allocated to a file at a time.
A technique used by the DEMOS file system
when it finds that a file is growing rapidly,
is to preallocate several blocks at once,
releasing them when the file is closed if they remain unused.
By batching up allocations, the system can reduce the
overhead of allocating at each write,
and it can cut down on the number of disk writes needed to
keep the block pointers on the disk
synchronized with the block allocation [Powell79].
This technique was not included because block allocation 
currently accounts for less than 10% of the time spent in
a write system call and, once again, the
current throughput rates are already limited by the speed
of the available processors.
.ds RH Functional enhancements
.sp 2
.ne 1i
.\"	$NetBSD: 5.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)5.t	8.1 (Berkeley) 6/8/93
.\"
.ds RH Functional enhancements
.NH 
File system functional enhancements
.PP
The performance enhancements to the
UNIX file system did not require
any changes to the semantics or
data structures visible to application programs.
However, several changes had been generally desired for some 
time but had not been introduced because they would require users to 
dump and restore all their file systems.
Since the new file system already
required all existing file systems to
be dumped and restored, 
these functional enhancements were introduced at this time.
.NH 2
Long file names
.PP
File names can now be of nearly arbitrary length.
Only programs that read directories are affected by this change.
To promote portability to UNIX systems that
are not running the new file system, a set of directory
access routines have been introduced to provide a consistent
interface to directories on both old and new systems.
.PP
Directories are allocated in 512 byte units called chunks.
This size is chosen so that each allocation can be transferred
to disk in a single operation.
Chunks are broken up into variable length records termed
directory entries.  A directory entry
contains the information necessary to map the name of a
file to its associated inode.
No directory entry is allowed to span multiple chunks.
The first three fields of a directory entry are fixed length
and contain: an inode number, the size of the entry, and the length
of the file name contained in the entry.
The remainder of an entry is variable length and contains
a null terminated file name, padded to a 4 byte boundary.
The maximum length of a file name in a directory is
currently 255 characters.
.PP
Available space in a directory is recorded by having
one or more entries accumulate the free space in their
entry size fields.  This results in directory entries
that are larger than required to hold the
entry name plus fixed length fields.  Space allocated
to a directory should always be completely accounted for
by totaling up the sizes of its entries.
When an entry is deleted from a directory,
its space is returned to a previous entry
in the same directory chunk by increasing the size of the
previous entry by the size of the deleted entry.
If the first entry of a directory chunk is free, then 
the entry's inode number is set to zero to indicate
that it is unallocated.
.NH 2
File locking
.PP
The old file system had no provision for locking files.
Processes that needed to synchronize the updates of a
file had to use a separate ``lock'' file.
A process would try to create a ``lock'' file. 
If the creation succeeded, then the process
could proceed with its update;
if the creation failed, then the process would wait and try again.
This mechanism had three drawbacks.
Processes consumed CPU time by looping over attempts to create locks.
Locks left lying around because of system crashes had
to be manually removed (normally in a system startup command script).
Finally, processes running as system administrator
are always permitted to create files,
so were forced to use a different mechanism.
While it is possible to get around all these problems,
the solutions are not straight forward,
so a mechanism for locking files has been added.
.PP
The most general schemes allow multiple processes
to concurrently update a file.
Several of these techniques are discussed in [Peterson83].
A simpler technique is to serialize access to a file with locks.
To attain reasonable efficiency,
certain applications require the ability to lock pieces of a file.
Locking down to the byte level has been implemented in the
Onyx file system by [Bass81].
However, for the standard system applications,
a mechanism that locks at the granularity of a file is sufficient.
.PP
Locking schemes fall into two classes,
those using hard locks and those using advisory locks.
The primary difference between advisory locks and hard locks is the
extent of enforcement.
A hard lock is always enforced when a program tries to
access a file;
an advisory lock is only applied when it is requested by a program.
Thus advisory locks are only effective when all programs accessing
a file use the locking scheme.
With hard locks there must be some override
policy implemented in the kernel.
With advisory locks the policy is left to the user programs.
In the UNIX system, programs with system administrator
privilege are allowed override any protection scheme.
Because many of the programs that need to use locks must
also run as the system administrator,
we chose to implement advisory locks rather than 
create an additional protection scheme that was inconsistent
with the UNIX philosophy or could
not be used by system administration programs.
.PP
The file locking facilities allow cooperating programs to apply
advisory
.I shared
or
.I exclusive
locks on files.
Only one process may have an exclusive
lock on a file while multiple shared locks may be present.
Both shared and exclusive locks cannot be present on
a file at the same time.
If any lock is requested when
another process holds an exclusive lock,
or an exclusive lock is requested when another process holds any lock,
the lock request will block until the lock can be obtained.
Because shared and exclusive locks are advisory only,
even if a process has obtained a lock on a file,
another process may access the file.
.PP
Locks are applied or removed only on open files.
This means that locks can be manipulated without
needing to close and reopen a file.
This is useful, for example, when a process wishes
to apply a shared lock, read some information
and determine whether an update is required, then
apply an exclusive lock and update the file.
.PP
A request for a lock will cause a process to block if the lock
can not be immediately obtained.
In certain instances this is unsatisfactory.
For example, a process that
wants only to check if a lock is present would require a separate
mechanism to find out this information.
Consequently, a process may specify that its locking
request should return with an error if a lock can not be immediately
obtained.
Being able to conditionally request a lock
is useful to ``daemon'' processes
that wish to service a spooling area.
If the first instance of the
daemon locks the directory where spooling takes place,
later daemon processes can
easily check to see if an active daemon exists.
Since locks exist only while the locking processes exist,
lock files can never be left active after
the processes exit or if the system crashes.
.PP
Almost no deadlock detection is attempted.
The only deadlock detection done by the system is that the file
to which a lock is applied must not already have a
lock of the same type (i.e. the second of two successive calls
to apply a lock of the same type will fail).
.NH 2
Symbolic links
.PP
The traditional UNIX file system allows multiple
directory entries in the same file system
to reference a single file.  Each directory entry
``links'' a file's name to an inode and its contents.
The link concept is fundamental;
inodes do not reside in directories, but exist separately and
are referenced by links.
When all the links to an inode are removed,
the inode is deallocated.
This style of referencing an inode does
not allow references across physical file
systems, nor does it support inter-machine linkage. 
To avoid these limitations
.I "symbolic links"
similar to the scheme used by Multics [Feiertag71] have been added.
.PP
A symbolic link is implemented as a file that contains a pathname.
When the system encounters a symbolic link while
interpreting a component of a pathname,
the contents of the symbolic link is prepended to the rest
of the pathname, and this name is interpreted to yield the
resulting pathname.
In UNIX, pathnames are specified relative to the root
of the file system hierarchy, or relative to a process's
current working directory.  Pathnames specified relative
to the root are called absolute pathnames.  Pathnames
specified relative to the current working directory are
termed relative pathnames.
If a symbolic link contains an absolute pathname,
the absolute pathname is used,
otherwise the contents of the symbolic link is evaluated
relative to the location of the link in the file hierarchy.
.PP
Normally programs do not want to be aware that there is a
symbolic link in a pathname that they are using.
However certain system utilities
must be able to detect and manipulate symbolic links.
Three new system calls provide the ability to detect, read, and write
symbolic links; seven system utilities required changes
to use these calls.
.PP
In future Berkeley software distributions
it may be possible to reference file systems located on
remote machines using pathnames.  When this occurs,
it will be possible to create symbolic links that span machines.
.NH 2
Rename
.PP
Programs that create a new version of an existing
file typically create the
new version as a temporary file and then rename the temporary file
with the name of the target file.
In the old UNIX file system renaming required three calls to the system.
If a program were interrupted or the system crashed between these calls,
the target file could be left with only its temporary name.
To eliminate this possibility the \fIrename\fP system call
has been added.  The rename call does the rename operation
in a fashion that guarantees the existence of the target name.
.PP
Rename works both on data files and directories.
When renaming directories,
the system must do special validation checks to insure
that the directory tree structure is not corrupted by the creation
of loops or inaccessible directories.
Such corruption would occur if a parent directory were moved
into one of its descendants.
The validation check requires tracing the descendents of the target
directory to insure that it does not include the directory being moved.
.NH 2
Quotas
.PP
The UNIX system has traditionally attempted to share all available
resources to the greatest extent possible.
Thus any single user can allocate all the available space
in the file system.
In certain environments this is unacceptable.
Consequently, a quota mechanism has been added for restricting the
amount of file system resources that a user can obtain.
The quota mechanism sets limits on both the number of inodes
and the number of disk blocks that a user may allocate.
A separate quota can be set for each user on each file system.
Resources are given both a hard and a soft limit.
When a program exceeds a soft limit,
a warning is printed on the users terminal;
the offending program is not terminated
unless it exceeds its hard limit.
The idea is that users should stay below their soft limit between
login sessions,
but they may use more resources while they are actively working.
To encourage this behavior,
users are warned when logging in if they are over
any of their soft limits.
If users fails to correct the problem for too many login sessions,
they are eventually reprimanded by having their soft limit
enforced as their hard limit.
.ds RH Acknowledgements
.sp 2
.ne 1i
.\"	$NetBSD: 6.t,v 1.3 2003/08/07 10:30:54 agc Exp $
.\"
.\" Copyright (c) 1986, 1993
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
.\"	@(#)6.t	8.2 (Berkeley) 2/14/95
.\"
.nr H2 1
.ds RH Acknowledgements
.SH
\s+2Acknowledgements\s0
.PP
We thank Robert Elz for his ongoing interest in the new file system,
and for adding disk quotas in a rational and efficient manner.
We also acknowledge Dennis Ritchie for his suggestions
on the appropriate modifications to the user interface.
We appreciate Michael Powell's explanations on how
the DEMOS file system worked;
many of his ideas were used in this implementation.
Special commendation goes to Peter Kessler and Robert Henry for acting
like real users during the early debugging stage when file systems were
less stable than they should have been.
The criticisms and suggestions by the reviews contributed significantly
to the coherence of the paper.
Finally we thank our sponsors,
the National Science Foundation under grant MCS80-05144,
and the Defense Advance Research Projects Agency (DoD) under
ARPA Order No. 4031 monitored by Naval Electronic System Command under
Contract No. N00039-82-C-0235.
.ds RH References
.nr H2 1
.sp 2
.SH
\s+2References\s0
.LP
.IP [Almes78] 20
Almes, G., and Robertson, G.
"An Extensible File System for Hydra"
Proceedings of the Third International Conference on Software Engineering,
IEEE, May 1978.
.IP [Bass81] 20
Bass, J.
"Implementation Description for File Locking",
Onyx Systems Inc, 73 E. Trimble Rd, San Jose, CA 95131
Jan 1981.
.IP [Feiertag71] 20
Feiertag, R. J. and Organick, E. I., 
"The Multics Input-Output System",
Proceedings of the Third Symposium on Operating Systems Principles,
ACM, Oct 1971. pp 35-41
.IP [Ferrin82a] 20
Ferrin, T.E.,
"Performance and Robustness Improvements in Version 7 UNIX",
Computer Graphics Laboratory Technical Report 2,
School of Pharmacy, University of California,
San Francisco, January 1982.
Presented at the 1982 Winter Usenix Conference, Santa Monica, California.
.IP [Ferrin82b] 20
Ferrin, T.E.,
"Performance Issuses of VMUNIX Revisited",
;login: (The Usenix Association Newsletter), Vol 7, #5, November 1982. pp 3-6
.IP [Kridle83] 20
Kridle, R., and McKusick, M.,
"Performance Effects of Disk Subsystem Choices for
VAX Systems Running 4.2BSD UNIX",
Computer Systems Research Group, Dept of EECS, Berkeley, CA 94720,
Technical Report #8.
.IP [Kowalski78] 20
Kowalski, T.
"FSCK - The UNIX System Check Program",
Bell Laboratory, Murray Hill, NJ 07974. March 1978
.IP [Knuth75] 20
Knuth, D.
"The Art of Computer Programming",
Volume 3 - Sorting and Searching,
Addison-Wesley Publishing Company Inc, Reading, Mass, 1975. pp 506-549
.IP [Maruyama76]
Maruyama, K., and Smith, S.
"Optimal reorganization of Distributed Space Disk Files",
CACM, 19, 11. Nov 1976. pp 634-642
.IP [Nevalainen77] 20
Nevalainen, O., Vesterinen, M.
"Determining Blocking Factors for Sequential Files by Heuristic Methods",
The Computer Journal, 20, 3. Aug 1977. pp 245-247
.IP [Pechura83] 20
Pechura, M., and Schoeffler, J.
"Estimating File Access Time of Floppy Disks",
CACM, 26, 10. Oct 1983. pp 754-763
.IP [Peterson83] 20
Peterson, G.
"Concurrent Reading While Writing",
ACM Transactions on Programming Languages and Systems,
ACM, 5, 1. Jan 1983. pp 46-55
.IP [Powell79] 20
Powell, M.
"The DEMOS File System",
Proceedings of the Sixth Symposium on Operating Systems Principles,
ACM, Nov 1977. pp 33-42
.IP [Ritchie74] 20
Ritchie, D. M. and Thompson, K.,
"The UNIX Time-Sharing System",
CACM 17, 7. July 1974. pp 365-375
.IP [Smith81a] 20
Smith, A.
"Input/Output Optimization and Disk Architectures: A Survey",
Performance and Evaluation 1. Jan 1981. pp 104-117
.IP [Smith81b] 20
Smith, A.
"Bibliography on File and I/O System Optimization and Related Topics",
Operating Systems Review, 15, 4. Oct 1981. pp 39-54
.IP [Symbolics81] 20
"Symbolics File System",
Symbolics Inc, 9600 DeSoto Ave, Chatsworth, CA 91311
Aug 1981.
.IP [Thompson78] 20
Thompson, K.
"UNIX Implementation",
Bell System Technical Journal, 57, 6, part 2. pp 1931-1946
July-August 1978.
.IP [Thompson80] 20
Thompson, M.
"Spice File System",
Carnegie-Mellon University,
Department of Computer Science, Pittsburg, PA 15213
#CMU-CS-80, Sept 1980.
.IP [Trivedi80] 20
Trivedi, K.
"Optimal Selection of CPU Speed, Device Capabilities, and File Assignments",
Journal of the ACM, 27, 3. July 1980. pp 457-473
.IP [White80] 20
White, R. M.
"Disk Storage Technology",
Scientific American, 243(2), August 1980.
