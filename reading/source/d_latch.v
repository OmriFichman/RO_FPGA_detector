module d_latch (
    input d,
    input rst,  // reset
    output reg q
  );
  
  always @(rst or d)
    if (rst)
      q <= 0;
    else
      if (en)
        q <= d;
  
endmodule

