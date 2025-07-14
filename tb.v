`timescale 1ns/10ps

module tb;

    reg clock;
    reg reset;

    //clk, reset, pc, instr, aluout, writedata, memwrite, and readdata

    top uut (.clk(clock), .reset(reset));

    // generate clock
    always begin
        #5 clock = ~clock;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, uut);
    end

    initial begin
        // initialize all variables
        clock = 0; reset = 1;
        // wait for first negative edge before de-asserting reset
        @(negedge clock) reset = 0;
        #1000
        $finish;
    end

endmodule
