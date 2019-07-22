class Rocket{
  float start;
  float timer;
  float xPos;
  float yPos;
  float speed;
  float size;
  int cnt;
  int red;
  int green;
  int blue;
  boolean dead = false;
  Particle[] particles;
  
  Rocket(){
    start = int(random(0, 300));
    speed = random(6, 16);
    timer = random(height/speed*.25, height/speed*.95);
    xPos  = random(width/100*5, width/100*95);
    yPos  = height;
    size  = speed/11;
    cnt = int(random(8, 32));
    red   = 200;
    green = 120;
    blue  = 50;
    particles = new Particle[cnt];
  }
  
  void display(){
    if(start == 0){
      if(timer > 0){
        stroke(230, 100, 0);
        fill(230, 50, 50);
        quad(xPos-size, yPos-size, xPos-size, yPos+size, xPos+size, yPos+size, xPos+size, yPos-size);
        for (int i = 0; i < 20; i++){
          stroke(red, green, blue, 210-i*10);
          fill(red, green, blue, 210-i*10);
          quad(xPos-size, yPos-size+i*size, xPos-size, yPos+size+i*size, xPos+size, yPos+size+i*size, xPos+size, yPos-size+i*size);
        }
        move();
      } else if (timer < 0 && timer > -1){
        createParticles();
      } else{
        int deaths = 0;
        for(int i = 0; i < cnt; i++){
          if(!particles[i].dead){
            particles[i].display();
            particles[i].move();
          } else{
            deaths +=  1;
          }
        }
        if(deaths == cnt){
          dead = true;
        }
      }
    }
    if(start > 0) {start -= 1;}
  }
  
  void createParticles(){
    int colSeed = int(random(0, 5));
    color particleColor = createColor(colSeed);
    for(int i = 0; i < cnt; i++){
      particles[i] = new Particle(particleColor, xPos, yPos, (360/cnt)*i, size);
      stroke(180, 100, 0, 30);
      fill(180, 100, 50, 30);
      ellipse(xPos, yPos, 26, 26);
    }
    timer -= 1;
  }
  
  void move(){
     yPos -= speed;
     timer -= 1;
  }
  
  color createColor(int seed){
    color c;
    switch(seed){
      case 0:
        return c = color(int(random(150, 255)), int(random(0, 100)), int(random(0, 100)));
      case 1:
        return c = color(int(random(0, 100)), int(random(150, 255)), int(random(0, 100)));
      case 2:
        return c = color(int(random(0, 100)), int(random(0, 100)), int(random(150, 255)));
      case 3:
        return c = color(int(random(150, 255)), int(random(150, 255)), int(random(0, 100)));
      case 4:
        return c = color(int(random(150, 255)), int(random(0, 100)), int(random(150, 255)));
      case 5:
        return c = color(int(random(0, 100)), int(random(150, 255)), int(random(150, 255)));
      default:
        return c = color(255,255,255);
    }
  }
}
