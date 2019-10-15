
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 03:35:12 PM
// Design Name: 
// Module Name: testbentch
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

`timescale 1ns / 1ps

module testbentch();

    logic serialInput = 0;
    logic [0:1] parallelInput = 2'd0;
    logic parallelEnable = 0;
    logic clk = 0;
    logic clr = 0;
    logic serialOutput = 0;
    logic [0:1] parallelOutput = 2'd0;



    shftReg2Bit shiftReg(.serialInput, .parallelInput, .parallelEnable, .clk, .clr, .serialOutput, .parallelOutput);

    initial begin


        // test if clock works properly
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #300

        // test if serial input only writes on posedge of clk
        serialInput = 1;
        clk = 0;
        #50
        serialInput = 0;
        clk = 1;
        #50
        serialInput = 1;
        clk = 0;
        #50
        clk = 1;
        #50
        serialInput = 0;
        clk = 0;
        #50
        clk = 1;
        #50
        clk = 0;
        #50
        clk = 1;
        #300

        // test if parallel input works
        parallelInput = 2'b11;
        clk = 0;
        #50
        clk = 1;
        #50 
        clk = 0;
        parallelEnable = 1;
        #50
        clk = 1;
        #50
        parallelEnable = 0;
        clk = 0;
        #300

        // test if clear works
        serialInput = 1;
        parallelInput = 2'b11;
        parallelEnable = 1;
        clk = 0;
        #50
        clk = 1;
        #50
        clr = 1;
        clk = 0;
        #50
        clk = 1;
        #50
        clr = 0;
        clk = 0;



        

    end

endmodule
