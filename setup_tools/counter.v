`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2019 10:38:03 AM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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

