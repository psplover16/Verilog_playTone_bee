module playtone (
input clk,
output reg [3:0] mode, // 音頻種類
output reg [4:0] state_Type
);

parameter time_clk = 4000000; // 4MHZ
parameter voice_delay_multiple = 100; // voice_delay要把它存起來，但不能為小數，所以放大100倍存起來，之後再縮小
parameter length_Voice = 61;  // 音頻長度   

reg [3:0] voice_type [length_Voice -1 :0]; // (length_Voice-1)個 長度為4位元 資料
reg [5:0] voice_delay [length_Voice -1 :0]; // (length_Voice-1)個 長度為  12位元 資料


  initial begin
    // 
    voice_type[0] = 8;
    voice_type[1] = 1;
    voice_type[2] = 8;
    voice_type[3] = 2;
    voice_type[4] = 8;
    voice_type[5] = 1;
    voice_type[6] = 8;
    voice_type[7] = 2;
    voice_type[8] = 8;
    voice_type[9] = 1;
    voice_type[10] = 8;
    voice_type[11] = 0;
    voice_type[12] = 8;
    voice_type[13] = 1;
    voice_type[14] = 8;
    voice_type[15] = 2;
    voice_type[16] = 8;
    voice_type[17] = 3;
    voice_type[18] = 8;
    voice_type[19] = 1;
    voice_type[20] = 8;
    voice_type[21] = 2;
    voice_type[22] = 8;
    voice_type[23] = 3;
    voice_type[24] = 8;
    voice_type[25] = 3;
    voice_type[26] = 8;
    voice_type[27] = 4;
    voice_type[28] = 8;
    voice_type[29] = 3;
    voice_type[30] = 8;
    voice_type[31] = 4;
    voice_type[32] = 8;
    voice_type[33] = 3;
    voice_type[34] = 8;
    voice_type[35] = 2;
    voice_type[36] = 8;
    voice_type[37] = 1;
    voice_type[38] = 8;
    voice_type[39] = 0;
    voice_type[40] = 8;
    voice_type[41] = 5;
    voice_type[42] = 8;
    voice_type[43] = 6;
    voice_type[44] = 8;
    voice_type[45] = 5;
    voice_type[46] = 8;
    voice_type[47] = 6;
    voice_type[48] = 8;
    voice_type[49] = 5;
    voice_type[50] = 8;
    voice_type[51] = 4;
    voice_type[52] = 8;
    voice_type[53] = 3;
    voice_type[54] = 8;
    voice_type[55] = 2;
    voice_type[56] = 8;
    voice_type[57] = 1;
    voice_type[58] = 8;
    voice_type[59] = 0;
    voice_type[60] = 8;


    
    // 初始值是浮點數的 0.15、0.45 和 1.75，乘以 1000 以轉換成整數
    voice_delay[0] = 10;// 0.15秒 * 100

    voice_delay[1] = 40;// 0.15 * 100
    voice_delay[2] = 10;// 0.15 * 100
    voice_delay[3] = 40;// 0.15 * 100
    voice_delay[4] = 10;// 0.15 * 100
    voice_delay[5] = 40; // 0.45 * 100
    voice_delay[6] = 10;// 0.15 * 100
    voice_delay[7] = 40; // 0.45 * 100
    voice_delay[8] = 10;// 0.15 * 100
    voice_delay[9] = 40;// 0.15 * 100
    voice_delay[10] = 10;// 0.15 * 100
    voice_delay[11] = 60; // 0.45 * 100
    voice_delay[12] = 10;// 0.15 * 100
    voice_delay[13] = 40;
    voice_delay[14] = 10;
    voice_delay[15] = 40; 
    voice_delay[16] = 10;
    voice_delay[17] = 80;
    voice_delay[18] = 10; 
    voice_delay[19] = 40;
    voice_delay[20] = 10;
    voice_delay[21] = 40;
    voice_delay[22] = 10;
    voice_delay[23] = 80;  
    voice_delay[24] = 10;
    voice_delay[25] = 40;  
    voice_delay[26] = 10;
    voice_delay[27] = 40;  
    voice_delay[28] = 10;

    voice_delay[29] = 40;  
    voice_delay[30] = 10;
    voice_delay[31] = 40;  
    voice_delay[32] = 10;  
    voice_delay[33] = 40;  
    voice_delay[34] = 10;
    voice_delay[35] = 40;
    voice_delay[36] = 10;  
    voice_delay[37] = 40;  
    voice_delay[38] = 10;

    voice_delay[39] = 80;
    voice_delay[40] = 10;

    voice_delay[41] = 40; 
    voice_delay[42] = 10;
    voice_delay[43] = 40;
    voice_delay[44] = 10; 
    voice_delay[45] = 40;
    voice_delay[46] = 10;
    voice_delay[47] = 40;
    voice_delay[48] = 10;
    voice_delay[49] = 40;  
    voice_delay[50] = 10;

    voice_delay[51] = 60;  
    voice_delay[52] = 10;

    voice_delay[53] = 40;  
    voice_delay[54] = 10;
    voice_delay[55] = 40;  
    voice_delay[56] = 10;
    voice_delay[57] = 80;  
    voice_delay[58] = 10;  
    voice_delay[59] = 80;  
    voice_delay[60] = 80;

  end


reg [22:0] count_Voice;


always @(posedge clk)begin
if(count_Voice == 0)begin
  state_Type = state_Type + 1;
  if(state_Type > length_Voice -1)begin
    state_Type = 0;
  end
  // 
  mode = voice_type[state_Type];
  count_Voice =  voice_delay[state_Type] * time_clk / voice_delay_multiple;
  // 
end
count_Voice = count_Voice - 1;


end




endmodule