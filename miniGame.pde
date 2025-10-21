MiniGame gGames[]; //バフ用ゲーム
MiniGame dGames[]; //デバフ用ゲーム

int currentgGameIndex = 0; //現在のバフミニゲーム
int currentdGameIndex = 0; //現在のデバフミニゲーム

int randnum = 0;

class MiniGame{
    String body;
    String hint;
    int type; 
    //0:アナグラム、1:早口言葉
    
    //コンストラクタ
    MiniGame(String b, String hint, int t) {
        this.body = b;
        this.hint = hint;
        this.type = t;
    }    
    
    //ミニゲームを表示
    void display(int x, int y, int qLetter, int bLetter) {
        textAlign(CENTER, CENTER);
        fill(225);
        textSize(qLetter);
        if (type == 0) {
            text("アナグラムを解け！", x, y);
            text("速く解けた人がバフカード獲得！", x, y + qLetter + 10);
        } else if (type == 1) {
            text("早口言葉を" + randnum + "番から順番に言え！(1回ずつ)", x, y);
            text("言えた人から抜けてOK！最後の人がデバフ獲得", x, y + qLetter + 10);
        }
        textSize(bLetter);
        text(body, x, y + qLetter * 2 + 100);     
    }        
}

void gameSetUp() {
    //カードの初期化
    gGames = new MiniGame[20]; //バフ用ゲーム
    dGames = new MiniGame[30]; //デバフ用ゲーム
    
    //バフゲームの設定
    gGames[0] = new MiniGame("んろぃはう", "秋のイベント", 0); //はろうぃん
    gGames[1] = new MiniGame("がつうしょお", "冬のイベント", 0); //おしょうがつ
    gGames[2] = new MiniGame("うんじびょた", "1年に1度、プレゼントがもらえるかも", 0); //たんじょうび
    gGames[3] = new MiniGame("すらーいれか", "料理、スパイスが美味しい", 0); //かれーらいす
    gGames[4] = new MiniGame("ほんそうれう", "食べ物、緑色", 0); //ほうれんそう
    gGames[5] = new MiniGame("どさっいんち", "料理、具に好みがあるかも", 0); //さんどいっち
    gGames[6] = new MiniGame("ぺんるーゃしぷし", "筆記用具", 0); //しゃーぷぺんしる
    gGames[7] = new MiniGame("ますとんーぉふ", "現代の必需品", 0); //すまーとふぉん
    gGames[8] = new MiniGame("すてぱぃっげ", "料理、フォークで食べる", 0); //すぱげってぃ
    gGames[9] = new MiniGame("まもいつさ", "食べ物、秋と言えば", 0); //さつまいも
    gGames[10] = new MiniGame("ぼっぺととる", "飲み物を買うと大抵これ", 0); //ぺっとぼとる
    gGames[11] = new MiniGame("みるいぬぐ", "ふわふわでかわいい", 0); //ぬいぐるみ
    gGames[12] = new MiniGame("まほぐっきょぐ", "動物、寒い地域にいる", 0); //ほっきょくぐま
    gGames[13] = new MiniGame("いじもゃが", "食べ物、結構万能な野菜", 0); //じゃがいも
    gGames[14] = new MiniGame("ぽぷてすちっと", "お菓子、パリパリ", 0); //ぽてとちっぷす
    gGames[15] = new MiniGame("りすすくま", "冬のイベント", 0); //くりすます
    gGames[16] = new MiniGame("れこぞうい", "一家に一台", 0); //れいぞうこ
    gGames[17] = new MiniGame("むいすおら", "料理、黄色と赤だね", 0); //おむらいす
    gGames[18] = new MiniGame("あびなげちうは", "夏祭りと言えばこれ", 0); //うちあげはなび
    gGames[19] = new MiniGame("っきとーけほ", "料理、ふんわり甘い", 0); //ほっとけーき
    
    //デバフゲームの設定
    dGames[0] = new MiniGame("赤巻紙 青巻紙 黄巻紙", "", 1);
    dGames[1] = new MiniGame("炙りカルビ", "", 1);
    dGames[2] = new MiniGame("生米 生麦 生卵", "", 1);
    dGames[3] = new MiniGame("隣の客は よく柿食う客だ", "", 1);
    dGames[4] = new MiniGame("すももも 桃も 桃のうち", "", 1);
    dGames[5] = new MiniGame("庭には 2羽 ニワトリがいる", "", 1);
    dGames[6] = new MiniGame("東京 特許 許可局", "", 1);
    dGames[7] = new MiniGame("坊主が 屏風に 上手に 坊主の 絵を描いた", "", 1);
    dGames[8] = new MiniGame("この釘は 引き抜きにくい 釘だ", "", 1);
    dGames[9] = new MiniGame("バス ガス 爆発", "", 1);
    dGames[10] = new MiniGame("魔術師 魔術 修行中", "", 1);
    dGames[11] = new MiniGame("右耳に ミニニキビ", "", 1);
    dGames[12] = new MiniGame("バナナの謎は まだ謎なのだぞ", "", 1);
    dGames[13] = new MiniGame("除雪車 除雪作業中", "", 1);
    dGames[14] = new MiniGame("肩たたき機 たたき壊すの", "", 1);
    dGames[15] = new MiniGame("学校 急遽 休校", "", 1);
    dGames[16] = new MiniGame("バナナの謎は まだ謎なのだぞ", "", 1);
    dGames[17] = new MiniGame("美術室 技術室 手術室", "", 1);
    dGames[18] = new MiniGame("右目右耳　右耳右目", "", 1);
    dGames[19] = new MiniGame("老若男女", "", 1);
    dGames[20] = new MiniGame("調査書 捜査中", "", 1);
    dGames[21] = new MiniGame("旅客機の旅客", "", 1);
    dGames[22] = new MiniGame("除雪車 除雪作業中", "", 1);
    dGames[23] = new MiniGame("投げやりなやり投げ", "", 1);
    dGames[24] = new MiniGame("授業中 頭上注意", "", 1);
    dGames[25] = new MiniGame("かけっこで コケかけた 過去", "", 1);
    dGames[26] = new MiniGame("左折車 専用車線", "", 1);
    dGames[27] = new MiniGame("シチュー 死守しつつ 試食", "", 1);
    dGames[28] = new MiniGame("新春シャンソンショー", "", 1);
    dGames[29] = new MiniGame("新設 診察室 視察", "", 1);
    // dGames[30] = new MiniGame("問題31", "", 1);
    // dGames[31] = new MiniGame("問題32", "", 1);
    // dGames[32] = new MiniGame("問題33", "", 1);
    // dGames[33] = new MiniGame("問題34", "", 1);
    // dGames[34] = new MiniGame("問題35", "", 1);
    // dGames[35] = new MiniGame("問題36", "", 1);
    // dGames[36] = new MiniGame("問題37", "", 1);
    // dGames[37] = new MiniGame("問題38", "", 1);
    // dGames[38] = new MiniGame("問題39", "", 1);
    // dGames[39] = new MiniGame("問題40", "", 1);
    // dGames[40] = new MiniGame("問題41", "", 1);
    // dGames[41] = new MiniGame("問題42", "", 1);
    // dGames[42] = new MiniGame("問題43", "", 1);
    // dGames[43] = new MiniGame("問題44", "", 1);
    // dGames[44] = new MiniGame("問題45", "", 1);
    // dGames[45] = new MiniGame("問題46", "", 1);
    // dGames[46] = new MiniGame("問題47", "", 1);
    // dGames[47] = new MiniGame("問題48", "", 1);
    // dGames[48] = new MiniGame("問題49", "", 1);
    // dGames[49] = new MiniGame("問題50", "", 1);
    
    //問題をランダムに並び替え
    for (int i = gGames.length - 1; i > 0; i--) {
        int j = (int)random(i + 1);
        //カードの交換
        MiniGame gGame = gGames[i];
        gGames[i] = gGames[j];
        gGames[j] = gGame;
    } 
    
    for (int i = dGames.length - 1; i > 0; i--) {
        int j = (int)random(i + 1);
        //カードの交換
        MiniGame dGame = dGames[i];
        dGames[i] = dGames[j];
        dGames[j] = dGame;
    } 
}
