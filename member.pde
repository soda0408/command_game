void member() { //人数選択画面
    textSize(96);
    fill(225);
    text("人数を選択してください", width / 2, height / 2);
    
    stroke(225);
    strokeWeight(4);
    
    //マウスが被っているかどうか
    if (mouseX >= button4X && mouseX <= button4X + mbuttonW && 
        mouseY >= mbuttonY && mouseY <= mbuttonY + mbuttonH) {
        fill(100, 165, 200); //マウスが重なっている時の色
        button4();
        fill(75, 140, 175); //通常時の色
        button5();
    } else if (mouseX >= button5X && mouseX <= button5X + mbuttonW && 
        mouseY >= mbuttonY && mouseY <= mbuttonY + mbuttonH) {
        fill(75, 140, 175); //通常時の色
        button4();
        fill(100, 165, 200); //マウスが重なっている時の色
        button5();
    } else{
        fill(75, 140, 175); //通常時の色
        button4();
        button5();
    }
    
    //ボタンのテキスト
    textSize(64);
    fill(225);
    text("4人", width / 2 - mmargin - mbuttonW / 2, mbuttonY + 70);
    text("5人", width / 2 + mmargin + mbuttonW / 2, mbuttonY + 70);
}

void button4() { //4人用ボタン
    rect(button4X, mbuttonY, mbuttonW, mbuttonH, 20); 
}

void button5() { //5人用ボタン
    rect(button5X, mbuttonY, mbuttonW, mbuttonH, 20); 
}