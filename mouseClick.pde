void mouseClicked() {
    switch(page) { //ページ毎にクリックの判定を作る
        
        case "title" : //タイトル画面の時
            if (mouseX > width / 2 - 200 && mouseX < width / 2 + 200 && mouseY > height / 2 + 50 && mouseY < height / 2 + 150) {
                page = "member";
            }
            break;
        
        case "member" : //人数選択画面の時
            if (mouseX >= button4X && mouseX <= button4X + mbuttonW && 
                mouseY >= mbuttonY && mouseY <= mbuttonY + mbuttonH) {
                member = 4;
                name = new String[member];
                page = "name";
            } else if (mouseX >= button5X && mouseX <= button5X + mbuttonW && 
                mouseY >= mbuttonY && mouseY <= mbuttonY + mbuttonH) {
                member = 5;
                name = new String[member];
                page = "name";
            }
            break; 
    }
}