module fts_sync
#(
    parameter N = 12
) 
(
    input logic [N-1:0]     data,
    output logic [N-1:0]    synced,
    input logic             fastclk,
    input logic             slowclk
);

    logic clkreg1, clkreg2;

    always_ff @(negedge fastclk) 
    begin
        clkreg1 <= slowclk;
        clkreg2 <= clkreg1;
    end

    logic [N-1:0] reg1, reg3;

    always_ff @(posedge fastclk)
    begin
        reg1 <= data;

        if(clkreg2) 
        begin
            reg3 <= reg1;
        end
    end

    always_ff @(posedge slowclk)
    begin
        synced <= reg3;
    end

    

endmodule