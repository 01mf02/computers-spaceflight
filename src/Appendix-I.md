\[**377-392**\] **Appendix I: Glossary Of Computer Terms**

*Accumulator* ---The register in the central processing unit of a
computer used to store the current results of calculations.

*Algorithm* ---A step-by-step solution to a problem that is the basis
for writing the code that will enable the computer to solve it.

*Analog Circuit* ---An electrical circuit that models the behavior of a
real object or force, providing a nondigital means of calculation.

*Analog Computer* ---A machine that computes by modeling objects and
forces using either mechanical or electrical means.

*Assembly Language* ---A low-level programming language for computers
that express algorithtms in statements consisting of mnemonics
representing actions and numbers representing addresses. For example,
the statement "ADD A,7FFF" tells a computer to add the contents of
location 7FFF (a hexadecimal number) to the contents of the accumulator
and leave the result in the accumulator. The specific mnemonics for
assembly languages may be different for different processors but are
closely related. Programs written in assembly languages, although
conservative of machine resources and quite fast, are much more
difficult to write and maintain than those written in high-level
languages such as FORTRAN, Pascal, and HAL/S.

*Asynchronous* ---Occurrences happening at no set time. Asynchronous
interrupts mean that signals to a computer to start a specified process
may come at any time.

*Backup Program* ---A computer program shorter and with less
functionality than the primary program that performs only critical
functions in case the primary program or the hardware in which it
resides fails.

*Bandwidth* ---The amount of information that can be transferred in a
discrete amount of time. The higher the bandwidth, the more information.

*Batch Processing* ---A method of executing programs on a computer that
reserves resources for the use of a particular program and releases them
upon completion. Older batch systems could process only one program at a
time.

*Binary Object Code* ---The result of an assembler processing an
assembly language program or a compiler processing a high level language
program. It consists of binary numbers in the machine language of the
specific computer on which the program is to run.

*Bit* ---A binary digit, representing either a one or a zero.

*Breadboard* ---A prototype of a computer or other electronic device
built by the design group to test the device before it is packaged for
production.

*Bubble Memory* ---A type of nonvolatile computer memory using materials
that can retain a specific magnetic polarity when electrical power is
cut off. The polarity determines whether a one or zero is being stored.

*Buffer* ---A cache of memory used to store information temporarily
during transfer operations. It is usually used to adjust for differences
in operating speed between devices.

*Buffer Register* ---A register used to temporarily store information in
transit to another device.

*Bug* ---Common term for an error in a computer program or hardware.

*Bus* ---An interconnection device that can be used to speed up
information transfer (as when a bus made up of multiple wires carries
the bits of an entire computer word in parallel) and to act as a
connector for multiple devices (as when several devices that do not need
to transmit simultaneously time-share the use of the bus for
intercommunication). Also used to refer to heavy-duty electrical power
cables or bars supplying power to many devices.

*Byte* ---A collection of bits, commonly eight.

*Central* *Processor* ---The portion of a computer that contains the
control circuits and does the actual calculations.

*CMOS* ---Complimentary metal-oxide silicon circuits, characterized by
low-power requirements, tolerance of wide variation in voltages, and
susceptibility to damage from discharges of static electricity.

*CMOS* *Processor*---A microcomputer built of CMOS circuits.

*Coding*---The act of writing a program for a computer.

*Compiler*---A computer program that accepts statements of a high-level
language as input and generates machine code that will execute those
statements as output.

*Condition Code*---A message several bits in length used to communicate
the physical status of one device to another device.

*Contiguous Memory Locations*---Addresses in a machine memory located
adjacent to one another.

*Core Memory*---A type of computer memory constructed of a series of
two-dimensional planes containing networks of wires with ferrite rings
called "cores" at their intersections. The magnetic polarity of the
cores can be changed by electrical pulses. Each core stores 1 bit of
information. Core memory is nonvolatile; when power is cut off, it does
not lose information. Destructive-readout core memory loses the
information stored in a core when the core is read, so a temporary
register must be used to intermediately store the information before
writing it back to its original location as it is simultaneously sent to
other parts of the computer. Nondestructive-readout core memory can be
read without the information being changed.

*Core Rope*---A type of core memory that stores entire computer words
rather than individual bits. Each core in a core rope is permanently
charged to represent a "one." A number of wires equal to the number of
bits in a word is weaved through the cores. When a bit within a word is
to represent a one, its wire is connected to a core. Bits representing
zeroes are not connected. Thus, by selecting the correct core and
sensing which wires represent ones and which zeroes, the word can be
reconstructed. More than one word can be attached to a core by adding
more wires to the rope. Core rope, once constructed, can only be read.

