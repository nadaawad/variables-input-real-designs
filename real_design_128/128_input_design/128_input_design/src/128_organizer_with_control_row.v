
module onetwoeight_Organizer_with_control_row(clk,adder_row_input,start,adder_output,outsider4,final_adder_finish_dash,ExE_finish,main_reset);

parameter element_width = 32;
parameter no_of_units = 128;
input clk ;



input wire [no_of_units*element_width-1:0] adder_row_input;
input wire start;

reg mux_select;
reg [element_width-1:0] mux_one = 0;
wire [element_width-1:0] mux_output;
wire[element_width-1:0] pre_last_output;	 
output wire [element_width-1:0] adder_output ;



input wire main_reset;
input wire outsider4;

output wire final_adder_finish_dash;   //  // NOTE :: THIS IS EQUIVALENT TO THE FORMER  OUTSIDER15
reg first_time = 1;


reg [element_width-1:0] second_pre_last_output;
wire [element_width-1:0] controlled_adder_output; 

output wire ExE_finish;  // NOTE :: THIS IS EQUIVALENT TO THE FORMER  OUTSIDER11  

reg ExE_finish_dash_dash=0;
wire final_adder_finish; 


TwoxOne_mux m1 (controlled_adder_output,mux_one,mux_output,mux_select);
onetwoeightXonetwoeight_Adder_with_start A1 (outsider4,clk,adder_row_input,pre_last_output,ExE_finish,ExE_finish_dash);
adder_subtractor_with_control_with_start final_adder (ExE_finish_dash_dash,mux_output,second_pre_last_output , adder_output, 0,clk,1,controlled_adder_output,start,final_adder_finish,final_adder_finish_dash);


always @(posedge clk)
begin
	if(!start || main_reset)
		begin	
			mux_select <= 1;
			first_time<=1;
		end
	else 
		begin
			if( ExE_finish_dash ==1 && !first_time)
				begin
					mux_select <= 0;  
				end	
			else if (ExE_finish_dash ==1)
				begin	
					first_time<=0;
				end	
			else begin mux_select<=1; end	
		end
	
end	 


	 
	
	always @(posedge clk)
		begin
			second_pre_last_output<= pre_last_output;
			ExE_finish_dash_dash<= ExE_finish_dash;
		end	




endmodule