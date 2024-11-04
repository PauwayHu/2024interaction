//week09_03_processing_sound 聲音相關 使用音樂相關的Library函式庫
// Sketch-Library-Manager Libraries 找 sound 可找到 Sound 函式庫 (Processing 基金會做的),安裝
// File-Examples, 選Libraries核心函式庫 剛剛裝的Sound 的 Soundfile的SimplePlayback或Jumble 或 JumbleSound
//我們自己寫[最精簡的版本]
import processing.sound.*;

SoundFile soundfile;

void setup(){
  size(500, 500);
  sound = new SoundFile(this, "In Game Music.mp3");
  //sound.play(); //播放1次
  sound.loop();
}
void draw(){
  
}
