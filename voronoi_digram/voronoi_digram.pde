BallSet balls;
void setup(){
size(600, 600);
colorMode(HSB, 100);
balls = new BallSet(10, 10);
}

void draw(){
  background(100);
  balls.update();
  balls.draw();
}
