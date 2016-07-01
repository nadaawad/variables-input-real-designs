//--------------------------------------------------------------------------------------------
//
// Generated by X-HDL VHDL Translator - Version 2.0.0 Feb. 1, 2011
// Mon Apr 21 2014 01:18:24
//
//      Input file      : 
//      Component name  : outputieee_8_23_to_8_23
//      Author          : 
//      Company         : 
//
//      Description     : 
//
//
//--------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//                          OutputIEEE_8_23_to_8_23
// This operator is part of the Infinite Virtual Library FloPoCoLib
// All rights reserved 
// Authors: F. Ferrandi  (2009-2012)
//------------------------------------------------------------------------------
// Pipeline depth: 0 cycles

module OutputIEEE_8_23_to_8_23(clk, rst, X, R);
   input            clk;
   input            rst;
   input [8+23+2:0] X;
   output [31:0]    R;
   
   wire [7:0]       expX;
   wire [22:0]      fracX;
   wire [1:0]       exnX;
   wire             sX;
   wire             expZero;
   wire [22:0]      sfracX;
   wire [22:0]      fracR;
   wire [7:0]       expR;
   /*
   always @(posedge clk)
      
         ;
   */
   assign expX = X[30:23];
   assign fracX = X[22:0];
   assign exnX = X[33:32];
   assign sX = ((exnX == 2'b01 | exnX == 2'b10 | exnX == 2'b00)) ? X[31] : 
               1'b0;
   assign expZero = (expX == 8'b00000000) ? 1'b1 : 
                    1'b0;
   // since we have one more exponent value than IEEE (field 0...0, value emin-1),
   // we can represent subnormal numbers whose mantissa field begins with a 1
   assign sfracX = ((exnX == 2'b00)) ? 23'b00000000000000000000000 : 
                   ((expZero == 1'b1 & exnX == 2'b01)) ? {1'b1, fracX[22:1]} : 
                   ((exnX == 2'b01)) ? fracX : 
                   {22'b0000000000000000000000, exnX[0]};
   assign fracR = sfracX;
   assign expR = ((exnX == 2'b00)) ? 8'b00000000 : 
                 ((exnX == 2'b01)) ? expX : 
                 8'b11111111;
   assign R = {sX, expR, fracR};
   
endmodule
