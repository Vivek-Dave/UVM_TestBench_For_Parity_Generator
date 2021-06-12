
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "parity_sequence_item.sv"        // transaction class
 `include "parity_sequence.sv"             // sequence class
 `include "parity_sequencer.sv"            // sequencer class
 `include "parity_driver.sv"               // driver class
 `include "parity_monitor.sv"              // monitor class
 `include "parity_agent.sv"                // agent class  
 `include "parity_coverage.sv"             // coverage class
 `include "parity_scoreboard.sv"           // parity scoreboard
 `include "parity_env.sv"                  // environment class

 `include "parity_test.sv"                 // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


