module testbench;

    reg [31:0] A, B;
    reg Cin;

    wire [31:0] S;
    wire Cout;

    CLA test1(A, B, Cin, S, Cout);

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        A = 32'h00000003;
        B = 32'h00000004;
        Cin = 0;
        #10;

        A = 32'h00000005;
        B = 32'hFFFFFFFE;
        Cin = 0;
        #10;

        A = 32'hFFFFFFFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        A = 32'h0000FFFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        $finish;

    end

endmodule
