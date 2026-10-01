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

module four_bit_RCS(A, B, S, Cout);
  input [3:0] A, B;
  output [3:0] S;
  output Cout;
  
  wire [3:0] B_inv;
  wire c1, c2, c3;

  // Invert B -> B_inv
  not not_0 (B_inv[0], B[0]);
  not not_1 (B_inv[1], B[1]);
  not not_2 (B_inv[2], B[2]);
  not not_3 (B_inv[3], B[3]);

  // ripple carry subtractor (A + (~B) + 1)
  one_bit_full_adder U0 (A[0], B_inv[0], 1'b1, S[0], c1);
  one_bit_full_adder U1 (A[1], B_inv[1], c1,  S[1], c2);
  one_bit_full_adder U2 (A[2], B_inv[2], c2,  S[2], c3);
  one_bit_full_adder U3 (A[3], B_inv[3], c3,  S[3], Cout);

endmodule // four bit RCS
