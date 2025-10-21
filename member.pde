void member() { //人数選択画面
    textSize(96);
    fill(225);
    text("人数を選択してください", width / 2, height / 2 - 50);
    textSize(60);
    text("← →キーで選択", width / 2, height / 2 + 50);
    
    stroke(225);
    strokeWeight(4);
    
    //マウスが被っているかどうか
    if (member == 4) {
        fill(160); //マウスが重なっている時の色
        button4();
        fill(100); //通常時の色
        button5();
    } else if (member == 5) {
        fill(100); //通常時の色
        button4();
        fill(160); //マウスが重なっている時の色
        button5();
    } else{
        fill(100); //通常時の色
        button4();
        button5();
    }
    
    //ボタンのテキスト
    textSize(64);
    fill(225);
    text("4人", width / 2 - mmargin - mbuttonW / 2, mbuttonY + 85);
    text("5人", width / 2 + mmargin + mbuttonW / 2, mbuttonY + 85);
}

void button4() { //4人用ボタン
    rect(button4X, mbuttonY, mbuttonW, mbuttonH, 20); 
}

void button5() { //5人用ボタン
    rect(button5X, mbuttonY, mbuttonW, mbuttonH, 20); 
}