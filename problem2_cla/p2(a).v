module four_bit_cla_block(A, B, Cin, S, G, P);
  input[3:0] A, B;
  input Cin;
  output [3:0] S;
  output G, P;

  //Problem 1's RCA module for sum/internal ripple carries
  wire dummy_cout;
  four_bit_RCA rca_inst (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(dummy_cout)
  );

  //Bit-lvl generate (Gi = Ai & Bi) and propagate 
  wire [3:0] g, p;
  assign g = A & B;
  assign p = A ^ B;

  //Block propagate using 2 input AND gates
  wire p3_2, p1_0;
  and (p3_2, p[3], p[2]);
  and (p1_0, p[1], p[0]);
  and (P, p3_2, p1_0);

  //Block generate 
  wire term1, term2, term3;
  wire p3_p2;

  and(p3_p2, p[3], p[2]);

  and (term1, p[3], g[2]);
  and (term2, p3_p2, g[1]);
  and (term3, p3_2 & p[1], g[0]);

  wire or1, or2;
  or (or1, g[3], term1);
  or (or2, term2, term3);
  or (G, or1, or2);

endmodule

module CLA(A, B, Cin, S, Cout);

  input [31:0] A, B;
  input Cin;
  output [31:0] S;
  output Cout;

  wire [7:0] G; //Block Generate signals
  wire [7:0] P; //Block Propagate signals
  wire [8;0] C; //Inter-block carries 

  assign C[0] = Cin;

  //Lookahead Carry Generator logic 
  //C[k+1] = G[k] | (P[k] & C[k])
  genvar k;
  generate
    for (k = 0; k < 8; k = k + 1) begin: CarryLogic
      wire p_and_c;
      and (p_and_c, P[k], C[k]);
      or (C[k+1], G[k], p_and_c);
    end 
  endgenerate

  //Instantatiation of Eight 4-bit CLA blocks
  genvar i;
  generate
    for (i = 0; i < 8, i = i + 1) begin: CLA_Blocks
      four_bit_cla_block block_inst (
        .A (A[4*i+3 : 4*i]),
        .B (B[4*i+3 : 4*i]),
        .Cin(C[i]),
        .S (S[4*i+3 : 4*i]),
        .G (G[i]),
        .P (P[i])
      );
    end 
  endgenerate

  assign Cout = C[8];

endmodule

  
  
  
  
