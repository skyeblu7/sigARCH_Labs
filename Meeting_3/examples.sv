module example1//module definition
  (		// input output ports, these will connect to ports 
    	// on the fpga or between other modules
    	//these can be visualized as terminals on a chip.
    	input logic port1,
   		input logic port2, 
    input logic [7:0] datainport, // you can define the width of variables using brackets, 
    							  // otherwise it will have a width of 1 (it's a 1 or 0)
    							  //This is known as a PACKED array. we will talk about unpacked arrays
   		output logic outport1,
		output logic outport2, 
   		output logic [7:0] dataoutport
  );
  
  
//FPGAs combinational logic circuits are implemented using LUT in really high speed memory
//It will be slower than an ASIC, but it's PROGRAMMABLE. hence, field PROGRAMMABLE gate array
// you can't change circuits after the fact. 
  /* THE MORE YOU KNOW
      _.-'''''''-.
    .'  _     _   '.
   /   (_)   (_)    \
  |                 |
  |                 |
   \  '.`'""'"`.'  /
    '.  `'---'`  .'
      '-._____.-'

*/
  
  
//always_comb blocks are blocks where combinational logic takes place.
//this means that the definitions of signals here are not stored in memory
//The bottleneck for speed will come from propogation delay in the case of ASICs
//and the bottleneck in FPGAs is lookup speeds for LUT 
always_comb begin
  //acts as a passthrough in this case
  outport1 = port1;//wire
  outport2 = port2; //wire
  dataoutport = datainport;//wire 
end   
endmodule //close off the module definition

module example2
  (		input logic port1,
   		input logic port2, 
   		input logic [7:0] datainport,
   		output logic outport1,
		output logic outport2, 
   		output logic [7:0] dataoutport
  );
  
  logic [7:0] numofones; 
  logic [1:0] select; //represents terminal in a mux
always_comb begin
  		numofones = datainport[7]+datainport[6]+datainport[5]+datainport[4]+datainport[3]
  +datainport[2]+datainport[1]+datainport[0]; //we can address the individual bits of a multiple bit signal
  select = {port1, port2}; //you can concatenate signals in SystemVerilog using brackets like this
  
  case (select) //note it defaults to unsigned
    0:begin 
	dataoutport = datainport;       
    end
    1:begin 
	dataoutport = ~datainport;       
    end
    2:begin
	dataoutport = datainport & numofones;       
    end    
    3:begin 
	dataoutport = numofones;       
    end      
    //from the cases block, we have created a MUX
    endcase 
    /* THE NAIVE STUDENT MAY DO THIS 
    Results in several 2:1 muxes layered together
    May be useful for signals that have priorities in theory
	if (port1 & port2 )
    	dataoutport = numofones  
  	else if (port1) begin 
    	dataoutport = ~datainport;
	end 
	else if (port2) begin 

   
    */
    
end   
endmodule 
      
      

  // verilog
module upCounter(
    input clk,
    output [7:0] out   
);

  reg [7:0] count = 0; // verilog uses reg to store things, instead of systemVerilog's logic

assign out = count;

  always @(posedge clk) //this statement only evaluates the circuit values at a positive clock edge in a clock driven circuit
begin
  count <= count + 1;//At the positive clock edge, the Value of counter has incremented
end
endmodule
      

      
module trafficlight 
  (input reset,
   input clk, 
   output R,
   output Y, 
   output G
  );
  
  enum [2:0] logic {RED, YELLOW, GREEN} colorstate; //enumerated datatypes in SystemVerilog are often used for 
  											   //state machines 
  
  colorstate currcol, colnext;
  int count, countnext;
  always_ff(@posedge clk)begin
    count <= countnext;  
    currcol <= colnext;
  end 
  
  always_comb begin
	//default values 
    R=0;
    Y=0;
    G=0;
    if (reset)begin
      countnext = 0;
      colnext = RED; 
    end 
    
    countnext=count+1;
    colnext=currcol; 

    
    //MEALY MACHINE 
    case (currcol)
    RED:begin
      R=1; 
      if (currcount == 63)begin 
        countnext=0;
      	colnext= GREEN;
      end 
    end
	YELLOW:begin
      Y=1; 
      if (currcount == 15)begin 
        countnext=0;
      	colnext= RED;
      end 
    end
    GREEN:begin
      G=1; 
      if (currcount == 63)begin 
        countnext=0;
      	colnext= YELLOW;
      end       
    end
      
    endcase 
  
  end

endmodule
      
      
      
      
      
      
