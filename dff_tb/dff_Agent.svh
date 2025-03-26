class dff_Agent extends uvm_agent;
  
  `uvm_component_utils(dff_Agent)
  dff_Monitor monitor;
  dff_Driver driver;
  dff_Sequencer sqr;
  
  function new(string name="dff_Agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
    monitor=dff_Monitor::type_id::create("monitor",this);
    driver=dff_Driver::type_id::create("driver",this);
    sqr=dff_Sequencer::type_id::create("sqr",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sqr.seq_item_export);
    
  endfunction
    
endclass