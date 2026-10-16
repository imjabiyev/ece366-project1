module testbench;

    reg [15:0] A, B;
    reg Cin;

    wire [15:0] S;
    wire Cout;

    PPA test1(A, B, Cin, S, Cout);

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        // 1) unsigned addition: 3 + 4 = 7
        A = 16'h0003;
        B = 16'h0004;
        Cin = 0;
        #10;

        // 2) signed addition with a negative operand: 5 + (-2) = 3
        A = 16'h0005;
        B = 16'hFFFE;
        Cin = 0;
        #10;

        // 3) carry-out: FFFF + 1 = 0, Cout = 1
        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 0;
        #10;

        // 4) carry across the lower 8 bits: 00FF + 1 = 0100
        A = 16'h00FF;
        B = 16'h0001;
        Cin = 0;
        #10;

        // 5) addition with carry-in: 5 + 2 + 1 = 8
        A = 16'h0005;
        B = 16'h0002;
        Cin = 1;
        #10;

        // 6) carry from bit 0 up to bit 15: 7FFF + 1 = 8000
        A = 16'h7FFF;
        B = 16'h0001;
        Cin = 0;
        #10;

        $finish;

    end

endmodule
