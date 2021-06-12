
class parity_driver extends uvm_driver #(parity_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(parity_driver)
  //----------------------------------------------------------------------------

  uvm_analysis_port #(parity_sequence_item) drv2sb;

  //----------------------------------------------------------------------------
  function new(string name="parity_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  //---------------------------------------------------------------------------- 

  //--------------------------  virtual interface handel -----------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------
  
  //-------------------------  get interface handel from top -------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface");
    end
    drv2sb=new("drv2sb",this);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------------------- run task --------------------------------------
  task run_phase(uvm_phase phase);
    parity_sequence_item txn=parity_sequence_item::type_id::create("txn");
    initilize(); // initilize dut at time 0
    forever begin
      seq_item_port.get_next_item(txn);
      drive_item(txn);
      drv2sb.write(txn);
      seq_item_port.item_done();    
    end
  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task initilize();
   // make changes here for input to dut 
   // vif.data = 0;
   // vif.addr = 0;
   // vif.read = 0;
    vif.data = 0;

  endtask
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  task drive_item(parity_sequence_item txn);
    // make changes here
    // @(posedge vif.clk);
    // vif.cb.data = txn.data;
    // vif.cb.addr = txn.addr;
    // vif.cb.read = txn.read;
    vif.data = txn.data;
  endtask
  //----------------------------------------------------------------------------
endclass:parity_driver

