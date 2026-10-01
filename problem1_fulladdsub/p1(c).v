module one_bit_full_adder (A,B,Cin,S,Cout);
  
  input A, B, Cin;
  output S, Cout;
  
  wire xor_g, and1, and2, and3, or1;
  
  xor U_xor1 (xor_g, A, B);
  xor U_xor2 (S, xor_g, Cin);
  
  and U_and1 (and1, A, Cin);
  and U_and2 (and2, B, Cin);
  and U_and3 (and3, A, B);
  
  or U_or1 (or1, and1, and2);
  or U_or2(Cout, or1, and3);
  
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
