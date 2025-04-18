// This program was cloned from: https://github.com/chriz2600/DreamcastHDMI
// License: MIT License

module delayline(
    input clock,
    input [WIDTH-1:0] in,
    output [WIDTH-1:0] out
);

    parameter WIDTH = 8;
    parameter CYCLES = 4;

    (* ramstyle = "logic" *) reg [WIDTH-1:0] buffer [CYCLES-1:0];

    always @(posedge clock) begin
        out <= buffer[CYCLES-1];
        buffer[CYCLES-1:1] <= buffer[CYCLES-2:0];
        buffer[0] <= in;
    end

endmodule