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