*Core Storage*---Another name for core memory.

*Core Transistor Logic*---Circuits made up of discrete transistors used
to form the control unit in the central processor of a computer.

*Cycle Time*---The length of time it takes for a computer to do a
fundamental operation, such as reading a word from memory into the
central processor. Some instructions, such as multiply, take several
cycles.

*Data Flow Diagram*---A software design tool that uses circles to
represent operations and arrows to represent data movement. It is used
to determine the ordering of processes and input and output
requirements.

*Data Formatters*---Hardware or software that takes raw data from
devices and puts it into a uniform format for transmission, usually
adding some special error detection bits.

*Data Word*---A computer word containing only data, not instructions.

*Demultiplexer*---A device that receives data transmitted on a bus and
routes it to the correct device.

*Digital Circuit*---A circuit constructed to handle discrete units of
information that can represent ones and zeroes.

*Digital Computer*---A calculating device using digital circuits,
usually consisting of a central processing unit, memory, and input and
output devices.

*Diode Transistor Logic Integrated Circuit*---A type of miniaturized
digital circuit used to construct logic units in the central processor
of a computer.

*Direct Addressing*---Using the absolute address of a memory location to
access data within it. For example, in a hypothetical machine with a
word size of 4 bits, up to 16 memory locations can be directly
addressed, simply by matching them one for one with the 16 numbers 4
bits can represent. Thus, memory location 1011 is the twelfth location
in the memory. Since it is often necessary to have more memory than the
number of locations a single word can represent, indirect addressing
schemes must be devised. The 4 bit computer can indirectly represent a
memory location by using two words; one word can indicate which bank of
l6 words to access, the second word can indicate which of the 16
addresses in that bank to read.

*Direct Memory Access*---Reading or writing to a memory location in a
computer without passing the information through the central processing
unit for disposition.

*Discrete Component*---A component containing a single entity, such as a
transistor, as opposed to containing many entities, such as an
integrated circuit with thousands of transistors.

*Disk* *Drive*---A type of mass storage device in which bits are
represented by magnetized areas on a plane, or disk, covered with a
suitable material of the same type used for magnetic tape. A disk drive
may have one or many disks.

*Double* *Precision*---Using two computer words to represent a number
instead of one.

*Drum Memory*---A type of mass storage device in which the material
(similar to material used to make magnetic tape) that contains the
information is placed on a rotating drum.

*Emulator*---A device that can be programmed to replicate the logic and
functions of another device and operate at the same speed.

*Erasable Memory*---Memory in which information can be overwritten by
new information.

*Event* *Word*---A word of information containing code to activate
devices or functions.

*File*---A collection of related information, such as a computer program
or imaging data, which can be thought of as a unit.

*Firmware*---Software stored in read-only memory devices used to control
logic flow in a computer. Changing the firmware changes the nature of
the computer.

*Fixed* *Memory*---Memory that can only be read.

*Fixed Point*---A method of representing numbers in a computer in which
the decimal point is permanently fixed. Therefore, numbers used in
calculations must be properly scaled relative to the location of their
decimal point or the results will be meaningless. Such scaling is
usually left to the programmer.

*Flat Packs*---Collections of integrated circuits packaged in modules
for use in a computer.

*Flip-Flop*---A logic device that can change from containing a one to a
zero and vice-versa depending on inputs. Hip-flops are often used in the
central processing unit of a computer.

*Floating Point*---A method of storing numbers in a computer in which
the location of the decimal point is stored with the values of the
individual places.

*Flowchart*---A method of program design in which algorithms are
represented by specific two-dimensional shapes and connecting arrows.
Each shape represents a specific logical act. For example, a diamond
indicates a true/false decision.

*Full* *Word*---All the bits of a computer's word size.

*Gate*---A logic device. For example, an "AND Gate" returns the result
of a Boolean AND operation on its inputs.

*General-Purpose Register*---A register in the central processing unit
of a computer not assigned to a specific task but that can be
dynamically required to act as an accumulator, program counter, or index
register.

*Half Word*---One half of the bits of a computer's word size.

*Hard-Wired Logic Circuits*---Logic implemented in hardware, as opposed
to implementation in software.

*Hard-Wiring*---Permanently representing logic in hardware.

