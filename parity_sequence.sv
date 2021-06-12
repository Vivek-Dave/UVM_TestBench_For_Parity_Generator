
/***************************************************
** class name  : parity_sequence
** description : generate random input for DUT
***************************************************/
class parity_sequence extends uvm_sequence#(parity_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(parity_sequence)            
  //----------------------------------------------------------------------------

  parity_sequence_item txn;
  int unsigned LOOP = 50;

  //----------------------------------------------------------------------------
  function new(string name="parity_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(LOOP) begin
      txn=parity_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize();
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:parity_sequence

/***************************************************
** class name  : odd_sequence
** description : gnerate odd input for DUT
***************************************************/
class odd_sequence extends parity_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(odd_sequence)      
  //----------------------------------------------------------------------------
  
  parity_sequence_item txn;
  int unsigned LOOP = 20;
  int unsigned temp=1;
  
  //----------------------------------------------------------------------------
  function new(string name="odd_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(LOOP) begin
    txn=parity_sequence_item::type_id::create("txn");
    start_item(txn);
      txn.randomize()with{txn.data==temp;};
    #5;
    finish_item(txn);
    temp++;
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : even_sequence 
** description : generate even input for DUT
***************************************************/
class even_sequence extends parity_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(even_sequence)      
  //----------------------------------------------------------------------------
  
  parity_sequence_item txn;
  int unsigned LOOP = 20;
  int unsigned temp = 0;
  
  //----------------------------------------------------------------------------
  function new(string name="even_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(LOOP) begin
    txn=parity_sequence_item::type_id::create("txn");
    start_item(txn);
      txn.randomize()with{txn.data==temp;};
    #5;
    finish_item(txn);
    temp++;
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass