module mips32_testbench ();

	reg clock;
	wire result;
	
	mips32 test(clock);

	initial clock = 1;

	initial begin 
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; #75 clock=~clock;
		#75 clock=~clock; 
	end

endmodule