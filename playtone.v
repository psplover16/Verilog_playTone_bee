module playtone (
input clk,
// input button, // 暫停按鈕引用處
// output playStatus, // 暫停按鈕引用處
output reg [2:0] mode, // 音頻種類
output reg [1:0] HL // 音頻高低
);

parameter time_clk = 4000000; // 4MHZ
parameter speed = 0.5; // 播放速度，每節為2拍
parameter delayTime = 0.2;

parameter length_Voice = 66;  // 音頻長度,直接看 state_Type 最大值
reg [8:0] state_Type; // 播放到哪個旋律

reg [21:0] count_Voice; // 作為播放音樂的倒數器

// 此處為 暫停按鈕引用處
// pauseButton a1(
//    .clk(clk),
//    .button(button),
//    .play(playStatus)
// );
// -------------------------------------------------------------------------------
// 0表示沒有聲音
// case(mode)
//     3'b001: freq = do; // 1
//     3'b010: freq = re; // 2
//     3'b011: freq = mi; // 3
//     3'b100: freq = fa; // 4
//     3'b101: freq = so; // 5
//     3'b110: freq = la; // 6
//     3'b111: freq = si; // 7
// endcase
// case (HL)
    // 2'b00: freq = freq * 2; // 低8度
    // 2'b01: freq = freq;  // 原音
    // 2'b11: freq = freq / 2; // 高8度
// endcase



reg needDelay;



always @(posedge clk)begin
  // 播放某頻率的時間為0時，播放下一個頻率，並刷新要播放頻率的種類與時間
  if(count_Voice == 0)begin
    if(state_Type > length_Voice)begin  // 若播放到底了，則歸0
      state_Type = 0;
    end
    if(needDelay == 1)begin
      needDelay = 0;
      mode = 0;
      HL = 1;
      count_Voice = delayTime * time_clk * speed;
    end else begin
      case(state_Type)  // 樂譜，更新播放頻率與播放時間，(秒
        0:begin
          mode = 0;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        // 請從1開始，0作為重置用
        1:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        2:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        3:begin
          mode = 3;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        4:begin
          mode = 4;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        5:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        6:begin
          mode = 2;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        7:begin
          mode = 1;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        8:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        9:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        10:begin
          mode = 4;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        11:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        12:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        13:begin
          mode = 5;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        14:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        15:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        16:begin
          mode = 3;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        17:begin
          mode = 4;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        18:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        19:begin
          mode = 2;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        20:begin
          mode = 1;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        21:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        22:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        23:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        // 
        24:begin
          mode = 3;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        25:begin
          mode = 0;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        26:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        27:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        28:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        29:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        // 
        30:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        31:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end

        32:begin
          mode = 4;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        33:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        34:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        35:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        36:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        // 
        37:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        38:begin
          mode = 4;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end

        39:begin
          mode = 5;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        40:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        41:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        42:begin
          mode = 3;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        43:begin
          mode = 4;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        44:begin
          mode = 2;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        45:begin
          mode = 2;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end
        // 
        46:begin
          mode = 1;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end

        47:begin
          mode = 3;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        48:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        49:begin
          mode = 5;
          HL = 1;
          count_Voice = 0.5 * time_clk * speed;
        end
        // 
        50:begin
          mode = 1;
          HL = 1;
          count_Voice = 1 * time_clk * speed;
        end

        51:begin
          mode = 0;
          HL = 1;
          count_Voice = 2 * time_clk * speed;
        end
        // 
        // 測試音頻/喇叭用
        52:begin
          mode = 1;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        53:begin
          mode = 2;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        54:begin
          mode = 3;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        55:begin
          mode = 4;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        56:begin
          mode = 5;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        57:begin
          mode = 6;
          HL = 0;
          count_Voice = 0.5 * time_clk * speed;
        end
        58:begin
          mode = 7;
          HL = 0;
          count_Voice = 2 * time_clk * speed;
        end
        59:begin
          mode = 1;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        60:begin
          mode = 2;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        61:begin
          mode = 3;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        62:begin
          mode = 4;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        63:begin
          mode = 5;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        64:begin
          mode = 6;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        65:begin
          mode = 7;
          HL = 2;
          count_Voice = 0.5 * time_clk * speed;
        end
        66:begin
          mode = 0;
          HL = 1;
          count_Voice = 2 * time_clk * speed;
        end
      // 
      // 
      endcase
      needDelay = 1;
      state_Type = state_Type + 1; // 播放下一個頻率
    
    end


  end

    count_Voice = count_Voice - 1;
    
end




endmodule