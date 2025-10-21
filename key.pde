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
        } else if (key == ENTER || key == RETURN) {
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
    }
}