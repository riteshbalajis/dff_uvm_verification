class dff_Scoreboard extends uvm_scoreboard;
  `uvm_component_utils(dff_Scoreboard)
  logic [7:0] expected_output;
  logic [7:0] actual_output;
  
  uvm_analysis_imp #(dff_Sequence_item,dff_Scoreboard) item_collected_export;

 
  dff_Sequence_item sqt_q[$];

 
  function new(string name="dff_Scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction

  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  virtual function void write(dff_Sequence_item sqt);
    
    sqt_q.push_back(sqt);
    expected_output=sqt_q[0].din;
    actual_output=sqt_q[0].dout;
 
    if (sqt.rst) begin
      if (actual_output != 0) begin
        `uvm_error("SCOREBOARD", "Test Failed: Reset is active, but dout is not zero!")
      end 
      else begin
        `uvm_info("SCOREBOARD", "Reset is active. Output correctly set to zero.",UVM_MEDIUM);
      end
    end
    if(!sqt_q[0].rst)begin
      if(expected_output==actual_output) begin
        `uvm_info("SCOREBOARD","Test Passed ...",UVM_MEDIUM);
      end
      else begin
        `uvm_error("SCOREBOARD","Test Failed (Din doesnt Match with Dout)...");
      end
    end
    
  endfunction
  
endclass
