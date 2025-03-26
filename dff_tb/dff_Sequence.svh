class dff_Sequence extends uvm_sequence #(dff_Sequence_item);
  `uvm_object_utils(dff_Sequence)
  
  dff_Sequence_item sqt;
  
  function new(string name="dff_Sequence");
    super.new(name);
  endfunction
  
  task body();
    
    repeat(20) begin
      sqt=dff_Sequence_item::type_id::create("sqt");
     
      start_item(sqt);
      sqt.randomize();
      finish_item(sqt);
      
    end
  endtask
 
  
  
    
endclass