module mx8_4bits(y,a,b,c,d,e,f,g,h,s2,s1,s0); // this module is 4 bits 8 to 1 Multiplexer
	input [3:0] a,b,c,d,e,f,g,h; // define 4 bits input a,b,c,d,e,f,g,h
	input s2,s1,s0; // define input s2, s1, s0
	output [3:0] y; // define 4 bits output y
	
	mx8 U0_mx8( // first instance 8 to 1 multiplexer
	.a(a[0]), // put a[0] into a
	.b(b[0]), // put b[0] into b
	.c(c[0]), // put c[0] into c
	.d(d[0]), // put d[0] into d
	.e(e[0]), // put e[0] into e
	.f(f[0]), // put f[0] into f
	.g(g[0]), // put g[0] into g
	.h(h[0]), // put h[0] into h
	.s2(s2), // put s2 into s2
	.s1(s1), // put s1 into s1
	.s0(s0), // put s0 into s0
	.y(y[0]) // put y[0] into y
	);
	
	mx8 U1_mx8( // second instance 8 to 1 multiplexer
	.a(a[1]), // similar to the code above
	.b(b[1]),
	.c(c[1]),
	.d(d[1]),
	.e(e[1]),
	.f(f[1]),
	.g(g[1]),
	.h(h[1]),
	.s2(s2),
	.s1(s1),
	.s0(s0),
	.y(y[1])
	);
	
	mx8 U2_mx8( // third instance 8 to 1 multiplexer
	.a(a[2]), // similar to the code above
	.b(b[2]),
	.c(c[2]),
	.d(d[2]),
	.e(e[2]),
	.f(f[2]),
	.g(g[2]),
	.h(h[2]),
	.s2(s2),
	.s1(s1),
	.s0(s0),
	.y(y[2])
	);
	
	mx8 U3_mx8( // fourth instance 8 to 1 multiplexer
	.a(a[3]), // similar to the code above
	.b(b[3]),
	.c(c[3]),
	.d(d[3]),
	.e(e[3]),
	.f(f[3]),
	.g(g[3]),
	.h(h[3]),
	.s2(s2),
	.s1(s1),
	.s0(s0),
	.y(y[3])
	);
	
	endmodule // end of module
	
	