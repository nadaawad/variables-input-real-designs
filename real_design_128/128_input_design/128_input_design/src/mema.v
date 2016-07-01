module memA(clk,memA_read_address,memA_output,read_preprocess,no_of_multiples,I_am_ready);

	parameter no_of_elements_on_col_nos = 20 ;

		parameter no_of_row_by_vector_modules = 4; 

	parameter element_width =32;	    parameter no_of_elements_in_output = 8 ;

		parameter overflow_allowed = no_of_elements_on_col_nos % no_of_elements_in_output;

	parameter additional =  (no_of_elements_in_output -  overflow_allowed)*element_width;

 	parameter memory_A_height = 2000;

	parameter address_width =$clog2(memory_A_height)+1;

		parameter multiples_memory_value_width =32;

	input wire read_preprocess;

	input wire[multiples_memory_value_width*no_of_row_by_vector_modules-1:0]no_of_multiples;

	input wire[no_of_row_by_vector_modules-1:0] I_am_ready ;

	reg[no_of_row_by_vector_modules-1:0] first_time_flag = -1;

	output wire[no_of_row_by_vector_modules*element_width*no_of_elements_in_output-1:0] memA_output;

	input clk;

 	integer display_counter = 1;

	input[address_width-1:0] memA_read_address;  // DONT MAKE THIS element_width	

	wire[no_of_row_by_vector_modules*no_of_elements_on_col_nos*element_width-1:0] memA_extraction; // THIS MUST BE element_width

	reg[no_of_row_by_vector_modules*multiples_memory_value_width-1:0] fantastic_counters ;

	reg[no_of_row_by_vector_modules*multiples_memory_value_width-1:0] fantastic_counters_dash ;

	reg[no_of_row_by_vector_modules*multiples_memory_value_width-1:0] fantastic_counters_dash_dash ;

	wire [no_of_row_by_vector_modules*element_width*no_of_elements_in_output-1:0] value ;

	assign value[64*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(64*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(64*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[63*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(63*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(63*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[62*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(62*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(62*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[61*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(61*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(61*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[60*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(60*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(60*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[59*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(59*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(59*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[58*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(58*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(58*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[57*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(57*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(57*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[56*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(56*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(56*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[55*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(55*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(55*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[54*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(54*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(54*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[53*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(53*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(53*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[52*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(52*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(52*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[51*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(51*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(51*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[50*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(50*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(50*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[49*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(49*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(49*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[48*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(48*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(48*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[47*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(47*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(47*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[46*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(46*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(46*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[45*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(45*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(45*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[44*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(44*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(44*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[43*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(43*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(43*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[42*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(42*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(42*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[41*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(41*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(41*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[40*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(40*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(40*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[39*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(39*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(39*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[38*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(38*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(38*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[37*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(37*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(37*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[36*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(36*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(36*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[35*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(35*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(35*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[34*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(34*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(34*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[33*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(33*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(33*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[32*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(32*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(32*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[31*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(31*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(31*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[30*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(30*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(30*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[29*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(29*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(29*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[28*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(28*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(28*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[27*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(27*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(27*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[26*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(26*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(26*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[25*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(25*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(25*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[24*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(24*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(24*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[23*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(23*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(23*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[22*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(22*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(22*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[21*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(21*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(21*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[20*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(20*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(20*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[19*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(19*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(19*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[18*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(18*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(18*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[17*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(17*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(17*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[16*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(16*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(16*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[15*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(15*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(15*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[14*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(14*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(14*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[13*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(13*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(13*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[12*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(12*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(12*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[11*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(11*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(11*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[10*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(10*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(10*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[9*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(9*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(9*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[8*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(8*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(8*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[7*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(7*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(7*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[6*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(6*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(6*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[5*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(5*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(5*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[4*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(4*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(4*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[3*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(3*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(3*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[2*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(2*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(2*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign value[1*element_width*no_of_elements_in_output-1-:element_width*no_of_elements_in_output]  = (no_of_elements_on_col_nos < fantastic_counters_dash_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width]*no_of_elements_in_output)?

	({memA_extraction[(1*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:overflow_allowed*element_width],{additional{1'b0}}})

	:memA_extraction[(1*(no_of_elements_on_col_nos)-(fantastic_counters_dash_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width]-1)*no_of_elements_in_output)*element_width-1-:no_of_elements_in_output*element_width] 

	; 
	assign memA_output = value;

	reg [no_of_row_by_vector_modules*no_of_elements_on_col_nos*element_width-1:0] mem [0 : memory_A_height];	 // THIS MUST BE element_width

	assign memA_extraction = mem[memA_read_address];

		initial

		begin

			$readmemh("A.txt", mem);	

			fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
			fantastic_counters_dash_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width] <= 4'b0001;
		end		

			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[64-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[64*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[64-1]<=0;

								end
							else
 								begin
									fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[64-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[63-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[63*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[63-1]<=0;

								end
							else
 								begin
									fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[63-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[62-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[62*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[62-1]<=0;

								end
							else
 								begin
									fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[62-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[61-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[61*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[61-1]<=0;

								end
							else
 								begin
									fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[61-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[60-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[60*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[60-1]<=0;

								end
							else
 								begin
									fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[60-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[59-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[59*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[59-1]<=0;

								end
							else
 								begin
									fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[59-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[58-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[58*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[58-1]<=0;

								end
							else
 								begin
									fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[58-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[57-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[57*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[57-1]<=0;

								end
							else
 								begin
									fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[57-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[56-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[56*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[56-1]<=0;

								end
							else
 								begin
									fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[56-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[55-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[55*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[55-1]<=0;

								end
							else
 								begin
									fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[55-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[54-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[54*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[54-1]<=0;

								end
							else
 								begin
									fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[54-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[53-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[53*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[53-1]<=0;

								end
							else
 								begin
									fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[53-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[52-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[52*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[52-1]<=0;

								end
							else
 								begin
									fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[52-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[51-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[51*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[51-1]<=0;

								end
							else
 								begin
									fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[51-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[50-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[50*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[50-1]<=0;

								end
							else
 								begin
									fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[50-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[49-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[49*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[49-1]<=0;

								end
							else
 								begin
									fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[49-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[48-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[48*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[48-1]<=0;

								end
							else
 								begin
									fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[48-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[47-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[47*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[47-1]<=0;

								end
							else
 								begin
									fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[47-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[46-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[46*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[46-1]<=0;

								end
							else
 								begin
									fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[46-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[45-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[45*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[45-1]<=0;

								end
							else
 								begin
									fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[45-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[44-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[44*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[44-1]<=0;

								end
							else
 								begin
									fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[44-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[43-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[43*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[43-1]<=0;

								end
							else
 								begin
									fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[43-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[42-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[42*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[42-1]<=0;

								end
							else
 								begin
									fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[42-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[41-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[41*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[41-1]<=0;

								end
							else
 								begin
									fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[41-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[40-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[40*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[40-1]<=0;

								end
							else
 								begin
									fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[40-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[39-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[39*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[39-1]<=0;

								end
							else
 								begin
									fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[39-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[38-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[38*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[38-1]<=0;

								end
							else
 								begin
									fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[38-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[37-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[37*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[37-1]<=0;

								end
							else
 								begin
									fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[37-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[36-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[36*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[36-1]<=0;

								end
							else
 								begin
									fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[36-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[35-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[35*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[35-1]<=0;

								end
							else
 								begin
									fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[35-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[34-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[34*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[34-1]<=0;

								end
							else
 								begin
									fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[34-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[33-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[33*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[33-1]<=0;

								end
							else
 								begin
									fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[33-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[32-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[32*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[32-1]<=0;

								end
							else
 								begin
									fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[32-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[31-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[31*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[31-1]<=0;

								end
							else
 								begin
									fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[31-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[30-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[30*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[30-1]<=0;

								end
							else
 								begin
									fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[30-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[29-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[29*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[29-1]<=0;

								end
							else
 								begin
									fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[29-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[28-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[28*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[28-1]<=0;

								end
							else
 								begin
									fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[28-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[27-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[27*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[27-1]<=0;

								end
							else
 								begin
									fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[27-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[26-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[26*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[26-1]<=0;

								end
							else
 								begin
									fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[26-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[25-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[25*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[25-1]<=0;

								end
							else
 								begin
									fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[25-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[24-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[24*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[24-1]<=0;

								end
							else
 								begin
									fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[24-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[23-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[23*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[23-1]<=0;

								end
							else
 								begin
									fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[23-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[22-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[22*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[22-1]<=0;

								end
							else
 								begin
									fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[22-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[21-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[21*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[21-1]<=0;

								end
							else
 								begin
									fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[21-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[20-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[20*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[20-1]<=0;

								end
							else
 								begin
									fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[20-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[19-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[19*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[19-1]<=0;

								end
							else
 								begin
									fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[19-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[18-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[18*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[18-1]<=0;

								end
							else
 								begin
									fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[18-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[17-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[17*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[17-1]<=0;

								end
							else
 								begin
									fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[17-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[16-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[16*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[16-1]<=0;

								end
							else
 								begin
									fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[16-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[15-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[15*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[15-1]<=0;

								end
							else
 								begin
									fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[15-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[14-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[14*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[14-1]<=0;

								end
							else
 								begin
									fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[14-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[13-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[13*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[13-1]<=0;

								end
							else
 								begin
									fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[13-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[12-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[12*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[12-1]<=0;

								end
							else
 								begin
									fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[12-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[11-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[11*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[11-1]<=0;

								end
							else
 								begin
									fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[11-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[10-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[10*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[10-1]<=0;

								end
							else
 								begin
									fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[10-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[9-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[9*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[9-1]<=0;

								end
							else
 								begin
									fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[9-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[8-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[8*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[8-1]<=0;

								end
							else
 								begin
									fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[8-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[7-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[7*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[7-1]<=0;

								end
							else
 								begin
									fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[7-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[6-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[6*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[6-1]<=0;

								end
							else
 								begin
									fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[6-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[5-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[5*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[5-1]<=0;

								end
							else
 								begin
									fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[5-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[4-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[4*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[4-1]<=0;

								end
							else
 								begin
									fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[4-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[3-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[3*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[3-1]<=0;

								end
							else
 								begin
									fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[3-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[2-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[2*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[2-1]<=0;

								end
							else
 								begin
									fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[2-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin

					if(read_preprocess || ~first_time_flag[1-1])

						begin

							@(posedge clk);	

							if(fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width]<no_of_multiples[1*multiples_memory_value_width-1-:multiples_memory_value_width])

								begin

									fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width]+1;

									first_time_flag[1-1]<=0;

								end
							else
 								begin
									fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width]<=1;
									first_time_flag[1-1]<=1;
								end
						end
				end
			always @(posedge clk)

				begin 

					fantastic_counters_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[64*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[63*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[62*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[61*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[60*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[59*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[58*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[57*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[56*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[55*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[54*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[53*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[52*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[51*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[50*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[49*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[48*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[47*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[46*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[45*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[44*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[43*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[42*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[41*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[40*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[39*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[38*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[37*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[36*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[35*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[34*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[33*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[32*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[31*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[30*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[29*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[28*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[27*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[26*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[25*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[24*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[23*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[22*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[21*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[20*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[19*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[18*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[17*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[16*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[15*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[14*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[13*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[12*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[11*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[10*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[9*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[8*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[7*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[6*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[5*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[4*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[3*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[2*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters[1*multiples_memory_value_width-1-:multiples_memory_value_width];
				end

				always @(posedge clk)

				begin 

					fantastic_counters_dash_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[64*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[63*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[62*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[61*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[60*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[59*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[58*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[57*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[56*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[55*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[54*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[53*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[52*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[51*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[50*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[49*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[48*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[47*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[46*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[45*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[44*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[43*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[42*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[41*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[40*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[39*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[38*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[37*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[36*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[35*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[34*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[33*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[32*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[31*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[30*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[29*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[28*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[27*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[26*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[25*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[24*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[23*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[22*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[21*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[20*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[19*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[18*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[17*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[16*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[15*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[14*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[13*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[12*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[11*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[10*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[9*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[8*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[7*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[6*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[5*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[4*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[3*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[2*multiples_memory_value_width-1-:multiples_memory_value_width];
					fantastic_counters_dash_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width]<=fantastic_counters_dash[1*multiples_memory_value_width-1-:multiples_memory_value_width];
				end

	endmodule	

 