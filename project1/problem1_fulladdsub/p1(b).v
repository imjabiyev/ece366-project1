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
