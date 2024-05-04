module stf_sync
#(
    parameter N = 2
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

    always_ff @(posedge slowclk)
    begin
        reg1 <= data;
    end

    always_ff @(posedge fastclk)
    begin
        synced <= reg3;
        if(clkreg2) reg3 <= reg1;
    end



    

endmodule