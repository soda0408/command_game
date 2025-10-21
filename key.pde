// テキスト入力
void keyTyped() {
    // Enter/Return は keyPressed 側で処理
    if (key == ENTER || key == RETURN) return;
    if (key == BACKSPACE) return;
    
    switch(page) {
        case"name":
        // 普通の文字を追加
        currentInput += key;
        break;
    }
}

void keyPressed() {
    switch(page) {
        case"title":
        if (key == ENTER || key == RETURN) {
            page = "member";
        }
        break;
        
        case"member":
        // ← 左矢印で4人、→ 右矢印で5人を選択
        if (keyCode == LEFT) {
            member = 4;
        } else if (keyCode == RIGHT) {
            member = 5;
        } else if (member > 0 && (key == ENTER || key == RETURN)) {
            name = new String[member];
            nameIndex = 0;
            currentInput = "";
            page = "name";
        }
        break;        
        
        case"name":
        if (key == BACKSPACE) {
            if (currentInput.length() > 0) {
                currentInput = currentInput.substring(0, currentInput.length() - 1);
            }
        } else if (key == ENTER || key == RETURN) {
            // 空文字でなければ保存して次へ
            if (currentInput.length() > 0 && nameIndex < member) {
                name[nameIndex] = currentInput;
                nameIndex++;
                currentInput = "";
                // 全員分入力したらメンバー確認画面へ
                if (nameIndex >= member) {
                    page = "all_member";
                }
            }
        }
        break;
        
        case"all_member":
        if (key == ENTER || key == RETURN) {
            page = "game";
        }
        break;
        
        case"game":
        switch(gameState) {
            case "showCard" : //カードを表示
                if (key == ENTER || key == RETURN) {
                    setGameState("minigame");
                }
                break;
            case "minigame" : //ミニゲーム画面表示（仮）
                if (key == ENTER || key == RETURN) {
                    setGameState("selectPlayer");
                }
                break;
            case "selectPlayer" : //プレイヤー選択画面
                if (keyPressed && key >= '1' && key <= char('0' + member)) {
                    selectedPlayer = key - '1';
                    giveCardToPlayer(selectedPlayer);
                    currentCard++;
                    setGameState("result");
                }
                break;
            
            case "result" : //結果表示画面
                if (key == ENTER || key == RETURN) {
                    if (currentCard >= cards.length) {
                        setGameState("gameEnd");
                    } else {
                        setGameState("showCard");
                    }
                }
                break;       
        }
        break;
    }
}