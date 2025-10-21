// テキスト入力
void keyTyped() {
    if (!page.equals("name")) return;
    // Enter/Return は keyPressed 側で処理するのでここでは追加しない
    if (key == ENTER || key == RETURN) return;
    if (key == BACKSPACE) return;
    // 普通の文字を追加
    currentInput += key;
}

// Enter と Backspace の処理
void keyPressed() {
    if (!page.equals("name")) return;
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
            // 全員分入力したら次の画面へ（ここではタイトルに戻す）
            if (nameIndex >= member) {
                page = "all_member";
            }
        }
    }
}