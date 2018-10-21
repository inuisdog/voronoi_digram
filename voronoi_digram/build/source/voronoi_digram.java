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
  float x;
  float y;
  float vx;
  float vy;
  float radius;
  int ballColor;
  Ball(float r){
    x = random(width);
    y = random(height);
    vx = random(0.5f, 5);
    vy = random(0.5f, 5);
    radius = r;
    ballColor = color((int)random(101), 100, 100);
      }

  public void update(){
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

  public void draw(){
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
