
module dff(
  input logic[7:0] din,
  input clk,
  input rst,
  output logic[7:0] dout
);
  
  
  always @(posedge clk)
    begin
      
      if(rst) begin
        assign dout=0;
      end
      else begin
        assign dout=din;
      end
    end
endmodule
  