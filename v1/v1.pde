// TODO: ADD A WAY TO TRAIN OFF OF A SAVED NN, 
//        SO THAT WE CAN SAVE THE DUDE WHO DOES A LAP 
//        AND THEN RUN IT TO KEEP IMPROVING ON THE LAP TIME OVER AND OVER
// DISPLAY LAP TIMES


boolean[] heldKeys = {false, false, false, false};  // up, down, left, right
Track track = new Track("");
Population pop;
Car humanCar;
HUD hud = new HUD();
float globalMutationRate = 0.15;  // 0.1
boolean humanPlaying = true;
boolean showBest = false;
boolean saveBest = false;
boolean runBest = false;
boolean paused = true;
int lap = 1;
float bestFitness = 0;
int bestCarLap = 1;
int speed = 60;
int alive;

void setup() {
  size(1200, 800);  // 1200, 800
  
  if (humanPlaying) humanCar = new Car();
  else pop = new Population(300);  // 200, 500
  //smooth();
  //track.makePoints();
  //track.drawPoints();
}

void draw() {
  if (!paused) {
    background(0, 130, 0);
    track.draw();
    
    if (humanPlaying) {
      if (humanCar.alive) {
        hud.draw(humanCar.lap,humanCar.time, humanCar.lapTime, humanCar.bestTime);
        if (heldKeys[0]) humanCar.accelerate(); 
        if (heldKeys[1]) humanCar.brake();
        if (heldKeys[2]) humanCar.turnLeft();
        if (heldKeys[3]) humanCar.turnRight();
        track.carSensors(humanCar);
        humanCar.move();
        humanCar.draw();
      } else {
        humanCar = new Car();
      }
    } else if (runBest) {
      if (pop.bestCar.alive) {  //if best player is alive
        pop.bestCar.look();
        pop.bestCar.think();     
        pop.bestCar.move();
        pop.bestCar.draw();  
      } else {  // once best player is dead
        runBest = false;
        pop.bestCar = pop.bestCar.clone();
      }
    } else {  // if just evolving normally
      if (!pop.done()) {  //if any players are alive then update them
        //println("***********************************");
        hud.draw("Gen: "+str(pop.gen), "Alive: "+str(alive), "Best Lap: "+str(bestCarLap),  "Prev Fitness: "+str(bestFitness));
        pop.updateAlive();
      } else {  //all dead, do genetic algorithm shit
        pop.calculateFitness(); 
        pop.naturalSelection();
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') paused = !paused;
  if (key == 'b') showBest = !showBest;
  if (key == 's') saveBest = true;  // pop.cars[0].saveCar(pop.bestCarNo[0], pop.cars[pop.bestCarNo[0]].fitness);
  if (key == '1') speed = 60; frameRate(speed);
  if (key == '2') speed = 120; frameRate(speed);
  if (key == '3') speed = 180; frameRate(speed);
  if (key == '=') globalMutationRate += 0.05;
  if (key == '-') globalMutationRate -= 0.05;
  if (key == CODED) {
    if (keyCode == UP) heldKeys[0] = true;
    if (keyCode == DOWN) heldKeys[1] = true;
    if (keyCode == LEFT) heldKeys[2] = true;
    if (keyCode == RIGHT) heldKeys[3] = true;
  }
  if (!humanPlaying) println("speed: "+speed, " showBest: "+showBest, " MR: "+globalMutationRate);
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) heldKeys[0] = false;
    if (keyCode == DOWN) heldKeys[1] = false;
    if (keyCode == LEFT) heldKeys[2] = false;
    if (keyCode == RIGHT) heldKeys[3] = false;
  }
}



//int i = 0;
//void mousePressed() {
//  println("innerPoints[" + i + "] = new PVector(" + mouseX + ", " + mouseY + ");");
//  i++;
//}


//void debugTrackPos() {
//  for (int x=0; x < width; x++) {
//    for (int y=0; y < height; y++) {
//      if (track.checkPos(x,y)) {
//        stroke(0,255,0); 
//      } else {
//        stroke(255,0,0); 
//      }
//      ellipse(x,y,0.5,0.5);
//    }
//  } 
//}


//boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  
//  // calculate the distance to intersection point
//  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
//  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

//  // if uA and uB are between 0-1, lines are colliding
//  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {

//    // optionally, draw a circle where the lines meet
//    float intersectionX = x1 + (uA * (x2-x1));
//    float intersectionY = y1 + (uA * (y2-y1));
//    fill(255,0,0);
//    noStroke();
//    ellipse(intersectionX,intersectionY, 20,20);

//    return true;
//  }
//  return false;
//}
