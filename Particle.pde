class Particle{
  color col;
  float xPos;
  float yPos;
  float direction;
  float acceleration;
  int life = int(random(60,130));//70;
  float size = 2.0;
  float speed;
  boolean dead = false;
  
  Particle(color c, float x, float y, float dir, float sizeMult){
    col = c;
    xPos = x;
    yPos = y;
    direction = dir;
    speed = random(.5, 0.9)*sizeMult;
    size = random(1, 2)*sizeMult;
    acceleration = random(2, 4);
  }
  
  void display(){
    if(life > 0){
      stroke(col, 255.0*(float(life)/70));
      fill(col, 255.0*(float(life)/70));
      quad(xPos-size, yPos-size, xPos-size, yPos+size, xPos+size, yPos+size, xPos+size, yPos-size);
    } else{
      dead = true;
    }
  }
  
  void move(){
    if(life > 0){
      xPos += sin(direction)*speed*acceleration;
      yPos += cos(direction)*speed*acceleration+gravity;
      life -= 1;
      if (acceleration > 1.00){
        acceleration *= .98;
        //acceleration -= .05;
      }
    }
  }
}
