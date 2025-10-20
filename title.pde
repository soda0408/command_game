void title() {
    //タイトル
    textSize(128);
    fill(225);
    text("ゲームタイトル", width / 2, height / 2);
    
    //STARTボタン
    fill(75, 140, 175);
    stroke(225);
    strokeWeight(4);
    rect(width / 2 - 200, height / 2 + 100, 400, 100, 20);
    
    //STARTの文字
    textSize(64);
    fill(225);
    text("START", width / 2, height / 2 + 170);
}