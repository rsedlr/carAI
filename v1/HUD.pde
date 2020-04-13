
class HUD {
  float yOffset = 40;
  float lapPos = 1050;
  float timePos = 50;
  float prevTimePos = 350;
  float bestTimePos = 680;
  
  float x0 = 35;
  float x1 = 280;
  float x2 = 500;
  float x3 = 950;
  
  public void draw(int lap, float time, float prevTime, float bestTime) {
    fill(0); 
    textSize(32);
    text("Time: " + str((millis()-time)/1000), timePos, yOffset);
    text("prev time: " + str(prevTime/1000), prevTimePos, yOffset);
    text("best time: " + str(bestTime/1000), bestTimePos, yOffset);
    text("Lap: " + str(lap), lapPos, yOffset);
  }
  
  public void draw(String str1, String str2, String str3, String str4) {
    fill(0); 
    textSize(32);
    text(str1, x0, yOffset);
    text(str2, x1, yOffset);
    text(str3, x2, yOffset);
    text(str4, x3, yOffset);
  }
}
