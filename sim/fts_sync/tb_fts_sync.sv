`timescale 10ns/10ns

module tb_fts_sync();
    logic [1:0] data, synced;
    logic fastclk, slowclk;

    fts_sync #(.N(2)) DUT 
    (
        .data(data),
        .synced(synced),
        .fastclk(fastclk),
        .slowclk(slowclk)
    );

    initial begin 
        forever begin
            fastclk = 1'b0;
            #1;
            fastclk = 1'b1;
            #1;
        end
    end

    initial begin 
        forever begin
            slowclk = 1'b0;
            #10;
            slowclk = 1'b1;
            #10;
        end
    end

    initial begin
        #2;
        @(negedge fastclk); 
        data = 2'b11;
        @(posedge slowclk)
        #50;
        $stop;
    end

endmodule