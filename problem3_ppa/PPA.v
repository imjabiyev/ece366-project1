module PPA(A, B, Cin, S, Cout);
  
  input [15:0] A, B;
  input Cin;
  output [15:0] S;
  output Cout;
  
endmodule 

//blackcell block

module black_cell(Pik, Pk_1j, Gik, Gk_1j, Pij, Gij);

  input Pik, Pk_1j, Gik, Gk_1j;
  output Pij, Gij;

  wire and_g;

  and U_p   (Pij, Pik, Pk_1j);
  and U_and (and_g, Pik, Gk_1j);
  or U_or  (Gij, Gik, and_g);

endmodule

//pre computation block

module pre_comp(A_i, B_i, G_ii, P_ii);

  input [15:0] A_i, B_i;
  output [15:0] G_ii, P_ii;

  and U_and [15:0] (G_ii, A_i, B_i);
  or U_or  [15:0] (P_ii, A_i, B_i);

endmodule

//post computation block

module post_comp(Gi_1, A_i, B_i, S_i);
  
  input Gi_1, A_i, B_i;
  output S_i;
  
  wire xor_g;
  
  xor U_xor1(xor_g, A_i, B_i);
  xor U_xor2(S_i, Gi_1, xor_g);
  
endmodule
