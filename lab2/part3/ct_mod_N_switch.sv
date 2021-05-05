// CSE140L  
// What does this do?
// - increments number between 0 and N - 1 (seconds, minutes, hours)
// When does "z" go high?
// - when an overflow is about to happen

module ct_mod_N_switch (
  input clk, rst, en, 
  input logic[6:0] month,
  output logic[6:0] ct_out,
  output logic      z);
  
  	logic[6:0] N = 31;
	
	always_comb begin
	case(month)
		
			 1 : assign N = 28;
			 2 : assign N = 30;
			 3 : assign N = 30;
			 5 : assign N = 30;
			 8 : assign N = 30;
			 10 : assign N = 30;
			 
			 default : assign  N = 31;
		 endcase
	end
//
//  always_ff @(posedge clk) begin
//
//    if(rst)
//	  ct_out <= 0;
//	else if(en)
//		case(month)
//		
//			 1 : assign N = 28;
//			 2 : assign N = 30;
//			 3 : assign N = 30;
//			 5 : assign N = 30;
//			 8 : assign N = 30;
//			 10 : assign N = 30;
//			 
//			 default : assign  N = 31;
//		 endcase
//		 
//		 ct_out <= (ct_out+1)%N;	  
//	  
//	end  
//	  
//	  
////  assign   z = !ct_out;
//  always_comb begin z = ct_out==(N-1);  $display("N is %d", N); end // always @(*)   // always @(ct_out)

always_ff @(posedge clk)
    if(rst)
	  ct_out <= 0;
	else if(en)
	  ct_out <= (ct_out+1)%N;	  // modulo operator
//  assign   z = !ct_out;
  always_comb z = ct_out==(N-1);   // always @(*)   // always @(ct_out)



endmodule



