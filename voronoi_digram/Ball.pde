class Ball{
  float radius;
  color ballColor;
  PVector position;
  PVector velocity;
  PVector impluse;
  BallSet otherBalls;
  Ball(float r, BallSet others){
    radius = r;
    ballColor = color((int)random(101), 100, 100);
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(0.5, 3.0), random(0.5, 3.0));
    impluse = new PVector(1, 1);
    otherBalls = new BallSet();
    for(Ball b : others){
      otherBalls.add(b);
      b.otherBalls.add(this);
    }
  }

  void move(){
    //x direction
    float nextX = position.x + velocity.x;
    if(nextX <= 0){
      velocity.x = -velocity.x;
      position.x = abs(velocity.x);
    }
    else if(nextX >= width){
      velocity.x = -velocity.x;
      position.x = width - abs(velocity.x);
    }
    else
    position.x = nextX;
    //y direction
    float nextY = position.y + velocity.y;
    if(nextY <= 0){
      velocity.y = -velocity.y;
      position.y = abs(velocity.y);
    }
    else if(nextY >= height){
      velocity.y = -velocity.y;
      position.y = height - abs(velocity.y);
    }
    else
    position.y = nextY;
  }

  void draw(){
    noStroke();
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
  }
}

class BallSet extends ArrayList<Ball>{
  BallSet(){
  }
  BallSet(int num, int r){
    for(int i = 0; i < num; i++)
    add(new Ball(r, this));
  }
  void move(){
    for(Ball b : this)
    b.move();
  }
  void draw(){
    for(Ball b : this)
    b.draw();
  }
}
