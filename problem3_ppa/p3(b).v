module testbench;

    reg [15:0] A, B;
    reg Cin;

    wire [15:0] S;
    wire Cout;

    PPA test1(A, B, Cin, S, Cout);

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        A = 16'h0003;
        B = 16'h0004;
        Cin = 0;
        #10;

        A = 16'h0005;
        B = 16'hFFFE;
        Cin = 0;
        #10;

        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 0;
        #10;

        A = 16'h00FF;
        B = 16'h0001;
        Cin = 0;
        #10;

        A = 16'h0005;
        B = 16'h0002;
        Cin = 1;
        #10;

        A = 16'h7FFF;
        B = 16'h0001;
        Cin = 0;
        #10;

        $finish;

    end

endmodule

module PPA(A, B, Cin, S, Cout);
  
  input [15:0] A, B;
  input Cin;
  output [15:0] S;
  output Cout;

  wire [15:0] P0, G0;
  wire [15:0] P1, G1;
  wire [15:0] P2, G2;
  wire [15:0] P3, G3;
  wire [15:0] P4, G4;

  wire [15:0] G_pre, P_pre;
  wire cin_and;

  // pre comp
  pre_comp PC(A, B, G_pre, P_pre);

  and U0(cin_and, P_pre[0], Cin);
  or U1(G0[0], G_pre[0], cin_and);

  assign G0[15:1] = G_pre[15:1];
  assign P0 = P_pre;

  // s1 d1
  assign P1[0] = P0[0];
  assign G1[0] = G0[0];

  black_cell BC1_1(P0[1], P0[0], G0[1], G0[0], P1[1], G1[1]);
  black_cell BC1_2(P0[2], P0[1], G0[2], G0[1], P1[2], G1[2]);
  black_cell BC1_3(P0[3], P0[2], G0[3], G0[2], P1[3], G1[3]);
  black_cell BC1_4(P0[4], P0[3], G0[4], G0[3], P1[4], G1[4]);
  black_cell BC1_5(P0[5], P0[4], G0[5], G0[4], P1[5], G1[5]);
  black_cell BC1_6(P0[6], P0[5], G0[6], G0[5], P1[6], G1[6]);
  black_cell BC1_7(P0[7], P0[6], G0[7], G0[6], P1[7], G1[7]);
  black_cell BC1_8(P0[8], P0[7], G0[8], G0[7], P1[8], G1[8]);
  black_cell BC1_9(P0[9], P0[8], G0[9], G0[8], P1[9], G1[9]);
  black_cell BC1_10(P0[10], P0[9], G0[10], G0[9], P1[10], G1[10]);
  black_cell BC1_11(P0[11], P0[10], G0[11], G0[10], P1[11], G1[11]);
  black_cell BC1_12(P0[12], P0[11], G0[12], G0[11], P1[12], G1[12]);
  black_cell BC1_13(P0[13], P0[12], G0[13], G0[12], P1[13], G1[13]);
  black_cell BC1_14(P0[14], P0[13], G0[14], G0[13], P1[14], G1[14]);
  black_cell BC1_15(P0[15], P0[14], G0[15], G0[14], P1[15], G1[15]);

  // s2 d2
  assign P2[1:0] = P1[1:0];
  assign G2[1:0] = G1[1:0];

  black_cell BC2_2(P1[2], P1[0], G1[2], G1[0], P2[2], G2[2]);
  black_cell BC2_3(P1[3], P1[1], G1[3], G1[1], P2[3], G2[3]);
  black_cell BC2_4(P1[4], P1[2], G1[4], G1[2], P2[4], G2[4]);
  black_cell BC2_5(P1[5], P1[3], G1[5], G1[3], P2[5], G2[5]);
  black_cell BC2_6(P1[6], P1[4], G1[6], G1[4], P2[6], G2[6]);
  black_cell BC2_7(P1[7], P1[5], G1[7], G1[5], P2[7], G2[7]);
  black_cell BC2_8(P1[8], P1[6], G1[8], G1[6], P2[8], G2[8]);
  black_cell BC2_9(P1[9], P1[7], G1[9], G1[7], P2[9], G2[9]);
  black_cell BC2_10(P1[10], P1[8], G1[10], G1[8], P2[10], G2[10]);
  black_cell BC2_11(P1[11], P1[9], G1[11], G1[9], P2[11], G2[11]);
  black_cell BC2_12(P1[12], P1[10], G1[12], G1[10], P2[12], G2[12]);
  black_cell BC2_13(P1[13], P1[11], G1[13], G1[11], P2[13], G2[13]);
  black_cell BC2_14(P1[14], P1[12], G1[14], G1[12], P2[14], G2[14]);
  black_cell BC2_15(P1[15], P1[13], G1[15], G1[13], P2[15], G2[15]);

  // s3 d4
  assign P3[3:0] = P2[3:0];
  assign G3[3:0] = G2[3:0];

  black_cell BC3_4(P2[4], P2[0], G2[4], G2[0], P3[4], G3[4]);
  black_cell BC3_5(P2[5], P2[1], G2[5], G2[1], P3[5], G3[5]);
  black_cell BC3_6(P2[6], P2[2], G2[6], G2[2], P3[6], G3[6]);
  black_cell BC3_7(P2[7], P2[3], G2[7], G2[3], P3[7], G3[7]);
  black_cell BC3_8(P2[8], P2[4], G2[8], G2[4], P3[8], G3[8]);
  black_cell BC3_9(P2[9], P2[5], G2[9], G2[5], P3[9], G3[9]);
  black_cell BC3_10(P2[10], P2[6], G2[10], G2[6], P3[10], G3[10]);
  black_cell BC3_11(P2[11], P2[7], G2[11], G2[7], P3[11], G3[11]);
  black_cell BC3_12(P2[12], P2[8], G2[12], G2[8], P3[12], G3[12]);
  black_cell BC3_13(P2[13], P2[9], G2[13], G2[9], P3[13], G3[13]);
  black_cell BC3_14(P2[14], P2[10], G2[14], G2[10], P3[14], G3[14]);
  black_cell BC3_15(P2[15], P2[11], G2[15], G2[11], P3[15], G3[15]);

  // s4 d8
  assign P4[7:0] = P3[7:0];
  assign G4[7:0] = G3[7:0];

  black_cell BC4_8(P3[8], P3[0], G3[8], G3[0], P4[8], G4[8]);
  black_cell BC4_9(P3[9], P3[1], G3[9], G3[1], P4[9], G4[9]);
  black_cell BC4_10(P3[10], P3[2], G3[10], G3[2], P4[10], G4[10]);
  black_cell BC4_11(P3[11], P3[3], G3[11], G3[3], P4[11], G4[11]);
  black_cell BC4_12(P3[12], P3[4], G3[12], G3[4], P4[12], G4[12]);
  black_cell BC4_13(P3[13], P3[5], G3[13], G3[5], P4[13], G4[13]);
  black_cell BC4_14(P3[14], P3[6], G3[14], G3[6], P4[14], G4[14]);
  black_cell BC4_15(P3[15], P3[7], G3[15], G3[7], P4[15], G4[15]);

  // calc sum
  post_comp PC0(Cin, A[0], B[0], S[0]);
  post_comp PC1(G4[0], A[1], B[1], S[1]);
  post_comp PC2(G4[1], A[2], B[2], S[2]);
  post_comp PC3(G4[2], A[3], B[3], S[3]);
  post_comp PC4(G4[3], A[4], B[4], S[4]);
  post_comp PC5(G4[4], A[5], B[5], S[5]);
  post_comp PC6(G4[5], A[6], B[6], S[6]);
  post_comp PC7(G4[6], A[7], B[7], S[7]);
  post_comp PC8(G4[7], A[8], B[8], S[8]);
  post_comp PC9(G4[8], A[9], B[9], S[9]);
  post_comp PC10(G4[9], A[10], B[10], S[10]);
  post_comp PC11(G4[10], A[11], B[11], S[11]);
  post_comp PC12(G4[11], A[12], B[12], S[12]);
  post_comp PC13(G4[12], A[13], B[13], S[13]);
  post_comp PC14(G4[13], A[14], B[14], S[14]);
  post_comp PC15(G4[14], A[15], B[15], S[15]);

  assign Cout = G4[15];
  
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
