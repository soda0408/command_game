String gameState = "showCard"; // ゲームの状態管理用
int currentCard = 0;          // 現在のカード番号
int selectedPlayer = 0;

int cardw = 800; 
int cardh = 400;
int letterSize = 60;

float stateStartMillis = 0;

String playerCommands[][]; //各プレイヤーの手札

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
    // プレイヤーの手札配列が未初期化なら初期化
    if (playerCommands == null) {
        playerCommands = new String[member][20]; // 各プレイヤー最大20枚まで
    }
    
    // カードを追加（最初の空きスロットを探す）
    for (int i = 0; i < 20; i++) {
        if (playerCommands[playerIndex][i] == null) {
            if (cards[currentCard].command == "つま先立ち\nもしくは\nつま先だけ地面につける") {
                playerCommands[playerIndex][i] = "つま先立ち";  
            } else if (cards[currentCard].command == "片足立ち\nもしくは\n片足浮かせる") {
                playerCommands[playerIndex][i] = "片足立ち";
            } else{
                playerCommands[playerIndex][i] = cards[currentCard].command;
            }
            break;
        }
    }
}