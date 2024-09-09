// week01_5_void_keyPressed_if_key_strokeWeight
void setup(){
  size(500,500);
}
void draw(){
  if(mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
} //如果 mouse按下去,就畫線 mouse的XY座標到 previous mouse XY
void keyPressed(){
  if(key=='1') strokeWeight(1);
  if(key=='2') strokeWeight(5);
  if(key=='3') strokeWeight(10);
  if(key=='4') stroke(255,0,0);
  if(key=='5') stroke(255,255,0);
  if(key=='6') stroke(0,255,0);
  if(key=='7') stroke(0,0,255);
  if(key=='8') stroke(255,0,255);
}//如果key按下去,看key的值,決定線的粗細
