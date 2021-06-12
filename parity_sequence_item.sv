class parity_sequence_item extends uvm_sequence_item;

  //------------ i/p || o/p field declaration-----------------

  rand logic [7:0] data;  //i/p

  logic  odd_parity;      //o/p
  logic even_parity;
  
  //---------------- register parity_sequence_item class with factory --------
  `uvm_object_utils_begin(parity_sequence_item) 
     `uvm_field_int( data        ,UVM_ALL_ON)
     `uvm_field_int( odd_parity  ,UVM_ALL_ON)
     `uvm_field_int( even_parity ,UVM_ALL_ON)
  `uvm_object_utils_end
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="parity_sequence_item");
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // write DUT inputs here for printing
  function string input2string();
    return($sformatf("data=%8b ", data));
  endfunction
  
  // write DUT outputs here for printing
  function string output2string();
    return($sformatf("odd_parity=%0b even_parity=%0b", odd_parity,even_parity));
  endfunction
    
  function string convert2string();
    return($sformatf({input2string(), " || ", output2string()}));
  endfunction
  //----------------------------------------------------------------------------

endclass:parity_sequence_item
