module pauseButton(
   input clk,
   input button,
   output reg play
);

parameter bounce = 20; // 防彈跳係數
reg [bounce-1:0] cnt; // 計時器-彈跳

// reg turn; // 目前的狀態

// reg button_Init; //防止亞穩態
// always@(posedge clk)begin
//     //防止亞穩態
//     // button_syn0<=button;
//     // button_syn1<=button_syn0;
//     // button_Init<=button_syn1;
//     // button_Init <= button;
// end

always @(posedge clk) begin
    if(!button)begin // 沒按下按鈕，輸入信號為歸0
        cnt <= 0;
    end   
    else if(!cnt[bounce-1])begin  // 按下按鈕才會跑這段，計數器開始+1
        cnt <= cnt + 1;
    end
end

// 計數器有加滿，才會轉換狀態
always @(posedge cnt[bounce-1])begin
    play <= ~play;
end


// reg[10:0] freq;
// always@(posedge clk) freq=freq+1;

// always @(posedge freq[10])begin
//     play <= turn;
//     // if(turn==1)begin

//     // end
//     // else begin

//     // end
// end

endmodule