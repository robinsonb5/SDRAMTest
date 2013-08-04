SDRAMTest
=========

A ZPU-based test rig for the SDRAM on FPGA dev boards
Copyright 2013 by Alastair M. Robinson
Licensed under the GNU General Public License version 2 or later.

This project serves two purposes: it demonstrates how to use the ZPUFlex core
as a small microcontroller within an FPGA-based project, and also provides a
simple SDRAM controller and a means for verifying its compatibility with a
given FPGA development board.

All that's required to use this project is an FPGA with at least 32kbits of
block RAM, about 1,600 logic elements and a 16-bit wide SDR SDRAM chip of not
more than 512 megabits in size.  (Larger sizes could be accommodated but
would require changing the firmware linkscript and CPU parameters.)
Also required is either an RS232 port, or a single spare GPIO header and
a USB-to-TTL-RS232 adapter, and terminal software on a PC to read the ZPU
program's output.


Theory of Operation
===================

The firmware runs entirely from Block RAM, leaving the SDRAM clear for
testing.  The tests performed are as follows:
*	First stage sanity check:
	Writes 0x00000000, 0x55555555, 0xaaaaaaaa and 0xffffffff in turn to location 0

