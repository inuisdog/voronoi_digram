class Ball{
  float radius;
  color ballColor;
  PVector position;
  PVector velocity;
  Ball(float r, BallSet others){
    radius = r;
    ballColor = color((int)random(101), 100, 100);
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(2.0, 6.0), random(2.0, 6.0));
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
  void collide(Ball b){
    float dist = position.dist(b.position);
    if(dist <= radius + b.radius){
      float dx = abs(position.x - b.position.x);
      float dy = abs(position.y - b.position.y);
      float overlap = dist - (radius + b.radius);

      if(dx > dy){
        velocity.x *= -1;
        b.velocity.x *= -1;
      }
      else{
        velocity.y *= -1;
        b.velocity.y *= -1;
      }
    }
  }

  void draw(){
    noStroke();
    fill(ballColor);
    ellipse(position.x, position.y, 2 * radius, 2 * radius);
  }
}

class BallSet extends ArrayList<Ball>{
  BallSet(){
  }
  BallSet(int num, int r){
    for(int i = 0; i < num; i++)
    add(new Ball(r, this));
  }
  void update(){
    collide();
    move();
  }
  void move(){
    for(Ball b : this)
    b.move();
  }
  void collide(){
    for(int i = 0; i < size() - 1; i++)
    for(int j = i + 1; j < size(); j++)
    get(i).collide(get(j));
  }
  void draw(){
    for(Ball b : this)
    b.draw();
  }
}
