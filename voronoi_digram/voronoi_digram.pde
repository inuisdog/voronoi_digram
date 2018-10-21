Balls balls;
void setup(){
size(600, 600);
colorMode(HSB, 100);
balls = new Balls(10, 20);
}

void draw(){
  background(100);
  balls.update();
  balls.draw();
}
