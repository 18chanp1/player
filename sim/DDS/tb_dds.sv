`timescale 10ns/10ns

module tb_DDS ();

    logic clk, rst, en;
    logic [1:0] data;
    logic [3:0] mode;
    logic signed [11:0] wave;
    logic [31:0] fsk_phase_inc;

    parameter SINE =    4'b0000;
    parameter COSINE =  4'b0001;
    parameter SAW =     4'b0010;
    parameter SQUARE =  4'b0011;
    parameter ASK =     4'b1000;
    parameter FSK =     4'b1001;
    parameter BPSK =    4'b1010;
    parameter RAW =     4'b1011;
    parameter QPSK =    4'b1100;

    parameter CYCLE = 900;

    DDS #(.FREQ_CLK(300)) DUT 
    (
        .clk(clk),
        .rst(rst),
        .en(en),
        .data(data),
        .mode(mode),
        .wave(wave),
        .fsk_phase_inc(fsk_phase_inc)
    );

    initial begin
        forever begin
            clk = 1'b0;
            #1;
            clk = 1'b1;
            #2;
        end
    end

    task testop(int operation, int inp);
        if(operation == FSK)
        begin
            fsk_phase_inc = inp ? 71582789 : 14316558;
        end
        else fsk_phase_inc = 32'dx;

        mode = operation;
        data = inp;
        #CYCLE;
    endtask

    initial begin 
        en = 1'b1;
        rst = 1'b1;
        data = 2'b00;
        mode = SINE;

        #2;
        rst = 1'b0;
        #2;

        testop(RAW, 0);
        testop(RAW, 1);
        testop(SINE, 0);
        testop(COSINE, 0);
        testop(SQUARE, 0);
        testop (SAW, 0);
        testop (ASK, 0);
        testop (ASK, 1);
        testop (BPSK, 0);
        testop (BPSK, 1);
        testop (FSK, 0);
        testop (FSK, 1);
        testop (QPSK, 0);
        testop (QPSK, 1);
        testop(QPSK, 2);
        testop(QPSK, 3);

        $stop;
    end

endmodule