*Hard Logic*---Logic permanently represented in hardware.

*Hardware*---Physical components of a computer system or other device,
such as memories, registers, and control logic circuits.

*Hexadecimal*---Base 16. One-digit numbers include 0 through 9 and A
through F.

*High-Level Language*---A language in which algorithms can be
represented in a series of structured, formal statements using selected
easily recognizable words from a natural language. For example, "IF
VALVE\_POSITION = 2 THEN SET FUEL\_FLAG TO TRUE" is a high-level
language statement.

*Image Processing*---Using computers to operate on the digital
information that represents images to enhance its value for specific
purposes. Most images are represented by collections of 8-bit "gray
scale" values, which contain a number ranging from 0 to 255 indicating
the level of darkness in one picture element, or dot, in an image. Image
processing works on these 8-bit values to increase contrast, translate
oblique images to vertical images, and emphasize certain colors.

*Imaging*---The process of acquiring images using vidicon tubes and
digital circuits.

*Index Register*---A register in the central processing unit of a
computer that contains the value of the memory bank currently being
accessed.

*Instruction Set*---The list of instructions that a computer can
execute. It varies from a few to several hundred depending on the
computer.

*Instruction Word*---A word in a computer containing the bits
representing an instruction and an address on which the instruction is
to operate.

*Integrated Circuit*---An electronic circuit containing hundreds,
thousands, or millions of components, such as transistors, and used for
a specific purpose, such as logic or memory.

*Interactive Processing*---Executing computer programs so that the user
can actively send information to the program and receive information
from it while the program is running.

*Interface*---The connection between two devices for the exchange of
data.

*Interface Table*---A collection of information containing instructions
for connecting devices so that data can be exchanged.

*Interpreter*---A computer program that executes statements written in a
high-level language one at a time.

*Interrupt Stack*---Storage of interrupts so that they can be handled in
a last-in first-out fashion.

*Interrupt-Driven System*---A computer that is programmed to execute
processes on demand, the demand taking the form of signals sent from
other devices or itself that cause processes of lower priority to halt
execution and be replaced by processes of higher priority. If the
interrupt is of a lower priority than the current process, it is saved
for later execution.

*Kilobyte*---One thousand twenty-four (1,024) 8-bit bytes. Abbreviated
"Kb" or, more commonly, "K."

*Listing*---The content of a computer program, often used to refer to
the printed result of sending a program through a compiler.

*Logic Channels*---Hardware that represents logic and through which data
flows for processing.

*Logic Circuit Board*---A board containing electrical connections into
which circuits are plugged representing the logic of a device.

*Logic Gate*---See Gate.

*Machine* *Code*---The representation of instructions as a series of
bits, which cause the computer to execute the specified actions. Machine
code is idiosyncratic to a particular type of computer.

*Machine Cycle*---See Cycle Time.

*Machine Time*---The amount of time a computer takes to execute a
program or function.

*Macro*---A subroutine in assembly language that can be invoked by name.

*Magnetic Tape*---A mass storage device in which bits are represented in
areas on a magnetic surface.

*Main Memory*---The memory of a computer used for both reading and
writing operations, and of a faster type than secondary storage devices,
such as magnetic tape or disk. Main memory is often made from core or
semiconductor devices.

*Mainframe Computer*---A large, fast computer system capable of
supporting hundreds of individual users, usually with a long word size,
millions of words of main memory, and many peripherals.

*Medium-Scale Integration*---Integration of several thousand transistors
or other devices on a single chip. Abbreviated "MSI."

*Megabyte*---One million 8-bit bytes. Abbreviated "Mb" or, more
commonly, "M."

*Microprocessor*---A small computer built of integrated circuits, often
on a single chip. Usually a microprocessor will support a single user or
function.

*Microcode*---The programs used to create firmware.

*Microsecond*---One millionth of a second.

*Millisecond*---One thousandth of a second.

*Minicomputer*---A computer sized between a microprocessor and a
mainframe computer, capable of supporting from one to several dozen
users or tasks.

*Mnemonics*---Short groups of letters representing instructions in an
assembly language. The mnemonic for "decrement the number in the
specified register by one and branch to another address if the number is
zero" is "DBZ."

*Modularization*---A technique for creating large computer programs
based on the principle of "divide and conquer." Each module of a large
program performs one task, can be entered at only one point and exited
at only one point. For example, the "BOOST THROTTLING TASK" module of
the Shuttle on-board software handles the throttling of the main engines
during the ascent phase of a mission. It is scheduled to execute many
times each second. By isolating the function to this one module, it can
be tested more easily and also reused in software loads for many Shuttle
flights.

