module expression_00607(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
  input [3:0] a0;
  input [4:0] a1;
  input [5:0] a2;
  input signed [3:0] a3;
  input signed [4:0] a4;
  input signed [5:0] a5;

  input [3:0] b0;
  input [4:0] b1;
  input [5:0] b2;
  input signed [3:0] b3;
  input signed [4:0] b4;
  input signed [5:0] b5;

  wire [3:0] y0;
  wire [4:0] y1;
  wire [5:0] y2;
  wire signed [3:0] y3;
  wire signed [4:0] y4;
  wire signed [5:0] y5;
  wire [3:0] y6;
  wire [4:0] y7;
  wire [5:0] y8;
  wire signed [3:0] y9;
  wire signed [4:0] y10;
  wire signed [5:0] y11;
  wire [3:0] y12;
  wire [4:0] y13;
  wire [5:0] y14;
  wire signed [3:0] y15;
  wire signed [4:0] y16;
  wire signed [5:0] y17;

  output [89:0] y;
  assign y = {y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17};

  localparam [3:0] p0 = ((((3'sd2)==(4'd15))>=((2'd3)&(4'sd5)))>={((3'd6)===(5'sd7)),((2'd3)-(-3'sd3)),(3'sd0)});
  localparam [4:0] p1 = ({(((2'd1)==(-2'sd0))<<<{(5'd31),(5'd21),(4'd12)})}!={1{{{1{((-3'sd0)?(2'd3):(5'd15))}}}}});
  localparam [5:0] p2 = ((5'd13)?(2'd1):(-5'sd6));
  localparam signed [3:0] p3 = (|(~&(2'd0)));
  localparam signed [4:0] p4 = ((~^(-5'sd15))>{3{(-3'sd1)}});
  localparam signed [5:0] p5 = ((3'sd1)^(4'd5));
  localparam [3:0] p6 = (5'd20);
  localparam [4:0] p7 = ({3{(5'sd13)}}==(5'd2 ** {(4'd7),(2'd2),(2'd2)}));
  localparam [5:0] p8 = ((2'd0)?(4'sd2):(-4'sd5));
  localparam signed [3:0] p9 = ((((2'd2)>(~&(2'sd0)))^~((|(3'd2))^(-4'sd1)))&{(-(!((2'd0)!=(2'd1)))),(((5'd25)|(3'd7))>=((5'd2)<<(-4'sd6)))});
  localparam signed [4:0] p10 = ((&(-4'sd0))<=(~(4'd7)));
  localparam signed [5:0] p11 = (4'd12);
  localparam [3:0] p12 = {2{(-4'sd6)}};
  localparam [4:0] p13 = ((4'd4)?(-5'sd11):(5'd10));
  localparam [5:0] p14 = (~^((((5'd22)===(5'd31))?((-3'sd0)<<(2'sd0)):(!(3'sd1)))<<(^(~^(|(((5'd7)<<(3'sd1))/(-5'sd4)))))));
  localparam signed [3:0] p15 = (~(2'd2));
  localparam signed [4:0] p16 = {2{{{(4'd6),(3'd6)},{3{(4'd0)}}}}};
  localparam signed [5:0] p17 = ((2'd3)+((3'sd1)&&(-5'sd4)));

  assign y0 = $signed((($signed(b3)||{p10,p14})-((p15<<<p6)^(p11<<<p15))));
  assign y1 = {((((p10^p13)^(p11<<p12))+((a5<<b5)==={b5}))<={((p9|p5)==(p13&b0))})};
  assign y2 = (({4{a4}}^~{1{p4}})?$unsigned((p15?p11:p7)):((p9>=p3)));
  assign y3 = {2{p10}};
  assign y4 = ((5'd6)||(p13>>>p0));
  assign y5 = (-5'sd4);
  assign y6 = (~^(3'd3));
  assign y7 = ($signed(((p12^p12)|(p8<<<p3)))==$unsigned($signed(((p13+p15)<<$signed(p1)))));
  assign y8 = ({2{p6}}>={3{p17}});
  assign y9 = (|(+(!(|(((~&(-b5))-(b2===a4))>=(~((b2-b2)<=(~(a2^~a0)))))))));
  assign y10 = (~(((&(p1>p13))>(p4-p14))&&({(+p3),(p0>p14)})));
  assign y11 = $signed((((((p9*p5)?(p9*p13):$signed(p8))<<<((p2<p12)?(p5?p6:p8):$unsigned(p13))))));
  assign y12 = ($signed((b2||p4))?({4{b2}}!=(a1&b4)):($signed(b4)>=(!a1)));
  assign y13 = (&(-((p13?p16:p3)?(p8?p17:p9):(|p0))));
  assign y14 = (&({a2,a1,a0}?{p4,a2}:(a5?p13:p3)));
  assign y15 = {(|(&(b1?b3:b2))),(a0?b2:a4),(b5?b4:b5)};
  assign y16 = {{({(p7>>>a5)}+(b4===a4)),({{a5,p2,a5}}^{p7,a1})}};
  assign y17 = (((5'd27)<(p6^~b2))|((p9!=b3)>>(a0>b3)));
endmodule
