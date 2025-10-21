void name() {
    // 見出し
    textSize(72);
    fill(225);
    text("プレイヤーの名前を入力してください", width / 2, height / 2 - 150);
    
    // 進行状況（例: 1 / 4）
    textSize(48);
    fill(225);
    String progress = (nameIndex + 1) + " / " + max(1, member);
    text(progress, width / 2, height / 2 - 80);
    
    // 入力ボックスの描画
    float boxW = width * 0.6;
    float boxH = 120;
    float boxX = (width - boxW) / 2;
    float boxY = height / 2 - boxH / 2;
    
    stroke(225);
    strokeWeight(3);
    fill(100);
    rect(boxX, boxY, boxW, boxH, 12);
    
    // 入力中のテキスト表示
    textSize(56);
    fill(225);
    textAlign(LEFT, CENTER);
    // 左寄せでボックス内に表示するため X を調整
    text(currentInput, boxX + 20, boxY + boxH / 2);
    textAlign(CENTER, BOTTOM); // 元の整列に戻す
    
    // 保存済みの名前一覧（下部に表示）
    textSize(40);
    fill(225);
    float listY = boxY + boxH + 100;
    for (int i = 0; i < (name != null ? name.length : 0); i++) {
        String n = name[i] != null ? name[i] : "（未入力）";
        text((i + 1) + " : " + n, width / 2, listY + i * 60);
    }
    
    // 補足: Enter で確定、Backspace で削除
    textSize(24);
    text("Enterで確定、Backspaceで削除", width / 2, boxY + boxH + 30);
}


void all_member() {
    textSize(64);
    text("このメンバーで始めます", width / 2, height / 2 - 300);
    textSize(64);
    for (int i = 0; i < member; i++) {
        text("Player " + (i + 1) + ": " + name[i], width / 2, height / 2 - 130 + i * 100);
    }
    textSize(32);
    text("PUSH ENTER TO NEXT", width / 2, height / 2 - 130 + member * 100);
}