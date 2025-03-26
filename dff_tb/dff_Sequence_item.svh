class dff_Sequence_item extends uvm_sequence_item;
  `uvm_object_utils(dff_Sequence_item)
  
  rand logic [7:0] din;
  logic rst;
  logic [7:0] dout;
  logic clk;
  function new(string name="dff_Sequence_item"); 
  	super.new(name);
  endfunction
  

 
endclass