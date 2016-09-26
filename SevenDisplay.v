`timescale 1ns / 1ns 


module SevenDisplay(HEX0, SW);
	input [3:0] SW;
	output [6:0] HEX0;
	process p0 (.c0(SW[0]),
					.c1(SW[1]),
					.c2(SW[2]),
					.c3(SW[3]),
					.h0(HEX0[0]),
					.h1(HEX0[1]),
					.h2(HEX0[2]),
					.h3(HEX0[3]),
					.h4(HEX0[4]),
					.h5(HEX0[5]),
					.h6(HEX0[6])
);
		
endmodule

module seg0(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = ((~c3&~c2&~c1&c0)|(~c3&c2&~c1&~c0)|(c3&~c2&c1&c0)|(c3&c2&~c1&c0));

endmodule

module seg1(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = (((~c3&c2&~c1&c0)|(~c3&c2&c1&~c0)|(c3&~c2&c1&c0)|(c3&c2&~c1&~c0)|(c3&c2&c1&~c0)|(c3&c2&c1&c0)));

endmodule

module seg2(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = ((~c3&~c2&c1&~c0)|(c3&c2&~c1&~c0)|(c3&c2&c1&~c0)|(c3&c2&c1&c0));

endmodule

module seg3(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = (~c3&~c2&~c1&c0)|(~c3&c2&~c1&~c0)|(~c3&c2&c1&c0)|(c3&~c2&c1&~c0)|(c3&c2&c1&c0);

endmodule

module seg4(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = (~c3&~c2&~c1&c0)|(~c3&~c2&c1&c0)|(~c3&c2&~c1&~c0)|(~c3&c2&~c1&c0)|(~c3&c2&c1&c0)|(c3&~c2&~c1&c0);

endmodule

module seg5(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = (~c3&~c2&~c1&c0)|(~c3&~c2&c1&~c0)|(~c3&~c2&c1&c0)|(~c3&c2&c1&c0)|(c3&c2&~c1&c0);

endmodule

module seg6(c3, c2, c1, c0, m);
	input c3, c2, c1, c0;
	output m;

	assign m = (~c3&~c2&~c1&~c0)|(~c3&~c2&~c1&c0)|(~c3&c2&c1&c0)|(c3&c2&~c1&~c0);

endmodule

module process(c3,c2,c1,c0,h0,h1,h2,h3,h4,h5,h6);
	input c0,c1,c2,c3;
	output h0,h1,h2,h3,h4,h5,h6;
	wire m0,m1,m2,m3,m4,m5,m6;
	
	seg0 s0(c3,c2,c1,c0,m0);
	seg1 s1(c3,c2,c1,c0,m1);
	seg2 s2(c3,c2,c1,c0,m2);
	seg3 s3(c3,c2,c1,c0,m3);
	seg4 s4(c3,c2,c1,c0,m4);
	seg5 s5(c3,c2,c1,c0,m5);
	seg6 s6(c3,c2,c1,c0,m6);
	
	assign h0=m0;
	assign h1=m1;
	assign h2=m2;
	assign h3=m3;
	assign h4=m4;
	assign h5=m5;
	assign h6=m6;
endmodule
	