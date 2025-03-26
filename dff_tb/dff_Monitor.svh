class dff_Monitor extends uvm_monitor;
  `uvm_component_utils(dff_Monitor)
  
  uvm_analysis_port #(dff_Sequence_item) item_collected_port;
  virtual dff_Interface intf;
  dff_Sequence_item sqt;
  
  function new(string name="dff_Monitor",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port=new("item_collected_port",this);
    sqt=dff_Sequence_item::type_id::create("sqt");

    if(!uvm_config_db#(virtual dff_Interface)::get(this,"","vif",intf))
      `uvm_fatal("no interface in monitor","interface get failed in config_db");

  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever @(posedge intf.clk) begin;  
	  #0.1;
      sqt.rst=intf.rst;
      sqt.din=intf.din;
      sqt.dout=intf.dout;


      item_collected_port.write(sqt); 
    end
  endtask
  
  
endclass