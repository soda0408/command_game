Card gCards[]; //バフカード
Card dCards[]; //デバフカード
Card cards[]; //山札
Card playerCards[][]; //プレイヤーの手札用、[0][]:player1、[1][]:player2、...

class Card{
    String command;
    int type;
    //0:バフ、1:デバフ＋右手、2:デバフ＋左手、3:手が関係ないデバフ、4:一発系
    
    //コンストラクタ
    Card(String s, int t) {
        this.command = s;
        this.type = t;
    }    
    
    //カードを表示
    void display(int x, int y, int w, int h, int letterSize) {
        if (type ==  0) {
            stroke(100,160,220);
            strokeWeight(3);
            fill(225);
            rect(x, y, w, h);
            
            fill(100,160,220);
            textSize(letterSize);
            text(command, x + cardw / 2, y + cardh / 2); 
        } else {
            stroke(180,50,70);
            strokeWeight(3);
            fill(225);
            rect(x, y, w, h);
            
            fill(180,50,70);
            textSize(letterSize);
            text(command, x + cardw / 2, y + cardh / 2); // カードの中央にテキストを表示            
        }        
    }
}

void cardSetUp() {
    //カードの初期化
    gCards = new Card[2]; //バフ2枚
    dCards = new Card[18]; //デバフ16枚
    
    //バフカードの設定
    gCards[0] = new Card("制限1つ解除", 0);
    gCards[1] = new Card("制限1つ解除", 0);
    
    //デバフカードの設定
    dCards[0] = new Card("おしりをつける", 3);
    dCards[1] = new Card("片足立ち\n片足浮かせる", 3);
    dCards[2] = new Card("膝を曲げる", 3);
    dCards[3] = new Card("つま先立ち\nつま先だけ地面につける", 3);
    dCards[4] = new Card("右手を腰にあてる", 1);
    dCards[5] = new Card("左手を腰にあてる", 2);
    dCards[6] = new Card("腕を交差させる", 3);
    dCards[7] = new Card("右手を挙げる", 1);
    dCards[8] = new Card("左手を挙げる", 2);
    dCards[9] = new Card("右手で地面を触る", 1);
    dCards[10] = new Card("左手で地面を触る", 2);
    dCards[11] = new Card("その場で1回ジャンプ", 4);
    dCards[12] = new Card("その場で2回ジャンプ", 4);
    dCards[13] = new Card("その場で3回ジャンプ", 4);
    dCards[14] = new Card("目を10秒つぶる", 4);
    dCards[15] = new Card("その場でターン", 4);
    dCards[16] = new Card("膝を曲げて伸ばす", 4);
    dCards[17] = new Card("両肩を2回ずつまわす", 4);
    
    //山札の初期化
    cards = new Card[gCards.length + dCards.length];
    
    //全カードを順番に入れる
    int index = 0;
    for (int i = 0; i < gCards.length; i++) {
        cards[index] = gCards[i];
        index++;
    }
    for (int i = 0; i < dCards.length; i++) {
        cards[index] = dCards[i];
        index++;
    }
    
    //カードをランダムに並び替え
    for (int i = cards.length - 1; i > 0; i--) {
        int j = (int)random(i + 1);
        //カードの交換
        Card temp = cards[i];
        cards[i] = cards[j];
        cards[j] = temp;
    } 
    
    playerCards = new Card[member][cards.length]; //人数分、最大枚数分を用意
}
