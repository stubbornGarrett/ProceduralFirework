class ShootingStar{
  float xPos;
  float yPos;
  float dir;
  float vel;
  float dia;
  int countdown;
  int timer;
  int start;
  boolean dead = false;
  
  ShootingStar(int n){
    countdown = n;
    timer = int(random(30, 40));
    start = timer;
    vel   = random(27, 42);
    dia   = random(4, 9);
    xPos  = random(width /100*5, width -(width /100*5));
    yPos  = random(height/100*5, height-(height/100*5));
    if(xPos < width/2 && yPos > height/2){
      dir = random(0,30);
    }else if (xPos < width/2 && yPos < height/2){
      dir = random(0,30)-30;
    }else if (xPos > width/2 && yPos > height/2){
      dir = random(150,180);
    }else if (xPos > width/2 && yPos < height/2){
      dir = random(180,210);
    }
  }
  
  void display(){
    if (countdown <= 0 && timer > 0){
      noStroke();
      fill(230, 200, 20);
      ellipse(xPos, yPos, dia*(float(timer)/float(start)), dia*(float(timer)/float(start)));
      street();
      move();
    } else if (timer <= 0){
      dead = true;
    }else{
      countdown -= 1;
    }
  }
  
  void street(){
    for(int i = 0; i < 170; i++){
      noStroke();
      fill(int(230*((110-float(i))/110)), int(200*((110-float(i))/110)), int(50*((110-float(i))/110)), int((255*((110-float(i))/110)))/2);
      ellipse(xPos-cos(PI*dir/180.0)*i, yPos+sin(PI*dir/180.0)*i, dia/110*(110-i)*(float(timer)/float(start)), dia/110*(110-i)*(float(timer)/float(start)));
    }
  }
  
  void move(){
    xPos += cos(PI*dir/180.0)*vel;
    yPos -= sin(PI*dir/180.0)*vel;
    timer -= 1;
  }
}
