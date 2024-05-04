# Something about the Music Player

## Something about the SOF file
It is located here:  
[./rtl/sof_files/dds_and_nios.sof](./rtl/sof_files/dds_and_nios.sof)

## Something about the status
* 5 Bit LFSR Running at 1 Hz Clock Rate
* DDS wrapper created (in which DDS module is instantiated) which generates a 3 Hz Carrier Sine
* LFSR is used to modulate the DDS carrier sine to generate ASK (OOK) and BPSK signals
* Modulated signals, DDS outputs, and LFSR bits are connected with muxes controlled by the NIOS, which outputs to the BGA oscilloscopes for display
* FSK signal generated, with LFSR, LFSR clock, and DDS connected to the Qsys to generate using Nios and interrupts
* Appropriate clock-crossing logic is used when crossing clock domains
* Audio working!
*   QPSK modulation shown on VGA oscilloscope
*   2 Additional songs added and next/previous buttons are functional
*   Nios PIOs, buttons, and software added to change the colours of the graphs upon command

Complete with simulations and SignalTaps

## Annotated Simulation screenshots
[./docs](./docs)  


LFSR:
![./docs/lfsr/Simulation/01.png](./docs/lfsr/Simulation/01.png) 

Top DDS:
![./docs/dds_top/Simulation/waves.png](./docs/dds_top/Simulation/waves.png) 

Bottom DDS:
![./docs/dds_bottom/Simulation/waves.png](./docs/dds_bottom/Simulation/waves.png) 

Synchronizers:

Clk sync:
![./docs/synchronizers/Simulations/clk_sync.png](./docs/synchronizers/Simulations/clk_sync.png) 

Fast-to-slow:
![./docs/synchronizers/Simulations/fts.png](./docs/synchronizers/Simulations/fts.png) 

Slow-to-fast:
![./docs/synchronizers/Simulations/stf.png](./docs/synchronizers/Simulations/stf.png) 



## Annotated SignalTap screenshots
[./docs](./docs)  

LFSR:
![./docs/lfsr/SignalTap/01.png](./docs/lfsr/SignalTap/01.png) 

Top DDS:
![./docs/dds_top/SignalTap/01.png](./docs/dds_top/SignalTap/01.png) 
![./docs/dds_top/SignalTap/02.png](./docs/dds_top/SignalTap/02.png) 
![./docs/dds_top/SignalTap/03.png](./docs/dds_top/SignalTap/03.png) 
![./docs/dds_top/SignalTap/04.png](./docs/dds_top/SignalTap/04.png) 
![05.png](./docs/dds_top/SignalTap/05.png)


Bottom DDS:
![./docs/dds_bottom/SignalTap/01.png](./docs/dds_bottom/SignalTap/01.png) 
![./docs/dds_bottom/SignalTap/02.png](./docs/dds_bottom/SignalTap/02.png) 
![./docs/dds_bottom/SignalTap/03.png](./docs/dds_bottom/SignalTap/03.png) 
![./docs/dds_bottom/SignalTap/04.png](./docs/dds_bottom/SignalTap/04.png) 
![05.png](./docs/dds_bottom/SignalTap/05.png)


Synchronizers:


Clk sync:
![./docs/synchronizers/SignalTap/clk_sync.png](./docs/synchronizers/SignalTap/clk_sync.png) 

DDS Top Out Sync:
![./docs/synchronizers/SignalTap/dds_top_out_sync.png](./docs/synchronizers/SignalTap/dds_top_out_sync.png) 

DDS Top Sel Sync:
![./docs/synchronizers/SignalTap/dds_top_sel_sync.png](./docs/synchronizers/SignalTap/dds_top_sel_sync.png) 

DDS Bottom Out Sync:
![./docs/synchronizers/SignalTap/dds_bot_out_sync.png](./docs/synchronizers/SignalTap/dds_bot_out_sync.png) 

DDS Bottom Sel Sync:
![./docs/synchronizers/SignalTap/dds_bot_sel_sync.png](./docs/synchronizers/SignalTap/dds_bot_sel_sync.png) 



## Additional Information
None
