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
