
class parity_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(parity_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="parity_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  parity_sequence_item  txn;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(parity_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
    txn=parity_sequence_item::type_id::create("txn");
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    forever
    begin 
      sample_dut(txn);
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task sample_dut(output parity_sequence_item txn);
    parity_sequence_item t = parity_sequence_item::type_id::create("t");
    @(vif.data);
    t.data        = vif.data;
    t.odd_parity  = vif.odd_parity;
    t.even_parity = vif.even_parity;
    txn = t;
  endtask
  //----------------------------------------------------------------------------

endclass:parity_monitor

