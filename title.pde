void title() { //タイトル画面
    float buttonX = width / 2 - 200;
    float buttonY = height / 2 + 50;
    float buttonW = 400;
    float buttonH = 100;
    
    //タイトル
    textSize(128);
    fill(225);
    text("ゲームタイトル", width / 2, height / 2);
    
    //STARTの文字
    textSize(64);
    fill(225);
    text("PUSH ENTER TO START", width / 2, height / 2 + 140);
}