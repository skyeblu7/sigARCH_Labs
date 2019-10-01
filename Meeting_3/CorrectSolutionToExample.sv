module mod1(
input logic A1, A2, A3, B1, B2, B3,
input logic clk, 
output logic C1, C2, C3, Q, QNOT
);

logic Quu;

always_ff @( posedge clk ) begin 
Quu <= A3;
end

always_comb begin
C1 = A1 & B1;
C2 = A2 | B2;
C3 = ~B3;

Q = Quu;
QNOT = ~Quu;
    
end