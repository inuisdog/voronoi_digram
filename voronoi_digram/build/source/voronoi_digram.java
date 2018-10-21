import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class voronoi_digram extends PApplet {

Balls balls;
public void setup(){

colorMode(HSB, 100);
balls = new Balls(10, 20);
}

public void draw(){
  background(100);
  balls.update();
  balls.draw();
}
class Ball{
  PVector position;
  PVector velocity;
  PVector impluse;
  float radius;
  int ballColor;
  Ball(float r){
    position = new PVector(random(width), random(height));
    velocity = new PVector(random(0.5f, 3.0f), random(0.5f, 3.0f));
    impluse = new PVector(1, 1);
    radius = r;
    ballColor = color((int)random(101), 100, 100);
      }

  public void update(){
    //x update
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
    //y update
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

  public void draw(){
    noStroke();
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
  }
}

class Balls extends ArrayList<Ball>{
  Balls(int num, int r){
    for(int i = 0; i < num; i++)
    add(new Ball(r));
  }
public void update(){
  for(Ball b : this)
  b.update();
}

  public void draw(){
    for(Ball b : this)
    b.draw();
  }
}
  public void settings() { 
size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "voronoi_digram" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
