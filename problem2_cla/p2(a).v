// Problem 1 components used by the CLA (same as problem1_fulladdsub/p1(c).v)

module one_bit_full_adder(A,B,Cin,S,Cout);
  
  input A, B, Cin;
  output S, Cout;
  
  wire xor_1_o, and_1_o, and_2_o;

  // first layer
  xor xor_1 (xor_1_o, A, B);
  and and_1 (and_1_o, A, B);

  // second layer
  xor xor_2 (S, Cin, xor_1_o);
  and and_2 (and_2_o, Cin, xor_1_o);

  // third layer
  or or_1 (Cout, and_1_o, and_2_o);
  
endmodule

module four_bit_RCA(A,B,Cin,S,Cout);
  
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  wire c1,c2,c3;
  
  one_bit_full_adder U0 (A[0],B[0],Cin,S[0],c1);
  one_bit_full_adder U1 (A[1],B[1],c1 ,S[1],c2);
  one_bit_full_adder U2 (A[2],B[2],c2,S[2],c3);
  one_bit_full_adder U3 (A[3],B[3],c3,S[3],Cout);
  
endmodule

// Problem 2(a): 4-bit CLA block

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

  //Bit-lvl generate (gi = Ai & Bi) and propagate (pi = Ai | Bi), 2-input gates
  wire [3:0] g, p;
  and g_gate [3:0] (g, A, B);
  or  p_gate [3:0] (p, A, B);

  //Block propagate using 2 input AND gates
  wire p3_2, p1_0;
  and (p3_2, p[3], p[2]);
  and (p1_0, p[1], p[0]);
  and (P, p3_2, p1_0);

  //Block generate 
  wire term1, term2, term3;
  wire p3_p2, p3_p1;

  and (p3_p2, p[3], p[2]);
  and (p3_p1, p3_p2, p[1]);

  and (term1, p[3], g[2]);
  and (term2, p3_p2, g[1]);
  and (term3, p3_p1, g[0]);

  wire or1, or2;
  or (or1, g[3], term1);
  or (or2, term2, term3);
  or (G, or1, or2);

endmodule

// Problem 2(a): 32-bit CLA

module CLA(A, B, Cin, S, Cout);

  input [31:0] A, B;
  input Cin;
  output [31:0] S;
  output Cout;

  wire [7:0] G; //Block Generate signals
  wire [7:0] P; //Block Propagate signals
  wire [8:0] C; //Inter-block carries 

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
    for (i = 0; i < 8; i = i + 1) begin: CLA_Blocks
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
