// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

module ram_rw_control
(
	input 	wire			clk_25m,		//�ⲿ����25MHzʱ���ź�
	input 	wire			sys_rst_n,		//�ⲿ���븴λ�źţ��͵�ƽ��Ч
	input 	wire			rx_int,		
	input	wire	[7:0]	rx_data,
	output	wire			ram_rw_ce,
	output 	wire	[7:0]	ram_output,
	output	wire			led			
);

//-------------------------------------
//����������ϱ�־λ
reg		rx_int0,rx_int1,rx_int2;			//rx_int�źżĴ�������׽���˲���
wire	neg_rx_int;							//rx_int�½��ر�־λ
//-------------------------------------
//Double RAM 
reg 	[7:0]	ram_input;
reg 	[7:0]	ram_wr_addr, ram_re_addr;
reg 			ram_rw_ce_r;  				//RAM��дʹ�ܣ�0-->д��1--��
reg 			LED_FLAG;

//-------------------------------------
//����������ϱ�־λ
//-------------------------------------
always @ (posedge clk_25m or negedge sys_rst_n)
begin 
	if(!sys_rst_n) 
	begin
		rx_int0 <= 1'b0;
		rx_int1 <= 1'b0;
		rx_int2 <= 1'b0;
	end
	else 
	begin
		rx_int0 <= rx_int;
		rx_int1 <= rx_int0;
		rx_int2 <= rx_int1;
	end
end

assign neg_rx_int =  ~rx_int1 & rx_int2;    //���յ������ڼ�rx_intʼ��Ϊ�ߵ�ƽ,�����½��ر�ʾ���ݽ�����ϡ����ﲶ׽�������غ�neg_rx_int���߱���һ����ʱ������

//-------------------------------------
//RAM��дʱ�����
//-------------------------------------
// Port a
always @(posedge clk_25m or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		ram_wr_addr <= 0;
		ram_input   <= 0;
		LED_FLAG    <= 1;
	end
	else if(ram_wr_addr<255) 
	begin  									//��RAM��д�������ַ��Ӧ��256��8bit��������
		ram_wr_addr <= ram_wr_addr + 1'b1;
		ram_input   <= ram_input + 1;
	end
	else 
	begin
		ram_wr_addr <= ram_wr_addr;
		ram_input   <= ram_input;
		LED_FLAG    <= 0;
	end
end

// Port b
always @(posedge clk_25m or negedge sys_rst_n)
begin
	if(!sys_rst_n)
	begin
		ram_re_addr <= 0;
		ram_rw_ce_r <= 1'b0;
	end
	else if(neg_rx_int) 
	begin 
	    ram_re_addr <= rx_data;  
		ram_rw_ce_r <= 1'b1;
	end
	else 
	begin
	    ram_re_addr <= 0;
		ram_rw_ce_r <= 1'b0;
	end
end

//-------------------------------------
//����˫��RAM��
//-------------------------------------
 Double_RAM_uut uut_Double_RAM
 ( 

	.dob    (ram_output ),
	.dia    (ram_input  ),
	.addra  (ram_wr_addr),
	.addrb  (ram_re_addr),
	.ceb    (ram_rw_ce  ),
	.clka   (clk_25m    ),
	.clkb   (clk_25m    )
);
	
assign led 		 = LED_FLAG; 
assign ram_rw_ce = ram_rw_ce_r; 
	
endmodule

	
