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
block RAM, about 1,600 logic elements and an SDR SDRAM chip of not more than
512 megabits in size.  (Larger sizes could be accommodated but would require 
changing the firmware linkscript and CPU parameters.)
Also required is either an RS232 port, or a single spare GPIO header and
a USB-to-TTL-RS232 adapter, and terminal software on a PC to read the ZPU
program's output.


