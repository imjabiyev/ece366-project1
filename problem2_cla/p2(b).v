module testbench;

    reg [31:0] A, B;
    reg Cin;

    wire [31:0] S;
    wire Cout;

    wire [15:0] S_PPA;
    wire Cout_PPA;

    // 32-bit CLA
    CLA test1(A, B, Cin, S, Cout);

    //16-bit PPA
    PPA test2(A[15:0], B[15:0], Cin, S_PPA, Cout_PPA);

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


        // Unsigned sub
        A = 32'h00000007;
        B = 32'hFFFFFFFD;
        Cin = 0;
        #10;

        // Signed sub
        A = 32'h00000005;
        B = 32'h00000002;
        Cin = 0;
        #10;
        


        // PPA additional tests
        
        A = 32'h00000005;
        B = 32'h00000003;
        Cin = 1;
        #10;

        A = 32'h00007FFF;
        B = 32'h00000001;
        Cin = 0;
        #10;

        A = 32'h0000FFFF;
        B = 32'h0000FFFF;
        Cin = 1;
        #10;

        $finish;

    end

endmodule
