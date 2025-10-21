String gameState = "showCard"; // ゲームの状態管理用
int currentCard = 0;          // 現在のカード番号
int selectedPlayer = 0;

int cardw = 800; 
int cardh = 400;
int letterSize = 60;

float stateStartMillis = 0;

void gameSystem() {
    switch(gameState) {
        case "showCard" : //カードを表示
            displayCurrentCard();
            break;
        
        case "minigame" : //ミニゲーム画面表示（仮）
            displayMinigame();
            break;
        
        case "selectPlayer" : //プレイヤー選択画面
            displayPlayerSelection();
            break;
        
        case "result" : //カード配布結果表示（仮）
            textAlign(CENTER, CENTER);
            text("Press ENTER to continue", width / 2, height / 3);
            break;
        
        case "gameEnd" : //ゲーム終了画面
            displayGameEnd();
            break;
    }
}

void setGameState(String s) {
    gameState = s;
    stateStartMillis = millis(); // 状態開始時刻を記録
}

void displayCurrentCard() {
    textAlign(CENTER, CENTER);
    
    // カードの表示
    cards[currentCard].display(
        width / 2 - cardw / 2,    // x座標（中央）
        height / 3 - cardh / 2 - 50,   // y座標（上から1/3を中央とする）
        cardw, cardh,         // サイズ
        letterSize            // 文字サイズ
       );
    
    textSize(32);
    fill(225);
    text("PRESS ENTER to miniGAME", width / 2, height * 2 / 3 - 100);
}

void displayMinigame() {
    textAlign(CENTER, CENTER);
    fill(225);
    if (cards[currentCard].type == 0) {
        gGames[currentgGameIndex].display(width / 2, height / 4 - 100, 45, 60);
        if (millis() - stateStartMillis > 10000) {
            textSize(40);
            text("ヒント：" + gGames[currentgGameIndex].hint, width / 2, height * 2 / 3 - 150);
        }
    } else {
        dGames[currentdGameIndex].display(width / 2, height / 4 - 100, 45, 60);
    }
    textSize(32);
    text("PRESS ENTER to NEXT", width / 2, height * 2 / 3 - 60);
}

void displayPlayerSelection() {
    cards[currentCard].display(
        width / 4 - 500 / 2,    // x座標（中央）
        height / 3 - 250 / 2,   // y座標（上から1/3を中央とする）
        500, 250,         // サイズ
        40            // 文字サイズ
       );
    
    textAlign(CENTER, CENTER);
    textSize(60);
    fill(225);
    text("受け取るプレイヤーを選択", width / 4 * 3 - 50, height / 4 - 150);
    
    textSize(30);
    text("Press player number", width / 4 * 3, height / 3 * 2 - 70);
    
    textSize(40);
    textAlign(LEFT, CENTER);
    for (int i = 0; i < member; i++) {
        text((i + 1) + ": " + name[i], width * 2 / 3, height / 4 - 30 + i * 60);
    }
}

void displayGameEnd() {
    textAlign(CENTER, CENTER);
    textSize(64);
    fill(225);
    text("ゲーム終了！", width / 2, height / 2);
}

void giveCardToPlayer(int playerIndex) {
    // プレイヤーの手札配列が未初期化なら初期化
    if (playerCards == null) {
        playerCards = new Card[member][20]; // 各プレイヤー最大20枚まで
    }
    
    // カードを追加（最初の空きスロットを探す）
    for (int i = 0; i < 20; i++) {
        if (playerCards[playerIndex][i] == null) {
            playerCards[playerIndex][i] = cards[currentCard];
            if (cards[currentCard].command == "つま先立ち\nもしくは\nつま先だけ地面につける") {
                playerCards[playerIndex][i].command = "つま先立ち";  
            } else if (cards[currentCard].command == "片足立ち\nもしくは\n片足浮かせる") {
                playerCards[playerIndex][i].command = "片足立ち";
            }
            break;
        }
    }
}