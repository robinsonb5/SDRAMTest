// Toplevel port definitions taken from the DE1 default example code 
module MIST_TopLevel (
  // clock inputs
  input wire [ 2-1:0] 	CLOCK_27, // 27 MHz
  // LED outputs
  output wire 		LED, // LED Yellow
  // UART
  output wire 		UART_TX, // UART Transmitter
  input wire 		UART_RX, // UART Receiver
  // VGA
  output wire 		VGA_HS, // VGA H_SYNC
  output wire 		VGA_VS, // VGA V_SYNC
  output wire [ 6-1:0] 	VGA_R, // VGA Red[5:0]
  output wire [ 6-1:0] 	VGA_G, // VGA Green[5:0]
  output wire [ 6-1:0] 	VGA_B, // VGA Blue[5:0]
  // SDRAM
  inout wire [ 16-1:0] 	SDRAM_DQ, // SDRAM Data bus 16 Bits
  output wire [ 13-1:0] SDRAM_A, // SDRAM Address bus 13 Bits
  output wire 		SDRAM_DQML, // SDRAM Low-byte Data Mask
  output wire 		SDRAM_DQMH, // SDRAM High-byte Data Mask
  output wire 		SDRAM_nWE, // SDRAM Write Enable
  output wire 		SDRAM_nCAS, // SDRAM Column Address Strobe
  output wire 		SDRAM_nRAS, // SDRAM Row Address Strobe
  output wire 		SDRAM_nCS, // SDRAM Chip Select
  output wire [ 2-1:0] 	SDRAM_BA, // SDRAM Bank Address
  output wire 		SDRAM_CLK, // SDRAM Clock
  output wire 		SDRAM_CKE, // SDRAM Clock Enable
  // MINIMIG specific
  output wire 		AUDIO_L, // sigma-delta DAC output left
  output wire 		AUDIO_R, // sigma-delta DAC output right
  // SPI
  inout wire 		SPI_DO,  // inout
  input wire 		SPI_DI,
  input wire 		SPI_SCK,
  input wire 		SPI_SS2,    // fpga
  input wire 		SPI_SS3,    // OSD
  input wire 		SPI_SS4,    // "sniff" mode
  input wire 		CONF_DATA0  // SPI_SS for user_io
);


// Clocks

wire sysclk;
wire pll_locked;

PLL mypll
(
	.inclk0(CLOCK_27[0]),
	.c0(SDRAM_CLK),
	.c1(sysclk),
	.locked(pll_locked)
);

defparam mySDRAMTest.sdram_rows = 13;
defparam mySDRAMTest.sdram_cols = 9;
defparam mySDRAMTest.sysclk_frequency = 1330;
defparam mySDRAMTest.run_from_ram = "false";

SDRAMTest mySDRAMTest
(	
	.clk(sysclk),
	.reset_in(pll_locked),
	
	// sdram
	.sdr_data(SDRAM_DQ),
	.sdr_addr(SDRAM_A),
	.sdr_dqm({SDRAM_DQMH,SDRAM_DQML}),
	.sdr_we(SDRAM_nWE),
	.sdr_cas(SDRAM_nCAS),
	.sdr_ras(SDRAM_nRAS),
	.sdr_cs(SDRAM_nCS),
	.sdr_ba(SDRAM_BA),
//	.sdr_clk(DRAM_CLK),
	.sdr_cke(SDRAM_CKE),
	
	// RS232
	.rxd(UART_RX),
	.txd(UART_TX)
);

endmodule
