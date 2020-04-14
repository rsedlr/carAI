
class Track {
  PVector[] outerPoints;
  PVector[] innerPoints;
  PVector[] preFinLine = new PVector[2];
  PVector[] finishLine = new PVector[2];
  PVector start;
  float startAngle = 0;
  int pointLen;
    
  Track(String type) {   
    if (type == "" || type == "default") {
      outerPoints = new PVector[34];
      innerPoints = new PVector[34];
      //start = new PVector(830, 107);  // start at top
      start = new PVector(630, 725);
      startAngle = -PI/2;
    } else if (type == "new") {
      outerPoints = new PVector[44];
      innerPoints = new PVector[44];
      start = new PVector(830, 107);
      startAngle = 0;
    }
    setPoints(type, innerPoints, outerPoints, finishLine, preFinLine);
    
    pointLen = outerPoints.length;
  }
  
  public void draw() {    
    stroke(0);
    fill(50);    
    strokeWeight(5);    
    beginShape();
      for (int i=0; i < pointLen; i++) {
        vertex(outerPoints[i].x, outerPoints[i].y);
      }
    endShape(CLOSE);  // CLOSE 
    
    fill(0,130,0);
    beginShape();
      for (int i=0; i < innerPoints.length; i++) {  // pointLen
        vertex(innerPoints[i].x, innerPoints[i].y);
      }
    endShape(CLOSE);  // CLOSE
    
    stroke(255);
    line(finishLine[0].x, finishLine[0].y, finishLine[1].x, finishLine[1].y);
    //line(preFinLine[0].x, preFinLine[0].y, preFinLine[1].x, preFinLine[1].y);
    
    //stroke(0,0,255);  // checkpoints
    //for (int i=0; i < innerPoints.length; i++) {  
    //  line(innerPoints[i].x, innerPoints[i].y, outerPoints[i].x, outerPoints[i].y); 
    //}
    //textSize(15);
    //fill(255);
    //stroke(255,0,0);
    //strokeWeight(10);
    //for (int i=0; i < pointLen; i++) {
    //  point(outerPoints[i].x, outerPoints[i].y);
    //  text(i, outerPoints[i].x, outerPoints[i].y); 
    //}
    //stroke(0,255,0);
    //for (int i=0; i < innerPoints.length; i++) {
    //  point(innerPoints[i].x, innerPoints[i].y);
    //  text(i, innerPoints[i].x, innerPoints[i].y); 
    //}
    
  } 
  
  boolean onTrack(Car car) {     
    float x1 = car.x + car.edges[0].x;  
    float x2 = car.x + car.edges[1].x;
    float x3 = car.x - car.edges[0].x;
    float x4 = car.x - car.edges[1].x;
    float y1 = car.y + car.edges[0].y;
    float y2 = car.y + car.edges[1].y;
    float y3 = car.y - car.edges[0].y;    
    float y4 = car.y - car.edges[1].y;
    
    // check if touching finishLine lines
    if (lineTouch(x1,y1,x2,y2, finishLine[0].x, finishLine[0].y, finishLine[1].x, finishLine[1].y) ||
        lineTouch(x3,y3,x4,y4, finishLine[0].x, finishLine[0].y, finishLine[1].x, finishLine[1].y)) {
      if (car.preFinLine && !car.onFinishLine) car.newLap();
    } else {
      car.onFinishLine = false; 
    }
    if (lineTouch(x1,y1,x2,y2, preFinLine[0].x, preFinLine[0].y, preFinLine[1].x, preFinLine[1].y) ||
        lineTouch(x3,y3,x4,y4, preFinLine[0].x, preFinLine[0].y, preFinLine[1].x, preFinLine[1].y)) {
      car.preFinLine = true;
    } 
    
    //check if touching CP
    for (int i=0; i < pointLen; i++) {
      if (lineTouch(x1,y1,x2,y2, outerPoints[i].x, outerPoints[i].y, innerPoints[i].x, innerPoints[i].y) ||
          lineTouch(x3,y3,x4,y4, outerPoints[i].x, outerPoints[i].y, innerPoints[i].x, innerPoints[i].y)) {
        car.cp[i] = true;
      }
    }
    
    // check if on track
    for (int i=0; i < pointLen; i++) {  // only works if outerlength == innerlength
      int s = i+1;
      if (s == pointLen) s = 0;
      if (lineTouch(x1,y1,x2,y2, outerPoints[i].x, outerPoints[i].y, outerPoints[s].x, outerPoints[s].y) || 
          lineTouch(x3,y3,x4,y4, outerPoints[i].x, outerPoints[i].y, outerPoints[s].x, outerPoints[s].y) ||
          lineTouch(x1,y1,x2,y2, innerPoints[i].x, innerPoints[i].y, innerPoints[s].x, innerPoints[s].y) ||
          lineTouch(x3,y3,x4,y4, innerPoints[i].x, innerPoints[i].y, innerPoints[s].x, innerPoints[s].y)) return false; 
    }
    return true;
  }
  
  public float[] carSensors(Car car) {
    float dist1;
    float dist2;
    int pointLen = outerPoints.length;
    float[] distances = new float[car.sensors.length]; 
    for (int j=0; j < car.sensors.length; j++) {
      for (int i=0; i < pointLen; i++) {
        int s = i+1;
        if (s == pointLen) s = 0;
        //stroke(255);  // testing stuff
        //strokeWeight(1);
        //line(car.x, car.y, car.x+car.sensors[j].x, car.y+car.sensors[j].y);
        //fill(255, 0, 0);
        //text(j, car.x+car.sensors[j].x, car.y+car.sensors[j].y);
        //strokeWeight(10);
        //stroke(255,0,0);
        dist1 = lineDistance(car.x, car.y, car.x+car.sensors[j].x, car.y+car.sensors[j].y, outerPoints[i].x, outerPoints[i].y, outerPoints[s].x, outerPoints[s].y);
        dist2 = lineDistance(car.x, car.y, car.x+car.sensors[j].x, car.y+car.sensors[j].y, innerPoints[i].x, innerPoints[i].y, innerPoints[s].x, innerPoints[s].y);
        
        if (dist1 != 0 && dist2 != 0) {  // maybe clean this up if possible
          if (dist1 < dist2) {
            if (dist1 < distances[j] || distances[j] == 0) {
              distances[j] = dist1;
            }
          } else {
            if (dist2 < distances[j] || distances[j] == 0) {
              distances[j] = dist2;
            }
          }
        } else if (dist1 != 0) {
          if (dist1 < distances[j] || distances[j] == 0) {
            distances[j] = dist1;
          }
        } else if (dist2 != 0) {
          if (dist2 < distances[j] || distances[j] == 0) {
            distances[j] = dist2;
          }
        }
      }
    }
    return distances;
  }
  
  
  boolean lineTouch(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) return true;
    return false;
  }
  
  float lineDistance(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
      //float intersectionX = x1 + (uA * (x2-x1));
      //float intersectionY = y1 + (uA * (y2-y1));
      //point(intersectionX, intersectionY);
      return sqrt(sq((uA * (x2-x1))) + sq((uA * (y2-y1))));  // return distance
    }
    return 0;
  }
  
}
