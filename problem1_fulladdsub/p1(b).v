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
