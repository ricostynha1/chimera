module expression_00791(a0, a1, a2, a3, a4, a5, b0, b1, b2, b3, b4, b5, y);
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

  localparam [3:0] p0 = (&{3{(5'sd9)}});
  localparam [4:0] p1 = (-2'sd0);
  localparam [5:0] p2 = {4{(2'd1)}};
  localparam signed [3:0] p3 = (^((((4'sd0)?(2'sd1):(3'd5))>=(|(5'd31)))^~(^(^((3'd1)?(-4'sd1):(2'd1))))));
  localparam signed [4:0] p4 = (((3'sd1)!=(3'd0))^((-5'sd1)<(-2'sd1)));
  localparam signed [5:0] p5 = (((4'd9)?(-5'sd9):(-3'sd2))!=(((3'd2)?(4'sd3):(5'd10))>>(~|(4'd7))));
  localparam [3:0] p6 = (((+(-4'sd7))?((4'd5)||(-5'sd13)):(5'd21))>=((-3'sd2)^(!(-5'sd14))));
  localparam [4:0] p7 = ((-4'sd7)||{(((3'sd1)?(4'sd2):(4'd12))>>>((-2'sd1)!==(2'd0)))});
  localparam [5:0] p8 = (((((5'd27)<=(5'd20))|((2'd1)>(3'd4)))|((5'sd1)?(5'sd0):(2'sd1)))!==((((2'd1)?(4'd2):(2'sd0))<<<((-3'sd3)<<<(-2'sd0)))&&(((4'd7)>(-2'sd0))+((4'sd5)?(-5'sd0):(-2'sd1)))));
  localparam signed [3:0] p9 = ({((4'd14)===((3'sd2)<(5'd16)))}?(~|(5'sd1)):((3'sd3)?((3'd5)>>(5'sd13)):(6'd2 ** (2'd3))));
  localparam signed [4:0] p10 = (((!(!(-4'sd1)))<<(|(|(3'd5))))-(((2'sd1)<<(3'd2))&(|((5'sd2)!==(3'd0)))));
  localparam signed [5:0] p11 = (3'sd2);
  localparam [3:0] p12 = (4'd2);
  localparam [4:0] p13 = (-(+(&(^(&(~(-(+(~|(-(!(3'sd0))))))))))));
  localparam [5:0] p14 = (~&((((3'd2)>=(5'd2))>={2{(-4'sd4)}})?((3'd7)||((2'd3)?(4'd5):(3'sd0))):({3{(2'd3)}}^~(~&(2'sd0)))));
  localparam signed [3:0] p15 = (-(3'sd1));
  localparam signed [4:0] p16 = ((-3'sd3)|(-3'sd1));
  localparam signed [5:0] p17 = (|{4{{(-4'sd0),(2'd1)}}});

  assign y0 = $signed({1{(((p1<p7)-(3'sd2))<((p9>>>p9)&(p1||p10)))}});
  assign y1 = ((p7&b3)>>{p8});
  assign y2 = ((2'd1)?{p6,p17,p0}:(p0?p14:a0));
  assign y3 = ((($signed(b2)>={p4,b1,a0}))^~({1{b2}}>>>(^b0)));
  assign y4 = (({1{(p15||p12)}}>>>{2{a2}})^~(|(-(p8?p14:a1))));
  assign y5 = (!(&{2{(~{{2{b2}},(+(+a0))})}}));
  assign y6 = ({(4'd10),{$signed({p16}),(4'sd4)}});
  assign y7 = ((-((^(-2'sd1)))));
  assign y8 = (($unsigned(a5)>(2'd1))==((b4>b0)<<(4'sd7)));
  assign y9 = $unsigned((5'sd3));
  assign y10 = $unsigned(b3);
  assign y11 = (2'd3);
  assign y12 = (~^{b3});
  assign y13 = $unsigned((3'd1));
  assign y14 = (-(p1^~b5));
  assign y15 = ((3'd1)<((b3>>p1)>>(5'd26)));
  assign y16 = ((-4'sd5)*$unsigned((a3+a2)));
  assign y17 = {{(~|{1{{4{p14}}}}),{(!{p14}),(b4?a4:b5)},{4{{b3}}}}};
endmodule
