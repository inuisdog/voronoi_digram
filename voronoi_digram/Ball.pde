class Ball{
  float x;
  float y;
  float vx;
  float vy;
  float radius;
  color ballColor;
  Ball(float r){
    x = random(width);
    y = random(height);
    vx = random(0.5, 5);
    vy = random(0.5, 5);
    radius = r;
    ballColor = color((int)random(101), 100, 100);
      }

  void update(){
    //x update
    float nextX = x + vx;
    if(nextX <= 0){
      vx = -vx;
      x = abs(vx);
    }
    else if(nextX >= width){
      vx = -vx;
      x = width - abs(vx);
    }
    else
    x = nextX;
    //y update
    float nextY = y + vy;
    if(nextY <= 0){
      vy = -vy;
      y = abs(vy);
    }
    else if(nextY >= height){
      vy = -vy;
      y = height - abs(vy);
    }
    else
    y = nextY;

  }

  void draw(){
    noStroke();
    fill(ballColor);
    ellipse(x, y, radius, radius);
  }
}

class Balls extends ArrayList<Ball>{
  Balls(int num, int r){
    for(int i = 0; i < num; i++)
    add(new Ball(r));
  }
void update(){
  for(Ball b : this)
  b.update();
}

  void draw(){
    for(Ball b : this)
    b.draw();
  }
}
