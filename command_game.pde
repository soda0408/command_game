String page = "title"; //ページ遷移用

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