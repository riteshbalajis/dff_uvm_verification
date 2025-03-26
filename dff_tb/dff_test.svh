class dff_test extends uvm_test;
  
  `uvm_component_utils(dff_test)
  
  dff_Environment env;
  dff_Sequence seq;
  
  function new(string name="test",uvm_component parent);
    super.new(name,parent);
    endfunction
  
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env=dff_Environment::type_id::create("env",this);
      seq=dff_Sequence::type_id::create("seq",this);
    endfunction
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("Test Class", "connect phase", UVM_MEDIUM)
  endfunction
  
  virtual function void end_of_elaboration();
    `uvm_info("test class","elob phase",UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("test class","run phase",UVM_MEDIUM)
	
    phase.raise_objection(this);
    seq.start(env.agent.sqr);
    phase.drop_objection(this);
    
  endtask

endclass