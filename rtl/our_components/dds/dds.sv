/*
A wrapper that wraps a DDS waveform_gen module 
to provide different waves, given some input data, 
and mode selection.

Uses sine as a carrier wave. 

BPSK -  data[0] => sine (phase shift = 0)
       !data[0] => ~sine (phase shift = 180)

QPSK - data = 00 => sine + cosine (phase shift = 315)
       data = 01 => sine - cosine (phase shift = 45)
       data = 10 => -sine + cosine (phase shift = 225)
       data = 11 => -sine - cosine (phase shift = 135)
*/

module DDS
#(
    /* Frequencies in Hz */
    parameter FREQ_HI =  5,             /* Frequency for "1" for FSK*/
    parameter FREQ_MID = 3,             /* Frequency for ASK, BPSK, QPSK */ 
    parameter FREQ_LO =  1,             /* Frequency for "0" for FSK */
    parameter FREQ_CLK = 50_000_000,    /* Sample Frequency, default 50Mhz*/
    
    /* Codes for different outputs */
    parameter SINE =    4'b0000,
    parameter COSINE =  4'b0001,
    parameter SAW =     4'b0010,
    parameter SQUARE =  4'b0011,
    parameter ASK =     4'b1000,
    parameter FSK =     4'b1001,
    parameter BPSK =    4'b1010,
    parameter RAW =     4'b1011,
    parameter QPSK =    4'b1100
)
(
    input logic clk,
    input logic rst, 
    input logic en,
    /*data[0] for FSK/ASK/BPSK,  data[1:0] for QPSK*/
    input logic [1:0] data,
    input logic [3:0] mode,
    input logic [31:0] fsk_phase_inc,
    output logic signed [11:0] wave
);

    /* Calculate phase_inc for various frequencies*/
    localparam [64:0] PHASE_INC_MID = ((FREQ_MID * (2**32)) / FREQ_CLK);

    logic [31:0] phase_inc;
    logic signed [11:0] sine, cosine, square, saw;
    waveform_gen DDS 
    (
        .clk(clk),
        .reset(~rst),
        .en(en),
        .phase_inc(phase_inc),
        .sin_out(sine),
        .cos_out(cosine),
        .squ_out(square),
        .saw_out(saw)
    );

    /* Choose phase_inc depending on mode, and data for FSK*/
    assign phase_inc = (mode == FSK) ? fsk_phase_inc : PHASE_INC_MID;

    /* Select output encoding based on mode and data */
    logic signed [12:0] qpsk_wave;
    always_comb begin
        case(data[1:0])
            2'b00: qpsk_wave = (sine + cosine);
            2'b01: qpsk_wave = (sine + ~cosine);
            2'b10: qpsk_wave = (~sine + cosine);
            2'b11: qpsk_wave = (~sine + ~cosine);
        endcase
    end
    
    always_comb begin
        case (mode)
            SINE:   wave = sine;
            COSINE: wave = cosine;
            SQUARE: wave = square;
            SAW:    wave = saw;
            ASK:    wave = data[0] ? sine : 12'b0;
            BPSK:   wave = data[0] ? ~sine : sine;
            FSK:    wave = sine;
            RAW:    wave = data[0] ? 12'b0 : {1'b1, {11{1'b0}}};
            QPSK:   wave = qpsk_wave[12:1];
            default: wave = 12'b0;
        endcase
    end

    
endmodule