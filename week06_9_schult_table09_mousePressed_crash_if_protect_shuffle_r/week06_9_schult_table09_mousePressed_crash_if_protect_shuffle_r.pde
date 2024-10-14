// week06_9_schult_table09_mousePressed_crash_if_protect_shuffle_random
//int [] used = new int[26]; //0...25 共26個
int [][] table = new int [5][5]; //Java的陣列宣告
void setup(){
  size(500, 600);
  textSize(50);
  textAlign(CENTER, CENTER);
  int []numbers = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};
  for(int i=numbers.length - 1; i>0; i--){
    int j = int(random(i+1));
    //交換位置
    int temp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = temp;
  }
  int index = 0;
  for(int i=0; i<5; i++){
    for(int j=0; j<5; j++){
      table[i][j] = numbers[index++];
    }
  }
  startT = millis(); //紀錄你開始的時間
}
int startT = 0;
int [][] pressed = new int[5][5];
void draw(){
  background(#FFFFF2);
  for(int i=0; i<5; i++){ //對y座標
    for(int j=0; j<5; j++){ //對x座標
    if(pressed[i][j]==1) fill(128);
    else fill(255);
      rect(j*100, i*100, 100, 100);
      fill(0); text(""+table[i][j], 50+j*100, 50+i*100);
    }
  }
  //text("*+hour()+*:"minute()+":"+second(), 200, 550);
  text("You used "+millis()/1000, 200, 550);
}
int want = 1; //希望你按的數字
void mousePressed(){
  int i = mouseY/100, j = mouseX/100;
  if(i >= 0 && i < 5 && i>= 0 && i < 5){
    pressed[i][j] = 1;
    want++;
  }
}