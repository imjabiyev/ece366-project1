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

  
