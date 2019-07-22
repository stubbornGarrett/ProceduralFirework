class Sky{
  int cnt;
  color col = color(200, 200, 150);
  color dustCol = color(50, 50, 70, 80);
  int cols = int(width/14);
  int rows = int(height/14);
  int shootingTimer;
  Star[] stars;
  Moon moon;
  ShootingStar shootingStar;
  Dust dust;
  
  Sky(){
    cnt = int((width*height)*0.00022);
    stars = new Star[cnt];
    shootingStar = new ShootingStar(int(random(10, 20))); //300 800
    
    for(int i = 0; i < cnt; i++){
      stars[i] = new Star(int(random(10, width)), int(random(10, height)), col);
    }
    
    moon = new Moon();
    dust = new Dust(dustCol);
  }
  
  void display(){
    background(4, 0, 30);
    
    for(int i = 0; i < cnt; i++) { stars[i].display(); }
    
    moon.display();
    
    if(!shootingStar.dead){
      shootingStar.display();
    }else{
      shootingStar = new ShootingStar(int(random(100, 500))); //100 500
    }
    
    dust.display();
  }
  
}

class Star{
  int xPos;
  int yPos;
  color colour;
  float diameter = random(1, 3);
  
  Star(int x, int y, color col){
    xPos = x;
    yPos = y;
    colour = col;
  }
  
  void display(){
    stroke(colour);
    fill(colour);
    float blink = random(0, .3);
    ellipse(xPos, yPos, diameter+blink, diameter+blink);
  }
}

class Moon{
  float diameter = 70;
  int xPos = int(width - int(diameter/2) - (width/100*30));
  int yPos = int(int(diameter/2) + height/100*20);
  color col = color(240, 240, 230);
  
  void display(){
    noStroke();
    fill(col);
    ellipse(xPos, yPos, diameter, diameter);
  }
}

class Dust{
  color col;
  
  Dust(color c){
    col = c;
  }
  
  void display(){
    //stroke(col);
    fill(col);
    quad(0.0, 0.0, 0.0, float(height), float(width), float(height), float(width), 0.0);
  }
}
