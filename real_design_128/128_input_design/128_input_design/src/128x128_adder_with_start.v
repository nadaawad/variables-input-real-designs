module onetwoeightXonetwoeight_Adder_with_start(ExE_start,clk,inputs,summation,ExE_finish,ExE_finish_dash);
input wire clk;
parameter NI =128;

input wire [NI*32-1:0] inputs ;
output wire[31:0] summation;

input wire ExE_start;
reg ExE_start_dash=0;
reg ExE_start_dash_dash=0;


output wire ExE_finish;	
output wire ExE_finish_dash;

wire[NI/2-1:0] finish_first_stage;
reg [NI/2-1:0] finish_first_stage_dash=0;



wire [32*(NI/2)-1:0] inputs_to_8x8_adder ;


genvar i ;
generate
for(i=0;i<NI/2;i=i+1) begin : instantiate_Adder
adder_subtractor_with_start sixteen_to_eight_adder (ExE_start_dash_dash,inputs[32*(NI-(2*i))-1-:32], inputs[32*(NI-(2*i)-1)-1-:32], inputs_to_8x8_adder[32*(NI/2 -i)-1-:32], 0,clk,1,finish_first_stage[(NI/2-i)-1]);
end
endgenerate

sixtyfourXsixtyfour_Adder_with_start AA (&finish_first_stage_dash,clk,inputs_to_8x8_adder,summation,ExE_finish,ExE_finish_dash);




//start of the adder
always @(posedge clk)
	begin
	ExE_start_dash<=ExE_start;
	ExE_start_dash_dash <=ExE_start_dash;
	end	


//start of the second stage
always@(posedge clk)
	begin
		if(finish_first_stage!=0 && ! (&finish_first_stage_dash))
			begin
				finish_first_stage_dash <= finish_first_stage_dash | finish_first_stage;	
			end	
		else if(&finish_first_stage_dash && !(&finish_first_stage))	
			begin 
				finish_first_stage_dash<=0;
			end	
	end


endmodule