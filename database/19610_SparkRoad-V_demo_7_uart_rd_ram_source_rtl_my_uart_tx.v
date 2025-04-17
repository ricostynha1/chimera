// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

/////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
module my_uart_tx
(
	input			clk,
	input			rst_n,
	input	[7:0]	rx_data,
	input			rx_int,
	output			uart_tx,
	input			clk_bps,
	output			bps_start
);

//---------------------------------------------------------
reg 	rx_int0,rx_int1,rx_int2;	//rx_int�źżĴ�������׽�½����˲���
wire 	neg_rx_int;					//rx_int�½��ر�־λ

always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
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

assign neg_rx_int =  ~rx_int1 & rx_int2;	//��׽���½��غ�neg_rx_int���߱���һ����ʱ������

//---------------------------------------------------------
reg	[7:0] 	tx_data;		//���������ݵļĴ���
reg 		bps_start_r;
reg 		tx_en;			//��������ʹ���źţ�����Ч
reg	[3:0] 	num;

always @ (posedge clk or negedge rst_n) 
	if(!rst_n) 
    begin
		bps_start_r <= 1'bz;
		tx_en 		<= 1'b0;
		tx_data 	<= 8'd0;
	end
	else if(neg_rx_int) 
    begin		                    //����������ϣ�׼���ѽ��յ������ݷ���ȥ
		bps_start_r <= 1'b1;
		tx_data 	<= rx_data;		//�ѽ��յ������ݴ��뷢�����ݼĴ���
		tx_en 		<= 1'b1;		//���뷢������״̬��
	end
	else if(num == 4'd10) 
    begin		                    //���ݷ�����ɣ���λ
		bps_start_r <= 1'b0;
		tx_en		<= 1'b0;
	end

assign bps_start = bps_start_r;

//---------------------------------------------------------
reg uart_tx_r;

always @ (posedge clk or negedge rst_n)
	if(!rst_n) 
    begin
		num 		<= 4'd0;
		uart_tx_r 	<= 1'b1;
	end
	else if(tx_en) 
    begin
		if(clk_bps)	
        begin
			num <= num+1'b1;
			case (num)
				4'd0: uart_tx_r <= 1'b0; 		//������ʼλ
				4'd1: uart_tx_r <= tx_data[0];	//����bit0
				4'd2: uart_tx_r <= tx_data[1];	//����bit1
				4'd3: uart_tx_r <= tx_data[2];	//����bit2
				4'd4: uart_tx_r <= tx_data[3];	//����bit3
				4'd5: uart_tx_r <= tx_data[4];	//����bit4
				4'd6: uart_tx_r <= tx_data[5];	//����bit5
				4'd7: uart_tx_r <= tx_data[6];	//����bit6
				4'd8: uart_tx_r <= tx_data[7];	//����bit7
				4'd9: uart_tx_r <= 1'b1;		//���ͽ���λ
			 	default: uart_tx_r <= 1'b1;
			endcase
		end
		else if(num == 4'd10)
                num <= 4'd0;		//��λ
	end

assign uart_tx = uart_tx_r;

endmodule


