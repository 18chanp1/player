/* A synchronizer to synchornize clock signals*/

module clk_sync(
    input logic pulse,
    input logic clk,
    output logic pulse_sync
);
    logic auto_rst;
    assign auto_rst = pulse_sync && !pulse;

    logic FF1, FF2;
    always_ff @(posedge clk)
    begin
        pulse_sync <= FF2;
        FF2 <= FF1;
    end

    always_ff @(posedge pulse, posedge auto_rst)
    begin
        if(auto_rst) FF1 <= 1'b0;
        else FF1 <= 1'b1;
    end

endmodule
