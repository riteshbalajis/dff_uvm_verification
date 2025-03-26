class dff_Environment extends uvm_env;
  dff_Scoreboard sbd;
  dff_Agent agent;
  `uvm_component_utils(dff_Environment)
  function new(string name="dff_Environment",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
    sbd=dff_Scoreboard::type_id::create("sbd",this);
    agent=dff_Agent::type_id::create("agent",this);
    endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    `uvm_info("Environment","connect phase",UVM_MEDIUM);
    
    agent.monitor.item_collected_port.connect(sbd.item_collected_export);
  endfunction
  
  
  
endclass