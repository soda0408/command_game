//Cardクラス
class Card{
    String command;
    boolean type; //true:バフ、false:デバフ
    
    int cardw;
    int cardh;
    
    //コンストラクタ
    Card(String s, boolean t) {
        this.command = command;
        this.type = type;
    }    
    
    //カードを表示
    void display(int x, int y) {
        if (type) {
            stroke(180,50,70);
            fill(225);
            rect(x, y, cardw, cardh);
        } else {
            stroke(180,50,70);
            fill(225);
            rect(x, y, cardw, cardh);            
        }
    }
    //ボールを動かす関数(メソッド)
    void move() {
    }
    //ボールを跳ね返らせる関数(メソッド)
    void edges() {
    }
}
