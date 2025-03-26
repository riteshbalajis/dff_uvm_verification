class dff_Sequencer extends uvm_sequencer #(dff_Sequence_item);
  `uvm_component_utils(dff_Sequencer)
  
  function new(string name="dff_Sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass