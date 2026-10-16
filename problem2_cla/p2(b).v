module testbench;

    reg [31:0] A, B;
    reg Cin;

    wire [31:0] S;
    wire Cout;

    CLA test1(A, B, Cin, S, Cout);

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        // 1) unsigned addition: 3 + 4 = 7
        A = 32'h00000003;
        B = 32'h00000004;
        Cin = 0;
        #10;

        // 2) signed addition with a negative operand: 5 + (-2) = 3
        A = 32'h00000005;
        B = 32'hFFFFFFFE;
        Cin = 0;
        #10;

        // 3) carry-out: FFFFFFFF + 1 = 0, Cout = 1
        A = 32'hFFFFFFFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        // 4) carry across multiple 4-bit blocks: 0000FFFF + 1 = 00010000
        A = 32'h0000FFFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        // 5) unsigned addition: 7 + 3 = A
        A = 32'h00000007;
        B = 32'h00000003;
        Cin = 0;
        #10;

        // 6) addition with carry-in: 5 + 2 + 1 = 8
        A = 32'h00000005;
        B = 32'h00000002;
        Cin = 1;
        #10;

        // 7) carry through all eight blocks: 7FFFFFFF + 1 = 80000000
        A = 32'h7FFFFFFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        $finish;

    end

endmodule
