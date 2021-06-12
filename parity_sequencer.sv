class parity_sequencer extends uvm_sequencer#(parity_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(parity_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="parity_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:parity_sequencer

