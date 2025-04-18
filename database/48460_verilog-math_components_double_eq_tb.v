// This program was cloned from: https://github.com/dawsonjon/verilog-math
// License: MIT License

module double_eq_tb;
  reg clk;
  reg [63:0] double_eq_a;
  reg [63:0] double_eq_b;
  wire [0:0] double_eq_z;
  integer double_eq_a_file;
  integer double_eq_b_file;
  integer double_eq_z_file;
  integer double_eq_a_count;
  integer double_eq_b_count;
  integer double_eq_z_count;

  double_eq double_eq1 (clk, double_eq_a, double_eq_b, double_eq_z);
  initial
  begin
    double_eq_z_file = $fopen("stim/double_eq_z");
    double_eq_a_file = $fopen("stim/double_eq_a", "r");
    double_eq_b_file = $fopen("stim/double_eq_b", "r");
  end

  initial
  begin
    #10010 $finish;
  end

  initial
  begin
    clk <= 1'b0;
    while (1) begin
      #5 clk <= ~clk;
    end
  end

  always @ (posedge clk)
  begin
    $fdisplay(double_eq_z_file, "%d", double_eq_z);
    #0 double_eq_a_count = $fscanf(double_eq_a_file, "%d\n", double_eq_a);
    #0 double_eq_b_count = $fscanf(double_eq_b_file, "%d\n", double_eq_b);
  end
endmodule
