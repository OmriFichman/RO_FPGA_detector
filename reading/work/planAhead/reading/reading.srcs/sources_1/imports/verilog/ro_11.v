/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module ro_11 (
    input enable,
    output reg out
  );
  
  
  
  reg tmp;
  
  always @* begin
    tmp = ~(tmp & enable);
    out = tmp;
  end
endmodule
