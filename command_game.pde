String page = "title"; //ページ遷移用
int member = 0; //人数

PFont font;

void setup() {
    fullScreen();
    background(75, 140, 175);
    
    font = createFont("Meiryo", 64, true);
}

void draw() {
    textFont(font);
    textAlign(CENTER, BOTTOM);
    
    switch(page) { // pageの切替
        case "title":
            title();
            break;
    }
}