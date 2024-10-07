// week05_01_cwa_typhoon_images 把老師 github.com/jsyeh/cwa 的圖檔放入
// 老師準備了 list.txt 裡面有299行
int N = 299; //剛好有299張圖
PImage [] imgs = new PImage[299]; //準備好 299張圖 對應的陣列
void setup(){
  size(800, 800);
  //把list.txt的299行,放入 filenames
  String [] filenames = loadStrings("list.txt"); 
  for(int i=0; i<N; i++){ // 把每一張圖,都讀進來
    imgs[i] = loadImage(filenames[i]);
  } // 這個迴圈,會跑很久,因為圖檔很多
}
void draw(){
  int i = frameCount%N; // 照時間輪 %N 取餘數,以免超過陣列大小
  background(imgs[frameCount%N]); // 現在要顯示地i張圖
}
