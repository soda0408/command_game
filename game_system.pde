String gameState = "showCard"; // ゲームの状態管理用
int currentCard = 0;          // 現在のカード番号
int currentPlayer = 0;        // 現在のプレイヤー番号
int selectedPlayer = 0;

int cardw = 200; 
int cardh = 150;
int letterSize = 40;

int plcardw = 40;
int plcardh = 30;
int plletterSize = 12;

void gameSystem() {
    switch(gameState) {
        case "showCard":
            // カードを表示
            displayCurrentCard();
            break;
        
        case"minigame":
        // ミニゲーム画面表示（仮）
        displayMinigame();
        break;
        
        case "selectPlayer":
            // プレイヤー選択画面
            displayPlayerSelection();
            if (currentCard >= cards.length) {
                gameState = "gameEnd";
                } else {
                gameState = "showCard";
                }
            break;
        
        case "gameEnd":
            // ゲーム終了画面
            displayGameEnd();
            break;
    }
}

void displayCurrentCard() {
    textAlign(CENTER, CENTER);
    
    // カードの表示
    cards[currentCard].display(
        width / 2 - cardw / 2,    // x座標（中央）
        height / 2 - cardh / 2,   // y座標（中央）
        cardw, cardh,         // サイズ
        letterSize            // 文字サイズ
       );
    
    textSize(32);
    text("PRESS ENTER to miniGAME", width / 2, height * 3 / 4);
}

void displayMinigame() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("ミニゲーム", width / 2, height / 2);
    textSize(32);
    text("Press ENTER to continue", width / 2, height * 3 / 4);
}

void displayPlayerSelection() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("誰がカードを受け取りますか？", width / 2, height / 4);
    
    textSize(48);
    for (int i = 0; i < member; i++) {
        text((i + 1) + ": " + name[i], width / 2, height / 2 + i * 60);
    }
}

void displayGameEnd() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("ゲーム終了！", width / 2, height / 2);
}

void giveCardToPlayer(int playerIndex) {
    // カードをプレイヤーに付与する処理
    // 今後実装
}