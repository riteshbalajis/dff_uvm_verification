class dff_Driver extends uvm_driver #(dff_Sequence_item);  
  `uvm_component_utils(dff_Driver)
  
  virtual dff_Interface intf;
  dff_Sequence_item sqt;
  
  
  function new(string name="dff_Driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if (!uvm_config_db#(virtual dff_Interface)::get(this, "", "vif", intf)) 
      `uvm_fatal("Interface not found in Driver", "Failed in config_db");
  endfunction
  

  task run_phase(uvm_phase phase); 
    forever begin
      
      seq_item_port.get_next_item(sqt);
      drive(sqt);
      seq_item_port.item_done();
    end
  endtask
    
 
  task drive(dff_Sequence_item sqt);
    @(posedge intf.clk ) begin
      intf.din  = sqt.din;
      
    end
    
  endtask
  
endclass
