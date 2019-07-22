int time = 0;
int rocketCount = 20;
float gravity = 1.21;
Rocket[] rockets;
Sky sky;

void setup(){
  //size(800,800);
  fullScreen();
  rocketCount = int(width/40); //40
  sky = new Sky();
  rockets = new Rocket[rocketCount];
  for(int i = 0; i < rocketCount; i++){
    rockets[i] = new Rocket();
  }
}

void draw(){
  time += 1;
  sky.display();
  for (int i = 0; i < rocketCount; i++){
    if(rockets[i].dead){
      rockets[i] = new Rocket();
    }
    rockets[i].display();
  }
}
