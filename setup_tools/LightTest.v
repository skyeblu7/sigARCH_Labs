module main(
    input clk,
    output led0
);

wire [7:0] connection;
wire delaySig;
reg led0_enable = 0;

assign led0 = led0_enable;


delayGenerator delay(.clk, .offset(30'd2500000), .delaySig);
upCounter counter(.clk(delaySig), .out(connection));

always @(posedge clk ) begin
    if(connection > 8'd127)
        led0_enable <= 1;
    else 
        led0_enable <= 0;
end
endmodule

module upCounter(
    input clk,
    output [7:0] out   
);

reg [7:0] count = 0;

assign out = count;

always @(posedge clk) begin
    count <= count + 1;
end
endmodule



module delayGenerator(input clk, input [29:0] offset, output delaySig);

reg [29:0] count = 0;
reg sig;

assign delaySig = sig;

always @ (posedge clk)
begin
	if(count == offset)
		count <= 0;
	else
		count <= count+1;

    if(count == offset/2)
	    sig <= 1;
    else
	    sig <= 0;
end

endmodule


