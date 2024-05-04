`timescale 10ns/10ns

module tb_clk_sync();

    logic pulse, clk, pulse_sync;

    clk_sync DUT
    (
        .pulse(pulse),
        .clk(clk),
        .pulse_sync(pulse_sync)
    );
    
    initial begin 
        forever begin
            clk = 1'b0;
            #10;
            clk = 1'b1;
            #10;
        end
    end

    initial begin
        pulse = 1'b0; 
        #20;
        #5;
        pulse = 1'b1;
        #60;
        pulse = 1'b0;
        #100;
        $stop;
    end
endmodule

        
