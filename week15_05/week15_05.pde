///week15_05
int [][] maze = {
  {1,1,1,1,1,1,1,1,1,1},
  {1,0,0,1,1,0,0,0,1,1},
  {1,1,0,1,1,0,1,0,1,1},
  {1,1,0,0,1,0,1,0,1,1},
  {1,1,1,0,0,0,1,0,1,1},
  {1,0,1,1,0,1,1,0,1,1},
  {1,0,0,0,0,1,1,0,1,1},
  {1,0,1,1,1,1,1,0,1,1},
  {1,0,0,0,0,1,1,0,0,1},
  {1,1,1,1,1,1,1,1,1,1},
};

int [][] visited = new int [10][10];
int startI = 1, startJ = 1, step = 1;

void setup(){
  size(400, 400);
  visited[startI][startJ] = step;  // 用 startI 和 startJ 作為起點
  textSize(12);  // 設定顯示文字的字體大小，讓步數顯示清楚
}

void draw(){
  background(255);  // 清除背景

  // 繪製迷宮
  for(int i = 0; i < maze.length; i++) {
    for(int j = 0; j < maze[0].length; j++) {
      if(maze[i][j] == 1) {
        fill(0);  // 牆壁顏色
      } else {
        fill(255);  // 空白路徑顏色
      }
      rect(j * 40, i * 40, 40, 40);
    }
  }

  // 繪製起點（紅色）
  fill(255, 0, 0);
  rect(startJ * 40, startI * 40, 40, 40);

  // 顯示已走過的步數
  for(int i = 0; i < maze.length; i++) {
    for(int j = 0; j < maze[0].length; j++) {
      if(visited[i][j] > 0) {
        fill(0, 0, 255);  // 訪問過的格子顯示藍色
        text(visited[i][j], j * 40 + 15, i * 40 + 25);  // 顯示步數
      }
    }
  }
}

// 深度優先搜尋 (DFS) 函數
boolean DFS(int i, int j, int s) {
  // 假如找到出口（7,7），則返回 true
  if(i == 7 && j == 7) return true;

  // 如果當前位置是牆壁或已經訪問過，則返回 false
  if(maze[i][j] == 1 || visited[i][j] > 0) return false;

  // 記錄當前位置的步數
  visited[i][j] = s;

  // 嘗試向四個方向搜尋
  if(DFS(i + 1, j, s + 1)) return true;  // 向下
  if(DFS(i - 1, j, s + 1)) return true;  // 向上
  if(DFS(i, j + 1, s + 1)) return true;  // 向右
  if(DFS(i, j - 1, s + 1)) return true;  // 向左

  // 回溯，將當前位置重設為 0
  visited[i][j] = 0;
  return false;
}

// 當點擊鼠標時，重新開始 DFS
void mousePressed(){
  // 重設訪問狀態並重新執行 DFS
  for (int i = 0; i < visited.length; i++) {
    for (int j = 0; j < visited[0].length; j++) {
      visited[i][j] = 0;
    }
  }
  DFS(startI, startJ, 1);
}
