void mouseClicked() {
    switch(page) { //ページ毎にクリックの判定を作る
        
        case "title" : //タイトル画面の時
            if (mouseX > width / 2 - 200 && mouseX < width / 2 + 200 && mouseY > height / 2 + 100 && mouseY < height / 2 + 200) {
                page = "member";
            }
            break;  
    }
}