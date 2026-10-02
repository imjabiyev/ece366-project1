module one_bit_full_adder(A, B, Cin, S, Cout);

input A, B, Cin;
output reg S, Cout;

  always @(A or B or Cin) begin
    case ({A, B, Cin})
      3'b000: begin S = 0; Cout = 0; end
      3'b001: begin S = 1; Cout = 0; end
      3'b010: begin S = 1; Cout = 0; end
      3'b011: begin S = 0; Cout = 1; end
      3'b100: begin S = 1; Cout = 0; end
      3'b101: begin S = 0; Cout = 1; end
      3'b110: begin S = 0; Cout = 1; end
      3'b111: begin S = 1; Cout = 1; end
    endcase
  end
  
endmodule //one bit full adder

module four_bit_RCA_RCS(A, B, Cin, S, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  wire [3:0] B_x;
  wire c1, c2, c3;

  // passes when cin is 0, gets inverted when cin is 1
  xor g0 (B_x[0], B[0], Cin);
  xor g1 (B_x[1], B[1], Cin);
  xor g2 (B_x[2], B[2], Cin);
  xor g3 (B_x[3], B[3], Cin);

  // cin is the first carry-in 
  one_bit_full_adder U0 (A[0], B_x[0], Cin, S[0], c1);
  one_bit_full_adder U1 (A[1], B_x[1], c1,  S[1], c2);
  one_bit_full_adder U2 (A[2], B_x[2], c2,  S[2], c3);
  one_bit_full_adder U3 (A[3], B_x[3], c3,  S[3], Cout);

endmodule // four bit RCA/RCS
