module mx16_64bits(a,b,c,d,e,f,g,h,i,j,k,l,n,m,o,p,s3,s2,s1,s0,y);
input [31:0] a,b,c,d,e,f,g,h,i,j,k,l,n,m,o,p; // define 32 bits input a,b,c,d,e,f,g,h,i,j,k,l,n,m,o,p
input s3,s2,s1,s0; // define input s3, s2, s1, s0

output [63:0] y; // define 64 bits output y

wire [63:0] w[13:0]; // define 64 bits wire w[13:0]

// instance 8 mx2_64bits and pass it to s0
mx2_64bits U0_mx2_64bits( // 1st 2 to 1 64 bits multiplexer instance
	.d0(a),
	.d1(b),
	.s(s0), // pass it to s0
	.y(w[0])
	);

mx2_64bits U1_mx2_64bits( // 2nd 2 to 1 64 bits multiplexer instance
	.d0(c),
	.d1(d),
	.s(s0), // pass it to s0
	.y(w[1])
	);
	
mx2_64bits U2_mx2_64bits( // 3rd 2 to 1 64 bits multiplexer instance
	.d0(e),
	.d1(f),
	.s(s0), // pass it to s0
	.y(w[2])
	);
	
mx2_64bits U3_mx2_64bits( // 4th 2 to 1 64 bits multiplexer instance
	.d0(g),
	.d1(h),
	.s(s0), // pass it to s0
	.y(w[3])
	);
	
mx2_64bits U4_mx2_64bits( // 5th 2 to 1 64 bits multiplexer instance
	.d0(i),
	.d1(j),
	.s(s0), // pass it to s0
	.y(w[4])
	);

mx2_64bits U5_mx2_64bits( // 6th 2 to 1 64 bits multiplexer instance
	.d0(k),
	.d1(l),
	.s(s0), // pass it to s0
	.y(w[5])
	);

mx2_64bits U6_mx2_64bits( // 7th 2 to 1 64 bits multiplexer instance
	.d0(n),
	.d1(m),
	.s(s0), // pass it to s0
	.y(w[6])
	);

mx2_64bits U7_mx2_64bits( // 8th 2 to 1 64 bits multiplexer instance
	.d0(o),
	.d1(p),
	.s(s0), // pass it to s0
	.y(w[7])
	);	
	
// instance 4 mx2_64bits and pass it to s1	
mx2_64bits U8_mx2_64bits( // 9th 2 to 1 64 bits multiplexer instance
	.d0(w[0]),
	.d1(w[1]),
	.s(s1), // pass it to s1
	.y(w[8])
	);
	
mx2_64bits U9_mx2_64bits( // 10th 2 to 1 64 bits multiplexer instance
	.d0(w[2]),
	.d1(w[3]),
	.s(s1), // pass it to s1
	.y(w[9])
	);
	
mx2_64bits U10_mx2_64bits( // 11th 2 to 1 64 bits multiplexer instance
	.d0(w[4]),
	.d1(w[5]),
	.s(s1), // pass it to s1
	.y(w[10])
	);
	
mx2_64bits U11_mx2_64bits( // 12th 2 to 1 64 bits multiplexer instance
	.d0(w[6]),
	.d1(w[7]),
	.s(s1), // pass it to s1
	.y(w[11])
	);
	
// instance 2 mx2_32bits and pass it to s2
mx2_64bits U12_mx2_64bits( // 13th 2 to 1 64 bits multiplexer instance
	.d0(w[8]),
	.d1(w[9]),
	.s(s2), // pass it to s2
	.y(w[12])
	);
	
mx2_64bits U13_mx2_64bits( // 14th 2 to 1 64 bits multiplexer instance
	.d0(w[10]),
	.d1(w[11]),
	.s(s2), // pass it to s2
	.y(w[13])
	);	
	
// instance 1 mx2_64bits and pass it to s3	
mx2_64bits U14_mx2_64bits( // 15th 2 to 1 64 bits multiplexer instance
	.d0(w[12]),
	.d1(w[13]),
	.s(s3), // pass it to s3
	.y(y)
	);		
	
endmodule // end of module
	