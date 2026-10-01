module testbench;

reg [3:0] A, B;
reg Cin;

wire [3:0] S;
wire Cout;

four_bit_RCA_RCS test1(A, B, Cin, S, Cout);

initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    A = 4'b0011;
    B = 4'b0100;
    Cin = 0;
    #10;

    A = 4'b0111;
    B = 4'b0011;
    Cin = 1;
    #10;

    A = 4'b0101;
    B = 4'b1110;
    Cin = 0;
    #10;

    A = 4'b0011;
    B = 4'b1110;
    Cin = 1;
    #10;

    A = 4'b1111;
    B = 4'b0001;
    Cin = 0;
    #10;

    $finish;

end

endmodule
