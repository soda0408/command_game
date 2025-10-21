String page = "title"; //ページ遷移用

String name[]; //プレイヤーネーム用
String currentInput = ""; //現在入力中の名前保存用

int member = 0; //人数
int nameIndex = 0; //名前配列の場所用

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
    
    mbuttonY = height / 2;
    button4X = width / 2 - mbuttonW - mmargin;
    button5X = width / 2 + mmargin;
}

void draw() {
    background(75, 140, 175);
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
    }
}