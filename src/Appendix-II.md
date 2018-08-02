### Appendix II: HAL/S, A Real-Time Language for Spaceflight

\[**393-397**\]

HAL/S is a high-level programming language commissioned by NASA in the
late 1960s to meet the real-time programming needs of the Agency. At the
time, programs used on board spacecraft were either written in assembly
languages or in interpreted languages. The former make programs
difficult to write and maintain, and the latter are insufficiently
robust and slow. Also, future systems were expected to be much larger
and more complex, and cost would be moderated by the use of a high-level
language.

Since NASA directed the development of the language from the start, it
influenced the final form it took and specifically how it handled the
special needs of real-time processing. Statements common to other
high-level languages such as FORTRAN and PL/1 were put in HAL. These
included decision statements such as IF and looping statements such as
FOR, DO, and WHILE. NASA added to the list of statements several
specifically designed to create real-time processes, such as WAIT,
SCHEDULE, PRIORITY, and TERMINATE. The objective was to make HAL quickly
understandable to any programmer who had worked in other languages and
to give a variety of tools for developing the new real-time programs. To
make the language more readable by engineers, HAL lists source in such a
way as to retain traditional notation, with subscripts and superscripts
in their correct position, as contrasted with other languages, which
force such notation onto a single level (see Fig. II-I.)

In addition to new statements, HAL provided for new types of program
blocks. Two of these specific to real-time processing are COMPOOL and
TASK. "Compools" are declarations of data to be kept in a common data
area, thus making the data accessible to more than one process at a
time. It was expected that several processes would be active at once and
that many data items would need to he dynamically shared. Task blocks
are programs nested within larger programs that execute as real-time
processes dependent on one of the most powerful HAL statements,
SCHEDULE.

Scheduling the execution of specific tasks was simplified by the syntax
of HAL. Fig. II-2 shows the final page of the procedure STARTUP, written
for use on the Galileo spacecraft attitude control computers, containing
the master scheduling for the entire program. Note that the components
of the SCHEDULE statement are the task name, start time, priority, and
frequency. The statement "SCHEDULE ERROR0 ON RUPT0 PRIORITY(22);" tells
the operating system to execute the task ERROR0 when an interrupt named
RUPT0 occurs with a relative priority of 22. A different form of the
SCHEDULE statement is "SCHEDULE RGl PRIORITY(12), REPEAT EVERY 6.190,"
which initiates the task handling the highest frequency rate group and
repeats it 15 times per second. The statement TERMINATE cancels a
specified task upon a designated interrupt or time.

HAL did not have the widespread use NASA had hoped for when the language
was designed. Although the Shuttle on-board programs are exclusively in
HAL, the Galileo attitude control system is the only other flight
project to make significant use of the language. Other projects, though
instructed to use HAL, found reasons to avoid it, although the Deep
Space Network applied it to some ground software. In late 1985, NASA
announced that the language of choice for the upcoming Space Station
project would be Ada. Commissioned by the Department of Defense in the
late 1970s to serve as a standard for all contractor software
development, Ada includes real-time constructs pioneered by HAL such as
task blocks, scheduling, and common data. The announcement made NASA the
first nonmilitary agency to use Ada. Ada was adopted because commercial
compilers were available and because the DoD's insistence on its use
meant that it would be around for a long time. It appears that HAL will
be phased out, destined to join the hundreds of other dead computer
languages.

More information on the HAL/S language is contained in the following
sources:

- Intermetrics, Inc., HAL/S-360 Compiler System Specification, Version
IR-60-7, February 23,1981.

- Intermetrics, Inc, HAL/S Language Specification, Version IR-542,
September 1980.

- Intermetrics, Inc., HAL/S Programmer's Guide, Version IR-63-5,
December 1981.

- Ryer, Michael J., Programming in HAL/SIntermetrics, Inc., Cambridge,
MA, 1978.

![Figure II-1](images/p395.jpg)

![Figure II-I (Continued)](images/p396.jpg)

![Figure II-2](images/p397.jpg)