*Multiplexer*---A device that controls the time-sharing of a bus so that
many devices can send information over the same interconnection.

*Multitasking*---A method of using computer resources so that more than
one program can be in the process of execution at one time. The
operating system of the computer will do calculations for one program
while another is using the printer, for instance.

*Nanosecond*---One billionth of a second.

*Networking*---The process of interconnecting several computers together
so that they can share data and programs.

*Noise*---Stray electromagnetic signals that may or may not interfere
with data transmission and calculations. Noise may be generated locally,
as when devices that leak electromagnetic radiation are placed next to
one another, or from radiation fields in space.

*NOR Gate*---A type of logic gate that executes a Boolean OR operation
on its inputs and then complements the result (reverses the value)
before outputting it.

*Object Code*---See Binary Object Code.

*Octal*---Representation of numbers in base eight. Octal digits range
from 0 through 7.

*One's Complement*---A method of storing binary numbers in which each
bit in a word is complemented (reversed in value). The one's complement
of 101 is 010.

*Operation Code*---That part of an instruction word that contains the
bits that represent the specific mnemonic to be executed.

*Parallel Data*---Data transmitted in several bits at once.

*Parameter*---Data made available as input or output to a module or
procedure. In general, the current value of specific information, such
as fuel remaining, angle of flight, or re-entry time.

*Parity*---A method of ensuring accurate data transfer. The number of
ones or zeroes in a specific computer word is kept either even or odd by
the addition of a changeable "parity bit." If the device is using even
parity based on the number of ones, or if the number of ones in the word
is odd, then the parity bit is set to one. When the transfer to another
device is complete, that device examines all incoming words for even
parity. If it detects odd parity, it requests a retransmission of the
data that failed the parity test.

*Parity Bit*---See Parity.

*Peripheral Device*---Hardware associated with a computer used for
input, output, or memory functions, such as disk drives, printers,
terminals, and card readers.

*Pixel*---Short for picture element. One dot of a digital image.

*Plated-Wire Memory*---A type of nonvolatile computer memory using areas
of wires plated with material that can be magnetically polarized to
store bits. Its function and advantages are similar to core memory.

*Primary Memory*---See Main Memory.

*Primary Storage*---See Main Memory.

*Procedural Language*---A computer language that can represent
algorithms, such as FORTRAN, Pascal, or Ada.

*Processor*---Alternative term for computer.

*Propagation Time*---The amount of time it takes for a signal to get
from one part of a device to another, or to another device.

*Pseudocode*---A program design tool using structured English to
represent algorithms. It has the advantage of being easily
understandable and independent of the syntax of a particular computer
language.

*Radiation-Hardened Chips*---Integrated circuits that have been
protected from the effects of radiation, either by shielding, decreasing
the density of components, or both.

*Random Access Memory*---A computer memory in which data can be written
to or read from any location directly.

*Read*---The process of moving information from a storage device to some
other place.

*Read Only Memory*---A type of computer memory that can only be read
from, not written to, such as core rope.

*Real-Time Processing*---A type of processing in which the computer
accepts or initiates continuous asynchronous inputs and outputs.

*Redundant Circuits*---Sections of hardware replicated to increase
reliability.

*Register*---A storage location containing a set of bits. Registers in
memory contain data words or instruction words, registers in the central
processing unit of a computer contain data, instructions, the bank of
memory currently being accessed, the location of the next program step,
and intermediate results of calculations.

*Secondary Memory*---Mass storage such as tapes or disks, usually slower
than main memory.

*Secondary Storage*---See Secondary Memory.

*Semiconductor*---Name for the electronic devices made of semiconducting
metals such as silicon. A transistor is a semiconductor.

*Sense lines*---The wires in a core or core rope memory that sense the
change in polarity during a read operation on the core and transmit the
value of the core to a register.

*Sequence*---A hardware device that commands other devices according to
a fixed time or event-initiated sequence.

*Serial Access*---Transmission of information one bit at a time.

*Serial Data*---See Serial Access.

*Sign Bit*---A bit of a computer word reserved for indicating the sign
of a number.

*Signed Two's Complement*---Storage of the value of a number in two's
complement form with an associated sign bit.

*Simulator*---A device or software that replicates the functions of
another device, though not necessarily at the same speed or in exactly
the same way.

