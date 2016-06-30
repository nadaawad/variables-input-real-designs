//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// Mon Apr 21 2014 01:18:10
//
//      Input file      : 
//      Component name  : inputieee_8_23_to_8_23
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//                           InputIEEE_8_23_to_8_23
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: Florent de Dinechin (2008)
//------------------------------------------------------------------------------
// Pipeline depth: 0 cycles

module InputIEEE_8_23_to_8_23(clk, rst, X, R);
   input             clk;
   input             rst;
   input [31:0]      X;
   output [8+23+2:0] R;
   
   wire [7:0]        expX;
   wire [22:0]       fracX;
   wire              sX;
   wire              expZero;
   wire              expInfty;
   wire              fracZero;
   wire              reprSubNormal;
   wire [22:0]       sfracX;
   wire [22:0]       fracR;
   wire [7:0]        expR;
   wire              infinity;
   wire              zero;
   wire              NaN;
   wire [1:0]        exnR;
   /*
   always @(posedge clk)
      
         ;
   */
	assign expX = X[30:23];
   assign fracX = X[22:0];
   assign sX = X[31];
   assign expZero = (expX == 8'b00000000) ? 1'b1 : 
                    1'b0;
   assign expInfty = (expX == 8'b11111111) ? 1'b1 : 
                     1'b0;
   assign fracZero = (fracX == 23'b00000000000000000000000) ? 1'b1 : 
                     1'b0;
   assign reprSubNormal = fracX[22];
   // since we have one more exponent value than IEEE (field 0...0, value emin-1),
   // we can represent subnormal numbers whose mantissa field begins with a 1
   assign sfracX = ((expZero == 1'b1 & reprSubNormal == 1'b1)) ? {fracX[21:0], 1'b0} : 
                   fracX;
   assign fracR = sfracX;
   // copy exponent. This will be OK even for subnormals, zero and infty since in such cases the exn bits will prevail
   assign expR = expX;
   assign infinity = expInfty & fracZero;
   assign zero = expZero & (~reprSubNormal);
   assign NaN = expInfty & (~fracZero);
   assign exnR = (zero == 1'b1) ? 2'b00 : 
                 (infinity == 1'b1) ? 2'b10 : 
                 (NaN == 1'b1) ? 2'b11 : 
                 2'b01;		// normal number
   assign R = {exnR, sX, expR, fracR};
   
endmodule
