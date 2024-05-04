`timescale 10ns/10ns

module tb_fts_sync();
    logic [1:0] data, synced;
    logic fastclk, slowclk;

    stf_sync #(.N(2)) DUT 
    (
        .data(data),
        .synced(synced),
        .fastclk(fastclk),
        .slowclk(slowclk)
    );

    initial begin 
        #1;
        forever begin
            fastclk = 1'b0;
            #2;
            fastclk = 1'b1;
            #2;
        end
    end

    initial begin 
        forever begin
            slowclk = 1'b0;
            #20;
            slowclk = 1'b1;
            #20;
        end
    end

    initial begin
        #2;
        @(negedge slowclk); 
        data = 2'b11;
        @(posedge fastclk);
        #50;
        $stop;
    end

endmodule