`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2019 07:29:12 PM
// Design Name: 
// Module Name: mod1
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


module register(input logic clk,
                input logic dataIn,
                input logic clr,
                output logic dataOut);

    logic data = 0;
    assign dataOut = data;

    always_ff @(posedge clk) begin
    
        if(clr)
            data <= 0;
        else
            data <= dataIn;
    end

endmodule


module shftReg2Bit(input logic serialInput,
            input logic [0:1] parallelInput,
            input logic parallelEnable,
            input logic clk,
            input logic clr,
            output logic serialOutput,
            output logic [0:1] parallelOutput);


    logic [1:0] dataInput = 2'd0;
    logic [1:0] dataOutput = 2'd0;

    always_comb begin
        if(parallelEnable) begin 
            dataInput = parallelInput;
        end
        else begin
            dataInput[0] = serialInput;
            dataInput[1] = dataOutput[0];
        end

        serialOutput = dataOutput[1];
        parallelOutput = dataOutput;

    end
    
    register LSB(.clk, .dataIn(dataInput[0]), .clr, .dataOut(dataOutput[0]));
    register MSB(.clk, .dataIn(dataInput[1]), .clr, .dataOut(dataOutput[1]));



endmodule
