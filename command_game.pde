String page = "title"; //ページ遷移用

String name[]; //プレイヤーネーム用
String currentInput = ""; //現在入力中の名前保存用

int member = 0; //人数
int nameIndex = 0; //名前配列の場所用

//カード関連
int cardw = 200; 
int cardh = 150;
int letterSize = 40;
int plcardw = 40;
int plcardh = 30;
int plletterSize = 12;
Card gCards[]; //バフカード
Card dCards[]; //デバフカード
Card cards[]; //山札
Card playerCards[][]; //プレイヤーの手札用、[0][]:player1、[1][]:player2、...

//memberページ
float mbuttonW = 200;
float mbuttonH = 100;
float mbuttonY;
float mmargin = 50; //ボタン間の間隔
float button4X;
float button5X;

PFont font;

void setup() {
    fullScreen();
    font = createFont("Meiryo", 64, true);
    
    mbuttonY = height / 2 + 100;
    button4X = width / 2 - mbuttonW - mmargin;
    button5X = width / 2 + mmargin;
    
    cardSetUp();
}

void draw() {
    background(100);
    textFont(font);
    textAlign(CENTER, BOTTOM);
    
    switch(page) { // pageの切替
        case "title":
            title();
            break;
        case "member":
            member();
            break;
        case "name":
            name();
            break;
        case "all_member":
            all_member();
            break;
        case "game":
            game_screen();
            break;
    }
}