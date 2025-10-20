void member() {
    //人数選択画面
    background(75, 140, 175);
    
    textSize(96);
    fill(225);
    text("人数を選択してください", width / 2, height / 4);
    
    //人数表示
    textSize(128);
    fill(225);
    text(member + "人", width / 2, height / 2);
    
    //＋ボタン
    fill(75, 140, 175);
    stroke(225);
    rect(width / 2 + 150, height / 2 + 100, 100, 100);
    textSize(64);
    fill(225);
    text("+", width / 2 + 200, height / 2 + 170);
    
    //－ボタン
    fill(75, 140, 175);
    stroke(225);
    rect(width / 2 - 250, height / 2 + 100, 100, 100);
    textSize(64);
    fill(225);
    text("-", width / 2 - 200, height / 2 + 170);
}