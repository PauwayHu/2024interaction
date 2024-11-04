 // week09_1_createFont_laodFont_textFont
 size(500, 500); //大視窗
 background(0); //黑色背景
 textSize(50);
 text("Hello",50, 50);

 PFont font = createFont("標楷體", 50);
 textFont(font);
 text("中文看到了", 50, 150);
 
 PFont font2 = createFont("elffont-rock.otf", 50);
 textFont(font2); //記得把字形,點兩下,安裝,才能順利 createFont()
 text("ㄑㄋㄇㄉ", 50, 250);
