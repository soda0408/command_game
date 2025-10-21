String gameState = "showCard"; // ゲームの状態管理用
int currentCard = 0;          // 現在のカード番号
int currentPlayer = 0;        // 現在のプレイヤー番号

void gameSystem() {
    switch(gameState) {
        case "showCard":
            // カードを表示
            displayCurrentCard();
            if (keyPressed && key == ENTER) {
                gameState = "minigame";
            }
            break;
            
        case "minigame":
            // ミニゲーム画面表示（仮）
            displayMinigame();
            if (keyPressed && key == ENTER) {
                gameState = "selectPlayer";
            }
            break;
            
        case "selectPlayer":
            // プレイヤー選択画面
            displayPlayerSelection();
            // 数字キー1-5で選択（プレイヤー数に応じて）
            if (keyPressed && key >= '1' && key <= char('0' + member)) {
                int selectedPlayer = key - '1'; // 0-based indexに変換
                giveCardToPlayer(selectedPlayer);
                currentCard++;
                if (currentCard >= cards.length) {
                    gameState = "gameEnd";
                } else {
                    gameState = "showCard";
                }
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
    textSize(64);
    fill(225);
    text("カード", width/2, height/4);
    
    // カードの表示
    cards[currentCard].display(
        width/2 - cardw/2,    // x座標（中央）
        height/2 - cardh/2,   // y座標（中央）
        cardw, cardh,         // サイズ
        letterSize            // 文字サイズ
    );
    
    textSize(32);
    text("Press ENTER to continue", width/2, height*3/4);
}

void displayMinigame() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("ミニゲーム", width/2, height/2);
    textSize(32);
    text("Press ENTER to continue", width/2, height*3/4);
}

void displayPlayerSelection() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("誰がカードを受け取りますか？", width/2, height/4);
    
    textSize(48);
    for (int i = 0; i < member; i++) {
        text((i+1) + ": " + name[i], width/2, height/2 + i*60);
    }
}

void displayGameEnd() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("ゲーム終了！", width/2, height/2);
}

void giveCardToPlayer(int playerIndex) {
    // カードをプレイヤーに付与する処理
    // 今後実装
}