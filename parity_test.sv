
class parity_test extends uvm_test;

    //--------------------------------------------------------------------------
    `uvm_component_utils(parity_test)
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function new(string name="parity_test",uvm_component parent);
	    super.new(name,parent);
    endfunction
    //--------------------------------------------------------------------------

    parity_env env_h;
    int file_h;

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env_h = parity_env::type_id::create("env_h",this);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void end_of_elobartion_phase(uvm_phase phase);
      //factory.print();
      $display("End of eleboration phase in agent");
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    function void start_of_simulation_phase(uvm_phase phase);
      $display("start_of_simulation_phase");
      file_h=$fopen("LOG_FILE.log","w");
      set_report_default_file_hier(file_h);
      set_report_severity_action_hier(UVM_INFO,UVM_DISPLAY+UVM_LOG);
      set_report_verbosity_level_hier(UVM_MEDIUM);
    endfunction
    //--------------------------------------------------------------------------

    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        parity_sequence seq;
        odd_sequence odd_seq;
        even_sequence even_seq;
	      phase.raise_objection(this);
        
            seq= parity_sequence::type_id::create("seq");
            odd_seq= odd_sequence::type_id::create("odd_seq");
            even_seq= even_sequence::type_id::create("even_seq");

            seq.start(env_h.agent_h.sequencer_h);
            odd_seq.start(env_h.agent_h.sequencer_h);
            even_seq.start(env_h.agent_h.sequencer_h);

            #10;
	      phase.drop_objection(this);
    endtask
    //--------------------------------------------------------------------------

endclass:parity_test

