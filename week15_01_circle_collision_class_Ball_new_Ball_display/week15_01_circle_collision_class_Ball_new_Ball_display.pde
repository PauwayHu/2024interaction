// week15_01_circle_collision_class_Ball_new_Ball_display
// google: processing collision detection library
// https://processing.org/examples/circlecollis
void setup(){
  size(640, 360);
}
Ball ball = new Ball(100, 400, 20);
void draw(){
  ball.display();
}
class Ball{
  float x, y, r;
  Ball(int x0, int y0, int r0){
    x = x0;
    y = y0;
    r = r0;
  }
  void display(){
    ellipse(x, y, r+r, r+r);
  }
}
