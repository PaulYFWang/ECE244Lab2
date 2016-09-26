`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;
	  mux4to1 u0(
        .u(SW[0]),
        .v(SW[1]),
        .w(SW[2]),
        .x(SW[3]),
        .s0(SW[8]),
        .s1(SW[9]),
        .m(LEDR[0])
        );
		  
endmodule

module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output
  
    //assign m = s & y | ~s & x;
    // OR
    assign m = s ? y : x;

endmodule

module mux4to1(u, v, w, x, s0, s1, m);
	input u, v, w, x, s0, s1; //4 inputs and 2 signal
	output m;//output signal
	wire c0, c1; //wires to store output from the 2 mux2to1
	
	mux2to1 u0(u, v, s0, c0);//select which pairs (uw,vx) of signals goes through
	mux2to1 u1(w, x, s0, c1);
	mux2to1 u2(c0, c1, s1, m);//final selection between c0 and c1
	
endmodule