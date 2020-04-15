
class Car {
  float wid = 16;
  float hei = 26;
  float x, y;
  float drag = 0.04;  //0.04
  float speed;
  float maxSpeed = 8 + drag;  // 5 for human
  float acceleration = 1;  // 0.15
  float angle;
  int lap = 1;
  int time;
  int lapTime;
  int bestTime;
  color col = color(255, 0, 0);  // (0,255,255)
  boolean alive = true;
  boolean onFinishLine = true;
  boolean preFinLine = false;
  int cpLen = track.pointLen;  // number of checkpoints
  boolean[] cp = new boolean[cpLen];
  
  PVector[] edges = {new PVector(wid/2, hei/2),
                     new PVector(wid/2, -hei/2)};
                     
  PVector[] sensors = {new PVector(0, -1000),  // forward 
                       new PVector(130, -450),  // forward right 1
                       new PVector(-130, -450),  // forward left 1                    
                       new PVector(200, -200),  // forward right 2
                       new PVector(-200, -200),  // forward left 2
                       new PVector(200, 0),  // right
                       new PVector(-200, 0),  // left
                       new PVector(200, 200),  // back right
                       new PVector(-200, 200)};  // back left
                       //new PVector(0, 1000)  // back
  // AI stuffs
  NeuralNet brain;
  float fitness = 0;
  boolean replay = false;  // whether the player is being replayed                
  float[] distances = new float[sensors.length];  // distances from car sensors
  float[] decision = new float[4]; // the output of the NN


  Car() {
    x = track.start.x;
    y = track.start.y;
    angle = track.startAngle;
    rotateVectors(angle);
    brain = new NeuralNet(sensors.length, 16, 4);  // 16
  }

  public void draw() {
    pushMatrix();
    fill(col);
    stroke(col);
    strokeWeight(0);
    translate(x, y);
    rotate(angle);
    rect(0, 0, wid, hei);  // (0, -10)
    fill (255);
    stroke(255);
    rect(2, 0, 3, hei);  // go faster stripes
    rect(-2, 0, 3, hei);
    fill (0);
    stroke(0);
    rect(0, -3, 12, 4);  // windscreen
    rect(5, 0, 2, 10);  // right side window
    rect(-5, 0, 2, 10);  // left side window
    rect(wid/2+1, hei/2-4, 2, 8);  // tyres
    rect(-wid/2-1, hei/2-4, 2, 8);
    rect(wid/2+1, -hei/2+4, 2, 8);
    rect(-wid/2-1, -hei/2+4, 2, 8);
    //rotate(-angle);
    //translate(-x,-y);  // put screen back to how it was
    popMatrix();
  }

  void move() {
    if (speed - drag > 0) {
      speed -= drag;
    } else {
      speed = 0;
    }
    x -= speed * sin(-angle);
    y -= speed * cos(-angle);
    if (!track.onTrack(this) || (speed == 0 && !humanPlaying))  kill();  // check if car is off track, if so kill the mofo
  }



  void accelerate() {
    float curAcceleration = acceleration/(speed+5);
    if (speed+curAcceleration < maxSpeed) {
      speed += curAcceleration;
    } else {
      speed = maxSpeed;
    }
  }
  void brake() {
    if (speed > 0.05) {
      speed -= 0.05;
    }
    else {
      speed = 0; 
    }
  } 
  
  float rotateAmount() {
    return 1/(speed*6+10);
  }
  
  void rotateVectors(float angle) {
     for (int i=0; i < edges.length; i++) {
      edges[i].rotate(angle);
    }
    for (int i=0; i < sensors.length; i++) {
      sensors[i].rotate(angle);
    }
  }

  void turnLeft() {
    if (speed > 0.02) {
      float amount = rotateAmount(); 
      angle -= amount;
      rotateVectors(-amount);
    }
  }
  void turnRight() {
    if (speed > 0.02) {
      float amount = rotateAmount(); 
      angle += amount; 
      rotateVectors(amount);
    }
  }
  
  void newLap() {
    onFinishLine = true;
    preFinLine = false;
    lap++;
    if (lap > bestCarLap) bestCarLap = lap;
    if (lap > 0) {
       lapTime = millis() - time;
       if (lapTime < bestTime || bestTime == 0) bestTime = lapTime;
    }
    time = millis();
    cp = new boolean[cpLen];
    //println(lapTime); 
  }
  
  //void reset() {
  //  x = track.start.x;
  //  y = track.start.y;
  //  angle = track.startAngle;
  //  speed = 0;
  //  onFinishLine = true;
  //}
  
  void kill() {
    alive = false;
    //println("car died");
    //reset();
  }
  
  // AI stuffs
  void think() {
    decision = brain.output(distances);  // 0.8
    if (decision[0] > 0.8) accelerate();
    if (decision[1] > 0.8) brake(); 
    if (decision[2] > 0.8) turnLeft(); 
    if (decision[3] > 0.8) turnRight(); 
  }
  
  void look() {
    distances = track.carSensors(this);
    //println("********************");
    //println(distances);
  }
  
  void calculateFitness() {
    if (lap > 1) {
      fitness = cpLen * (lap-1) * (50000/lapTime);
    }
    for (int i=0; i < cpLen; i++) {
      if (cp[i]) fitness++;
    }
    fitness *= fitness;
    //return fitness;
  }
  
  void mutate(boolean force) {
    if (force) {
      brain.mutate(1);
    } else {
      brain.mutate(globalMutationRate);
    }
  }
  
  Car clone() {  // clone()
     Car clone = new Car(); 
     clone.brain = brain.clone();
     return clone;
  }
  
  Car crossover(Car parent2) {
    Car child = new Car();
    child.brain = brain.crossover(parent2.brain);
    return child;
  } 
  
  void saveCar(int carNo, int gen) {  //save the players top score and its population id 
    saveTable(brain.NetToTable(), "data/car" + carNo + "-gen"+ gen + "-fit" + bestFitness + ".csv");  // normal fitness wasnt working
  }
  
  Car loadCar(int carNo) {
    Car load = new Car();
    Table t = loadTable("data/player" + carNo + ".csv");
    load.brain.TableToNet(t);
    return load;
  }
  
}

//edges[0] = new PVector(x + wid/2, y + hei/2);
//edges[1] = new PVector(x + wid/2, y - hei/2); 
//edges[2] = new PVector(x - wid/2, y + hei/2);
//edges[3] = new PVector(x - wid/2, y - hei/2);
