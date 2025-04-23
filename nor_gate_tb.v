`timescale 1ns/1ps
module nor_gate_tb;
	reg a,b;
	wire y;
	integer f;
	
	nor_gate uut(
		.a(a),
		.b(b),
		.y(y)
	);
	initial begin
		$dumpfile("nor_gate.vcd");
		$dumpvars(0,nor_gate_tb);
		
		f=$fopen("monitor_log_nor.txt","w");
		if(!f) begin
			$display("Failed to open monitor_log_nor.txt");
			$finish;
		end 
		else begin
			$display("File opened.");
		end
		
		a=0;b=0;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0b ns\n",a,b,y,$time);
		a=0;b=1;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0b ns\n",a,b,y,$time);
		a=1;b=0;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0b ns\n",a,b,y,$time);
		a=1;b=1;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0b ns\n",a,b,y,$time);
		
		$fclose(f);
		$display("Simulation done.");
		$finish;
	end
endmodule