void title() { //タイトル画面
    float buttonX = width / 2 - 200;
    float buttonY = height / 2 + 50;
    float buttonW = 400;
    float buttonH = 100;
    
    //タイトル
    textSize(128);
    fill(225);
    text("ゲームタイトル", width / 2, height / 2);
    
    //マウスが被っているかどうか
    if (mouseX >= buttonX && mouseX <= buttonX + buttonW && 
        mouseY >= buttonY && mouseY <= buttonY + buttonH) {
        fill(100, 165, 200);  // マウスが重なっている時は少し明るい色
    } else {
        fill(75, 140, 175);   // 通常時の色
    }
    
    //STARTボタン
    stroke(225);
    strokeWeight(4);
    rect(buttonX, buttonY, buttonW, buttonH, 20);
    
    //STARTの文字
    textSize(64);
    fill(225);
    text("START", width / 2, height / 2 + 140);
}