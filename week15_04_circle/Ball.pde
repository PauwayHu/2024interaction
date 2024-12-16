class Ball {
  float x, y, r;
  float vx, vy;

  // 建構子，初始化位置、半徑和速度
  Ball(int x0, int y0, int r0) {
    x = x0;
    y = y0;
    r = r0;
    vx = random(-10, +10);
    vy = random(-10, +10);
  }

  // 碰撞檢查與反彈處理
  boolean checkCollision(Ball other) {
    // 計算兩個小球的距離
    float d = dist(x, y, other.x, other.y);
    
    // 如果小球之間的距離小於半徑總和，表示發生碰撞
    if (d < r + other.r) {
      // 計算碰撞的法向量
      PVector diff = new PVector(other.x - x, other.y - y);
      float len = diff.mag(); // 法向量的長度
      diff.normalize(); // 將法向量單位化

      // 計算兩個小球的相對速度
      PVector v1 = new PVector(vx, vy);
      PVector v2 = new PVector(other.vx, other.vy);

      // 計算相對速度在法向量上的分量（即兩個小球接近的速度）
      float velocityAlongNormal = v1.dot(diff) - v2.dot(diff);

      // 如果兩個小球的相對速度在法向量方向上是接近的，就處理碰撞反彈
      if (velocityAlongNormal > 0) {
        // 彈性碰撞的反彈處理
        float e = 1.0; // 彈性係數（1為完全彈性碰撞）
        
        // 計算碰撞的動量
        float j = (-(1 + e) * velocityAlongNormal) / 2.0;

        // 計算並應用碰撞後的速度變化（動量變化）
        PVector impulse1 = diff.copy().mult(j); // 第一顆球的動量變化
        PVector impulse2 = diff.copy().mult(-j); // 第二顆球的動量變化

        // 更新速度
        vx += impulse1.x;
        vy += impulse1.y;
        other.vx += impulse2.x;
        other.vy += impulse2.y;
      }
      return true; // 發生了碰撞
    }
    return false; // 沒有碰撞
  }

  // 更新小球位置
  void update() {
    // 檢查是否碰到邊界，若碰到則反彈
    if (x + vx > 640 || x + vx < 0) vx = -vx; // 水平邊界
    if (y + vy < 0 || y + vy > 360) vy = -vy; // 垂直邊界
    x += vx;
    y += vy;
  }

  // 顯示小球
  void display() {
    ellipse(x, y, r * 2, r * 2);
  }
}