*Single Precision*---Representing the value of numbers using one
computer word.

*Soft Logic*---The representation of logic in software.

*Software*---Part of a computer or other device that is the
representation of algorithms of functions and problem solutions and that
is easily changeable.

*Software Engineering*---The creation of software according to
engineering principles; emphasizing proper specification, design,
development, accuracy, and reliability.

*Solid-State Computer*---A computer built wholly out of solid-state
devices such as transistors and integrated circuits as opposed to vacuum
tubes.

*Spike*---A portion of the storage medium on a magnetic storage device
such as a tape or disk ruined by an excessive electrical discharge or
other event, preventing that area from being used for reading or
writing.

*State Vector*---The current position of a spacecraft in three
dimensions plus time.

*Status Variable*---A parameter indicating the current state of data
processed by a module, either reliable or corrupted. For example, if a
calculation within a module cannot be done because of insufficient or
damaged data, a status variable can be set to a specified value and sent
to the main program indicating that a failure has occurred and, often,
what type of failure.

*Stored Command Processor*---One of the virtual machines of the Galileo
spacecraft command and data computers that executes stored commands.

*Structured Macros*---A pseudo-high-level language made by naming
routines written in assembly language after statements in a typical
high-level language. These routines can then be invoked by name. Thus,
an IF-THEN statement can be represented by an assembly language macro
which accepts as its parameters the information to be tested and what to
do after the result of the operation is known.

*Subroutine*---A software module that is part of a larger program, often
repeated many times during the execution of the program.

*Subroutine Linkages*---Code that collects and connects subroutines
together for execution.

*Sumword*--The result of adding the current values of specified commands
together. Used to check against sumwords of other computers operating
redundantly on the same processes.

*Superminicomputer*---A minicomputer with the speed and accuracy
characteristics of a mainframe.

*Telemetry*---Signals sent from a spacecraft to the earth containing
data gathered or generated by experiments and flight hardware.

*Time-Sharing System*---A method of allocating computer resources so
that a number of processes can be executing simultaneously.

*Time-Slice Method*---A time-sharing or multiprocessing method in which
each currently executing process is given a discrete length of time to
use machine resources. At the end of that time, its execution is
temporarily suspended and the next process in line is activated for a
discrete length of time. Eventually, all current processes are serviced
and the original interrupted program can pick up where it left off,
beginning the cycle again.

*Transfer Register*---A register used for temporary storage of data,
such as data read from a core memory, before it is sent to the device
that requested it.

*Transistor-Transistor Logic*---A type of integrated circuit for
representing logic in hardware.

*Two's Complement*---A method of storing binary numbers that first
complements (reverses) each bit, and then adds one to the result. For
example, the two's complement of 101 is 011. This is useful for
"subtracting by adding." To subtract a two from a five, the five (101)
is added to the one's complement of two (110), with the carry past the
left-most bit discarded. The result is 011, or three.

*Uplink*---Sending signals from the ground to a spacecraft.

*Uplink Telemetry*---See Uplink.

*User Friendliness*---A term relating to the degree of ease in the use
of a computer system.

*Very Large-Scale Integration*---Combining millions of components on a
single chip. Also "VLSI."

*Virtual Machine*---A system of managing machine resources so that many
users have the impression that each has the full attention of the
computer when in actuality it is rapidly servicing the processing needs
of all of them. See Virtual Memory.

*Virtual Memory*---A system of memory management in which small segments
of a program or data are brought from secondary mass storage into main
memory on demand. For example, if a programmer is examining a very large
program on an interactive terminal, the code for one page of the program
is in real memory, with the rest on a disk drive. If the programmer
moves to a different portion of the code, the computer automatically
retrieves the correct segment of the code from secondary storage and
places it in main memory. In this way, many users can be serviced with a
main memory much smaller than secondary storage, each having the
impression that large amounts of main memory are available to them. The
speed of moving information from main memory to secondary storage is
such that it is not usually noticeable.

*Voter Circuit*---A circuit in a device that has multiple identical
logic paths, which compares the results of calculations and outputs the
value that the majority of the input circuits carried. In triple modular
redundant circuits, three logic paths are examined by voter circuits at
frequent intervals in the machine.

*Word*---A single unit of information in a computer, made up of a number
of bits. Small microprocessors often have 8-bit words; large mainframe
computers, up to 64-bit words.

*Write*---The act of placing data in a storage device.
