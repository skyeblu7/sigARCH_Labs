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


