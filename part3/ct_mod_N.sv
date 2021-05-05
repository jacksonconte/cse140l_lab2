// CSE140L  
// What does this do?
// - increments number between 0 and N - 1 (seconds, minutes, hours)
// When does "z" go high?
// - when an overflow is about to happen

module ct_mod_N #(parameter N=60)(
  input clk, rst, en,
  output logic[6:0] ct_out,
  output logic      z);

  always_ff @(posedge clk)
    if(rst)
	  ct_out <= 0;
	else if(en)
	  ct_out <= (ct_out+1)%N;	  // modulo operator
//  assign   z = !ct_out;
  always_comb z = ct_out==(N-1);   // always @(*)   // always @(ct_out)

endmodule



