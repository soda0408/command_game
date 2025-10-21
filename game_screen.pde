void game_screen() {
    textAlign(LEFT, BOTTOM);
    
    float areaY = height * 2.0 / 3.0;
    float areaH = height / 3.0;
    
    // 名前エリア背景
    noStroke();
    fill(50);
    rect(0, areaY, width, areaH);
    
    int n = max(1, member);
    float slotW = width / (float)n;
    float slotH = areaH * 0.75; // 少し上下余白を残す
    float slotY = areaY + (areaH - slotH) / 2.0;
    float innerPadX = slotW * 0.08; // 左右の余白（テキストの余白に使用）
    float pad = max(12, slotW * 0.03); // 名前表示用の内側余白（左上）
    
    // 縦線で区切る
    stroke(225);
    strokeWeight(2);
    for (int i = 1; i < n; i++) {
        float x = i * slotW;
        line(x, areaY, x, areaY + areaH);
    }
    
    // 各プレイヤーの表示領域
    for (int i = 0; i < n; i++) {
        float baseX = i * slotW;
        
        // プレイヤー名
        fill(225);
        textSize(45);
        String s = "（未入力）";
        if (name != null && i < name.length && name[i] != null && name[i].length() > 0) {
            s = name[i];
        }
        text(s, baseX + innerPadX + pad, slotY + pad);
        
        // プレイヤーの指示表示
        if (playerCommands != null && playerCommands[i] != null) {
            int plletterSize = 30;
            
            for (int j = 0; j < 20; j++) { // 最大20枚まで
                if (playerCommands[i][j] != null) {
                    // カードを表示
                    textSize(plletterSize);
                    text("・" + playerCommands[i][j],
                        baseX,
                        slotY + pad + 40 + j * (plletterSize + 5));
                }
            }
        }
    }
}